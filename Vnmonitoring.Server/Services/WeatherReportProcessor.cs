using Microsoft.EntityFrameworkCore;
using ClosedXML.Excel;
using System.Globalization;
using Vnmonitoring.Server.Models;
using Vnmonitoring.Server.Helpers;
public class WeatherReportProcessor : BackgroundService
{
    private readonly ReportQueue _reportQueue;
    private readonly ILogger<WeatherReportProcessor> _logger;
    private readonly IServiceScopeFactory _scopeFactory;
    private readonly EmailHelper _emailHelper;
    public WeatherReportProcessor(
        ReportQueue reportQueue,
        ILogger<WeatherReportProcessor> logger,
        IServiceScopeFactory scopeFactory,
        EmailHelper emailHelper)
    {
        _reportQueue = reportQueue;
        _logger = logger;
        _scopeFactory = scopeFactory;
        _emailHelper = emailHelper;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        await foreach (var report in _reportQueue.DequeueAsync(stoppingToken))
        {
            try
            {
                using var scope = _scopeFactory.CreateScope();
                var db = scope.ServiceProvider.GetRequiredService<WeatherDataContext>();

                await GenerateReportFile(report.Id, db);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Lỗi tạo báo cáo XLSX cho report {Id}", report.Id);
            }
        }
    }

    private async Task GenerateReportFile(int reportId, WeatherDataContext db)
    {
        var report = await db.WeatherStationsReports.FirstOrDefaultAsync(r => r.Id == reportId);
        if (report == null)
        {
            _logger.LogWarning("Không tìm thấy report ID {Id}", reportId);
            return;
        }

        var stations = await db.WeatherStationsReportLists
            .Where(x => x.WeatherStationsReportId == report.Id)
            .ToListAsync();

        var stationIds = stations.Select(s => s.StationId).ToList();

        var rainData = await (
            from a in db.MonitoringData
            join b in db.IwThongsoquantracs on a.TsktId equals b.TsktId
            join c in db.MonitoringStations on b.StationId equals c.StationId
            join d in db.BgmapCommunes on c.CommuneId equals d.Gid
            join f in db.BgmapProvinces on d.TinhId equals f.Gid
            where a.DataThoigian >= report.Ngaybatdau
                && a.DataThoigian <= report.Ngayketthuc
                && stationIds.Contains(c.StationId)
                && a.DataMaloaithongso == report.RpType
            select new
            {
                a.DataThoigian,
                a.DataGiatriSothuc,
                c.StationId,
                c.StationName
            }
        ).ToListAsync();

        var rawName = report.NameFile == null ? $"Baocaodomua_{report.Id}.xlsx" : report.NameFile;

        var fileName = FileNameHelper.NormalizeFileName(rawName);
        var filePath = Path.Combine("Uploads", "Reports", fileName);
        Directory.CreateDirectory(Path.GetDirectoryName(filePath)!);
        var timeSlots = rainData.Select(x => x.DataThoigian)
                                   .Distinct()
                                   .OrderBy(t => t)
                                   .ToList();

        // Lấy danh sách trạm duy nhất
        var allStations = rainData.Select(x => new { x.StationId, x.StationName })
                                  .Distinct()
                                  .ToList();
        using (var workbook = new XLWorkbook())
        {
            var ws = workbook.Worksheets.Add("Rain Report");

            // Header hàng đầu tiên: thời gian
            ws.Cell(1, 1).Value = "Mã trạm đo";
            ws.Cell(1, 2).Value = "Tên trạm đo";

            for (int j = 0; j < timeSlots.Count; j++)
            {
                ws.Cell(1, j + 3).Value = timeSlots[j].ToString("HH:mm dd/MM/yyyy", CultureInfo.InvariantCulture);
            }

            for (int i = 0; i < allStations.Count; i++)
            {
                var station = allStations[i];
                ws.Cell(i + 2, 1).Value = station.StationId;
                ws.Cell(i + 2, 2).Value = station.StationName;

                for (int j = 0; j < timeSlots.Count; j++)
                {
                    var value = rainData.FirstOrDefault(x =>
                        x.StationId == station.StationId &&
                        x.DataThoigian == timeSlots[j]);

                    ws.Cell(i + 2, j + 3).Value = $"{(value?.DataGiatriSothuc ?? 0)} ml";
                }
            }

            var range = ws.Range(1, 1, allStations.Count + 1, timeSlots.Count + 2);
            range.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
            range.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
            range.Style.Font.FontSize = 11;
            range.Style.Border.OutsideBorder = XLBorderStyleValues.Thin;
            range.Style.Border.InsideBorder = XLBorderStyleValues.Thin;
            range.Style.Alignment.WrapText = true;

            ws.Columns().AdjustToContents();

            workbook.SaveAs(filePath);
        }

        report.FileRef = filePath;
        report.Trangthai = 2;
        await db.SaveChangesAsync();

        _logger.LogInformation("Tạo báo cáo XLSX thành công cho report ID {Id}", report.Id);

        try
        {
            await _emailHelper.SendEmailWithAttachmentAsync(
                report.Email,
                "Báo cáo lượng mưa đã sẵn sàng",
                $"<p>Xin chào,</p><p>Báo cáo lượng mưa của bạn đã được tạo và đính kèm trong email này.</p><p>Trân trọng.</p>",
                filePath
            );

            _logger.LogInformation("Đã gửi email báo cáo đến {Email}", report.Email);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Lỗi gửi email tới {Email}", report.Email);
        }

    }
}
