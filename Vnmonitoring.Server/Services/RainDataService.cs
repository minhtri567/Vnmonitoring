using System.Text.Json;
using System.Text.Json.Serialization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Vnmonitoring.Server.Models;
using Vnmonitoring.Server.Utilities;

namespace Vnmonitoring.Server.Services
{
    public class RainHourlyStationData
    {
        [JsonPropertyName("StationNo")]
        public string StationNo { get; set; }

        [JsonPropertyName("StationName")]
        public string StationName { get; set; }

        [JsonPropertyName("StationNameVn")]
        public string StationNameVn { get; set; }

        [JsonPropertyName("Lat")]
        public double? Lat { get; set; }

        [JsonPropertyName("Lon")]
        public double? Lon { get; set; }

        [JsonPropertyName("ProjectID")]
        public int? ProjectID { get; set; }

        [JsonPropertyName("DtDate")]
        public DateTime? DtDate { get; set; }

        [JsonPropertyName("Value")]
        public float? Value { get; set; }
    }
    public class MyConfig
    {
        public string ApiBaseUrl { get; set; }
    }
    public class RainDataService : IRainDataService
    {
        private readonly HttpClient _httpClient;
        private readonly WeatherDataContext _context;
        private readonly ILogger<RainDataService> _logger;
        private readonly string _apiBaseUrl;
        public RainDataService(HttpClient httpClient, WeatherDataContext context, ILogger<RainDataService> logger, IOptions<MyConfig> config)
        {
            _httpClient = httpClient;
            _context = context;
            _apiBaseUrl = config.Value.ApiBaseUrl;
            _logger = logger;
        }

        public async Task FetchAndStoreRainDataAsync()
        {
            var vietnamNow = TimeZoneHelper.GetVietnamNow();
            var hourTime = new DateTime(vietnamNow.Year, vietnamNow.Month, vietnamNow.Day, vietnamNow.Hour, 0, 0);
            // Raw SQL (DELETE) đọc kiểu cột thật từ schema (timestamptz) -> cần Kind=Utc.
            // EF SaveChanges (INSERT) dùng annotation cứng trong WeatherDataContext
            // ("timestamp without time zone") -> cần Kind=Unspecified. Cùng 1 giá trị giờ VN,
            // chỉ khác nhãn Kind cho từng đường ghi.
            var hourTimeForRawSql = DateTime.SpecifyKind(hourTime, DateTimeKind.Utc);
            var dateString = hourTime.ToString("yyyyMMdd'T'HHmm'Z'");
            var url = $"{_apiBaseUrl.TrimEnd('/')}/rain1hbyhour/datetime/{dateString}";

            var response = await _httpClient.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                var result = await response.Content.ReadAsStringAsync();
                var jsonPayload = result.TrimStart();

                // API có thể trả về JSON bị encode 2 lần (response body là 1 JSON string
                // chứa mảng JSON bên trong, ví dụ: "[{\"StationNo\":\"780028\"...}]")
                if (jsonPayload.StartsWith("\""))
                {
                    try
                    {
                        jsonPayload = JsonSerializer.Deserialize<string>(jsonPayload) ?? jsonPayload;
                    }
                    catch (JsonException)
                    {
                        // không phải chuỗi hợp lệ, giữ nguyên payload gốc để log lỗi bên dưới
                    }
                }

                List<RainHourlyStationData>? stations;
                try
                {
                    stations = JsonSerializer.Deserialize<List<RainHourlyStationData>>(jsonPayload);
                }
                catch (JsonException ex)
                {
                    var preview = result.Length > 2000 ? result.Substring(0, 2000) : result;
                    _logger.LogError(ex, "Không parse được JSON từ API mưa cho giờ {HourTime}. Raw response (tối đa 2000 ký tự): {Preview}", hourTime, preview);
                    return;
                }

                if (stations == null || stations.Count == 0)
                {
                    _logger.LogWarning("Không có dữ liệu mưa trả về cho giờ {HourTime}", hourTime);
                    return;
                }

                await _context.Database.ExecuteSqlInterpolatedAsync(
                    $"DELETE FROM monitoring_data WHERE data_maloaithongso = 'RAIN' AND data_thoigian = {hourTimeForRawSql};");

                var entries = new Dictionary<int, MonitoringDatum>();
                _context.ChangeTracker.AutoDetectChangesEnabled = false;
                foreach (var station in stations)
                {
                    if (string.IsNullOrWhiteSpace(station.StationNo) || station.Value == null)
                    {
                        continue;
                    }
                    int tsktid = GetTsktIdByStationId(station.StationNo, station.StationName, station.Lat, station.Lon, "RAIN");
                    if (tsktid == 0)
                    {
                        continue;
                    }
                    entries[tsktid] = new MonitoringDatum
                    {
                        TsktId = tsktid,
                        DataThoigian = hourTime,
                        DataGiatriSothuc = station.Value.Value,
                        DataMaloaithongso = "RAIN",
                        Createby = "system"
                    };
                }
                await _context.MonitoringData.AddRangeAsync(entries.Values);
                await _context.SaveChangesAsync();
                _context.ChangeTracker.AutoDetectChangesEnabled = true;
            }
            else
            {
                _logger.LogError("API call failed: {StatusCode}", response.StatusCode);
            }
        }

        private int GetTsktIdByStationId(string stationId, string name, double? lat, double? lon, string data_type)
        {
            int? TsktId = (from a in _context.IwThongsoquantracs
                           where a.StationId == stationId && a.TsktMaloaithongso == data_type
                           select (int?)a.TsktId)
                  .FirstOrDefault();

            if (TsktId == null || TsktId == 0)
            {
                var station = new MonitoringStation
                {
                    StationId = stationId,
                    Key = Guid.NewGuid(),
                    StationName = name,
                    Lat = lat,
                    Lon = lon,
                };
                _context.MonitoringStations.Add(station);
                _context.SaveChanges();

                var tskt = new IwThongsoquantrac
                {
                    StationId = station.StationId,
                    TsktMaloaithongso = data_type,
                    TsktTen = "Thông số đo mưa",
                    TsktDeletedstatus = 0,
                    TsktNhaplieuthucong = false,
                    TsktKey = Guid.NewGuid(),
                    NguonDulieu = "vndms.dmc.gov.vn",
                };
                _context.IwThongsoquantracs.Add(tskt);
                _context.SaveChanges();
                TsktId = tskt.TsktId;
            }

            return TsktId ?? 0; 
        }

    }

}