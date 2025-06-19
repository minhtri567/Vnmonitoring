using Vnmonitoring.Server.Services;

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
            while (!stoppingToken.IsCancellationRequested)
            {
                var now = DateTime.Now;
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
