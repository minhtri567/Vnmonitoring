using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetTopologySuite.Mathematics;
using Vnmonitoring.Server.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using Vnmonitoring.Server.Helpers;
using Microsoft.AspNetCore.StaticFiles;

namespace Vnmonitoring.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HomeController : Controller
    {
        private readonly WeatherDataContext _context;
        public HomeController(WeatherDataContext context)
        {
            _context = context;
        }
        [HttpGet("user-keymapbox")]
        public async Task<IActionResult> mapboxkey()
        {
            var apikeys = await _context.MapboxApikeys
                .Where(m => m.Active == true)
                .Select(m => new { 
                    m.KeyValue
                })
                .FirstOrDefaultAsync();
            return Ok(apikeys);
        }
        [HttpGet("user-mapsource")]
        public async Task<IActionResult> mapsource()
        {
            var Sources = await _context.MapSources
            .Select(m => new {
                m.Id,
                m.Bounds,
                m.Scheme,
                m.Active,
                m.SourceType,
                m.SourceUrl,
                m.ApikeyId
            })
            .ToListAsync();

            return Ok(Sources);
        }
        [HttpGet("user-maplayer")]
        public async Task<IActionResult> maplayer()
        {
            var flatList = await _context.MapLayers
            .Select(m => new LayerNode
            {
                key = m.Id,
                label = m.Name,
                LayerType = m.LayerType,
                SourceLayer = m.SourceLayer,
                Layout = m.Layout,
                Filter = m.Filter,
                MinZoom = m.MinZoom,
                MaxZoom = m.MaxZoom,
                Paint = m.Paint,
                VisibleByDefault = m.VisibleByDefault,
                IsPublic = m.IsPublic,
                SourceId = m.SourceId,
                ParentId = m.ParentId,
                SortOrder = m.SortOrder,
                IsGroup = m.IsGroup
            })
            .ToListAsync();

            var lookup = flatList.ToLookup(x => x.ParentId);

            foreach (var node in flatList)
            {
                node.Children = lookup[node.key].OrderBy(c => c.SortOrder).ToList();
            }

            var tree = lookup[null].OrderBy(x => x.SortOrder).ToList();
            return Ok(tree);
        }
        [HttpGet("get-name-province/search")]
        public async Task<IActionResult> getprovince([FromQuery] string tinh_seo)
        {
            var name = await _context.BgmapProvinces.Where(m => m.TinhSeo == tinh_seo)
                .Select(p => new
                {
                    p.Gid,
                    p.TinhSeo,
                    p.TenTinh
                })
                .FirstOrDefaultAsync();
            return Ok(name);
        }
        [HttpGet("data-rain-all-province-newest/search")]
        public async Task<IActionResult> datarainprovincenewest([FromQuery] string type)
        {
            var now = DateTime.Now;
            var latestTime = await _context.MonitoringData.MaxAsync(m => m.DataThoigian);
            var lasttimeday = new DateTime(latestTime.Year, latestTime.Month, latestTime.Day, 0, 0, 0);
            if (latestTime.Day > now.Day)
            {
                lasttimeday = new DateTime(latestTime.Year, latestTime.Month, now.Day, 0, 0, 0);
            }
            var rawData = await (
                from a in _context.MonitoringData
                join b in _context.IwThongsoquantracs on a.TsktId equals b.TsktId
                join c in _context.MonitoringStations on b.StationId equals c.StationId
                join d in _context.BgmapCommunes on c.CommuneId equals d.Gid 
                join f in _context.BgmapProvinces on d.TinhId equals f.Gid
                where a.DataThoigian >= lasttimeday && a.DataThoigian < now && a.DataMaloaithongso == type
                select new
                {
                    a.DataGiatriSothuc,
                    c.StationName,
                    c.StationId,
                    TenXa = d != null ? d.TenXa : null,
                    Tinhseo = f.TinhSeo,
                    TenTinh = f != null ? f.TenTinh : null
                }
            ).ToListAsync();
            var result = rawData
                .GroupBy(x => new { x.TenTinh, x.StationId })
                .Select(g => new
                {
                    g.Key.TenTinh,
                    g.Key.StationId,
                    StationName = g.First().StationName,
                    TenXa = g.First().TenXa,
                    Tinhseo = g.First().Tinhseo,
                    Total = g.Sum(x => x.DataGiatriSothuc ?? 0)
                })
                .GroupBy(x => x.TenTinh)
                .Select(g => g.OrderByDescending(x => x.Total).First())
                .OrderByDescending(x => x.Total)
                .ToList();

            return Ok(new
            {
                lasttimeday = lasttimeday.ToString("dd/MM HH:mm"),
                data = result
            });

        }

        [HttpGet("data-rain-station-newest/search")]
        public async Task<IActionResult> datarainstationnewest([FromQuery] string type, [FromQuery] string? tinh_seo)
        {
            var now = DateTime.Now;
            var latestTime = await _context.MonitoringData.MaxAsync(m => m.DataThoigian);
            var lasttimeday = new DateTime(latestTime.Year, latestTime.Month, latestTime.Day, 0, 0, 0);
            if (latestTime.Day > now.Day) {

                lasttimeday = new DateTime(latestTime.Year, latestTime.Month, now.Day, 0, 0, 0);
            }
            var rawData = await (
               from a in _context.MonitoringData
               join b in _context.IwThongsoquantracs on a.TsktId equals b.TsktId
               join c in _context.MonitoringStations on b.StationId equals c.StationId
               join d in _context.BgmapCommunes on c.CommuneId equals d.Gid
               join f in _context.BgmapProvinces on d.TinhId equals f.Gid
               where a.DataThoigian >= lasttimeday && a.DataThoigian < now && a.DataMaloaithongso == type && (tinh_seo == null || f.TinhSeo == tinh_seo)
               select new
               {
                   a.DataGiatriSothuc,
                   c.StationName,
                   c.StationId,
                   a.DataThoigian,
                   c.Lat,
                   c.Lon,
                   d.TenXa,
                   f.Gid,
                   TenTinh = f != null ? f.TenTinh : null
               }
           ).ToListAsync();

            var groupedData = rawData
               .GroupBy(a => new { a.TenTinh, a.StationId })
               .Select(g => new
               {
                   Total = g.Sum(x => x.DataGiatriSothuc),
                   lat = g.First().Lat,
                   lon = g.First().Lon,
                   tinh = g.First().TenTinh,
                   xa = g.First().TenXa,
                   tinhid = g.First().Gid,
                   data_thoigian = lasttimeday.ToString("dd/MM HH:mm"),
                   station_name = g.First().StationName,
                   station_id = g.First().StationId,
               })
               .OrderByDescending(g => g.Total)
               .ToList();

            return Ok(groupedData);

        }

        [HttpGet("data-rain-province-newest/search")]
        public async Task<IActionResult> GetRainData(
        [FromQuery] string type,
        [FromQuery] int provinceId,
        [FromQuery] DateTime fromTime,
        [FromQuery] DateTime toTime,
        [FromQuery] string viewMode)
        {
            var rawData = await (
                from a in _context.MonitoringData
                join b in _context.IwThongsoquantracs on a.TsktId equals b.TsktId
                join c in _context.MonitoringStations on b.StationId equals c.StationId
                join d in _context.BgmapCommunes on c.CommuneId equals d.Gid
                join f in _context.BgmapProvinces on d.TinhId equals f.Gid
                where a.DataThoigian >= fromTime
                      && a.DataThoigian <= toTime
                      && a.DataMaloaithongso == type
                      && f.Gid == provinceId
                select new
                {
                    a.DataThoigian,
                    a.DataGiatriSothuc,
                    c.StationId,
                    c.StationName
                }
            ).ToListAsync();

            var timeList = rawData
            .Select(x =>
                viewMode == "hour" ? x.DataThoigian :
                viewMode == "day" ? x.DataThoigian.Date :
                new DateTime(x.DataThoigian.Year, x.DataThoigian.Month, 1)
            )
            .Distinct()
            .OrderBy(x => x)
            .ToList();

            var groupedData = rawData
            .GroupBy(x => new { x.StationId, x.StationName })
            .Select(g =>
            {
                var valuesList = timeList.Select(t =>
                {
                    IEnumerable<float?> matching;
                    switch (viewMode)
                    {
                        case "hour":
                            matching = g.Where(x => x.DataThoigian == t).Select(x => x.DataGiatriSothuc);
                            break;
                        case "day":
                            matching = g.Where(x => x.DataThoigian.Date == t.Date).Select(x => x.DataGiatriSothuc);
                            break;
                        case "month":
                            matching = g.Where(x => x.DataThoigian.Month == t.Month && x.DataThoigian.Year == t.Year).Select(x => x.DataGiatriSothuc);
                            break;
                        default:
                            matching = Enumerable.Empty<float?>();
                            break;
                    }

                    return matching.Any() ? matching.Sum() ?? 0 : 0;
                }).ToList();

                return new
                {
                    g.Key.StationId,
                    g.Key.StationName,
                    values = valuesList,
                    rainSum = Math.Round(valuesList.Sum(), 2)
                };
            }).ToList();


            return Ok(new
            {
                listTime = timeList.Select(t =>
                    viewMode == "hour" ? t.ToString("dd/MM HH:mm") :
                    viewMode == "day" ? t.ToString("dd/MM/yyyy") :
                    t.ToString("MM/yyyy")),
                data = groupedData
            });
        }
        [HttpGet("get-all-station-province/search")]
        public async Task<IActionResult> getallstation([FromQuery] int tinh_id , [FromQuery] string type)
        {
            var rawData = await (
                from a in _context.MonitoringStations
                join b in _context.IwThongsoquantracs on a.StationId equals b.StationId 
                join d in _context.BgmapCommunes on a.CommuneId equals d.Gid
                join f in _context.BgmapProvinces on d.TinhId equals f.Gid
                where b.TsktMaloaithongso == type
                      && f.Gid == tinh_id
                select new
                {
                    a.StationId,
                    a.StationName
                }
            ).ToListAsync();

            return Ok(rawData);
        }
        [HttpGet("get-getreportxlsx-province/search")]
        public async Task<IActionResult> getreportxlsx([FromQuery] int tinh_id)
        {
            var rawJoined = await (
                  from a in _context.WeatherStationsReports
                  join b in _context.WeatherStationsReportLists on a.Id equals b.WeatherStationsReportId
                  where b.ProvineId == tinh_id
                  select a
                ).ToListAsync(); 

            var rawData = rawJoined
                .GroupBy(r => r.Id)
                .Select(g => g.First())
                .Select(report => new
                {
                    report.Id,
                    RequestTime = report.RequestTime.ToString("HH:mm dd/MM/yyyy"),
                    report.NameFile,
                    Ngaybatdau = report.Ngaybatdau.ToString("HH:mm dd/MM/yyyy"),
                    Ngayketthuc = report.Ngayketthuc.ToString("HH:mm dd/MM/yyyy"),
                    report.Email,
                    report.Tansuat,
                    report.Trangthai
                })
                .ToList();

            return Ok(rawData);

        }
        [HttpGet("download-report/{reportId}")]
        public async Task<IActionResult> DownloadReport(int reportId)
        {
            var report = await _context.WeatherStationsReports.FindAsync(reportId);
            if (report == null || string.IsNullOrEmpty(report.FileRef))
                return NotFound("Không tìm thấy báo cáo hoặc file không tồn tại.");
            var fullPath = Path.GetFullPath(report.FileRef);

            if (!System.IO.File.Exists(fullPath))
                return NotFound("Tệp không tồn tại trên máy chủ.");

            var provider = new FileExtensionContentTypeProvider();
            if (!provider.TryGetContentType(fullPath, out var contentType))
                contentType = "application/octet-stream";

            var fileName = FileNameHelper.NormalizeFileName(report.NameFile ?? $"baocao_{report.Id}{Path.GetExtension(fullPath)}");
            var fileStream = new FileStream(fullPath, FileMode.Open, FileAccess.Read, FileShare.Read, bufferSize: 4096, FileOptions.Asynchronous | FileOptions.SequentialScan);
            return File(fileStream, contentType, fileName, enableRangeProcessing: true);
        }
    }

}
