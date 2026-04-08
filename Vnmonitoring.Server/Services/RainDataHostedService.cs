using Vnmonitoring.Server.Services;
using Vnmonitoring.Server.Utilities;
using Vnmonitoring.Server.Models;
using Microsoft.EntityFrameworkCore;

public class RainDataHostedService : BackgroundService
{
    private readonly IServiceProvider _serviceProvider;
    private readonly ILogger<RainDataHostedService> _logger;

    public RainDataHostedService(IServiceProvider serviceProvider, ILogger<RainDataHostedService> logger)
    {
        _serviceProvider = serviceProvider;
        _logger = logger;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        try
        {
            // Lần đầu: check nếu bảng trống thì fetch ngay
            using (var scope = _serviceProvider.CreateScope())
            {
                var context = scope.ServiceProvider.GetRequiredService<WeatherDataContext>();
                var hasData = await context.MonitoringData.Where(m => m.DataMaloaithongso == "RAIN").AnyAsync(stoppingToken);
                if (!hasData)
                {
                    _logger.LogInformation("Bảng monitoring_data trống, fetch dữ liệu lần đầu...");
                    var rainService = scope.ServiceProvider.GetRequiredService<IRainDataService>();
                    await rainService.FetchAndStoreRainDataAsync();
                }
            }

            while (!stoppingToken.IsCancellationRequested)
            {
                var now = TimeZoneHelper.GetVietnamNow();
                var nextHour = now.AddHours(1).Date.AddHours(now.AddHours(1).Hour);
                var delay = nextHour - now;
                _logger.LogInformation("Đợi đến giờ tiếp theo: {NextHour}, chờ {Delay}", nextHour, delay);
                await Task.Delay(delay, stoppingToken);
                using (var scope = _serviceProvider.CreateScope())
                {
                    var rainService = scope.ServiceProvider.GetRequiredService<IRainDataService>();
                    await rainService.FetchAndStoreRainDataAsync();
                }
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Lỗi xảy ra trong RainDataHostedService. Dịch vụ vẫn tiếp tục chạy.");
        }
    }
}
