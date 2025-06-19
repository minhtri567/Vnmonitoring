using System.Text;
using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Vnmonitoring.Server.Models;
using static System.Collections.Specialized.BitVector32;

namespace Vnmonitoring.Server.Services
{
    public class ApiResponse
    {
        public int recordsFiltered { get; set; }
        public int recordsTotal { get; set; }
        public List<RainStationData> data { get; set; }
    }

    public class RainStationData
    {
        public string station_id { get; set; }
        public string station_name { get; set; }
        public string daterain { get; set; }
        public string lat { get; set; }
        public string lon { get; set; }
        public float h0 { get; set; }
        public float h1 { get; set; }
        public float h2 { get; set; }
        public float h3 { get; set; }
        public float h4 { get; set; }
        public float h5 { get; set; }
        public float h6 { get; set; }
        public float h7 { get; set; }
        public float h8 { get; set; }
        public float h9 { get; set; }
        public float h10 { get; set; }
        public float h11 { get; set; }
        public float h12 { get; set; }
        public float h13 { get; set; }
        public float h14 { get; set; }
        public float h15 { get; set; }
        public float h16 { get; set; }
        public float h17 { get; set; }
        public float h18 { get; set; }
        public float h19 { get; set; }
        public float h20 { get; set; }
        public float h21 { get; set; }
        public float h22 { get; set; }
        public float h23 { get; set; }
    }

    public class RainDataService : IRainDataService
    {
        private readonly HttpClient _httpClient;
        private readonly WeatherDataContext _context;
        private readonly ILogger<RainDataService> _logger;

        public RainDataService(HttpClient httpClient, WeatherDataContext context, ILogger<RainDataService> logger)
        {
            _httpClient = httpClient;
            _context = context;
            _logger = logger;
        }

        public async Task FetchAndStoreRainDataAsync()
        {
            var url = "http://vndms.dmc.gov.vn/DataQuanTracMua/DataMuaTheoGio";
            var todaydate = DateTime.Now;
            if(todaydate.Hour >= 20)
            {
                todaydate = todaydate.AddDays(1);
            }
            var requestBody = new
            {
                start = 1,
                length = 5000,
                search_key = "",
                province_id = "0",
                luuvuc_id = "",
                fromDate = todaydate.ToString("dd/MM/yyyy"),
                toDate = todaydate.ToString("dd/MM/yyyy"),
                from_number = (int?)null,
                to_number = (int?)null,
                orderby = "1",
                fromObs = 1,
                toObs = 19,
                source = 0
            };

            var json = JsonSerializer.Serialize(requestBody);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(url, content);

            if (response.IsSuccessStatusCode)
            {
                var cutoffTime = DateTime.Now.Date.AddDays(-1).AddHours(20);
                if (todaydate.Hour >= 20)
                {
                    await _context.Database.ExecuteSqlRawAsync("DELETE FROM monitoring_data WHERE data_maloaithongso = 'RAIN' AND data_thoigian >= ((current_date) + time '20:00:00') ;");
                }
                else
                {
                    await _context.Database.ExecuteSqlRawAsync("DELETE FROM monitoring_data WHERE data_maloaithongso = 'RAIN' AND data_thoigian >= ((current_date - 1) + time '20:00:00') ;");
                }

                var result = await response.Content.ReadAsStringAsync();
                var apiData = JsonSerializer.Deserialize<ApiResponse>(result);
                var entries = new List<MonitoringDatum>();
                _context.ChangeTracker.AutoDetectChangesEnabled = false;
                foreach (var station in apiData.data)
                {
                    var baseDate = new DateTime(todaydate.Year, todaydate.Month, todaydate.Day, 0, 0, 0);
                    int tsktid = GetTsktIdByStationId(station.station_id, station.station_name, float.Parse(station.lat), float.Parse(station.lon), "RAIN");
                    for (int h = 0; h < 24; h++)
                    {
                        var hourValue = Convert.ToSingle(station.GetType().GetProperty($"h{h}")?.GetValue(station) ?? 0);
                        var isYesterday = h >= 20;
                        var rawTime = baseDate.AddDays(isYesterday ? -1 : 0).AddHours(h);
                        var time = new DateTime(rawTime.Year, rawTime.Month, rawTime.Day, rawTime.Hour, 0, 0);
                        entries.Add(new MonitoringDatum
                        {
                            TsktId = tsktid,
                            DataThoigian = time,
                            DataGiatriSothuc = hourValue,
                            DataMaloaithongso = "RAIN",
                            Createby = "system"
                        });
                    }
                }
                await _context.MonitoringData.AddRangeAsync(entries);
                await _context.SaveChangesAsync();
                _context.ChangeTracker.AutoDetectChangesEnabled = true;
            }
            else
            {
                _logger.LogError("API call failed: {StatusCode}", response.StatusCode);
            }
        }

        private int GetTsktIdByStationId(string stationId, string name, float lat, float lon, string data_type)
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
