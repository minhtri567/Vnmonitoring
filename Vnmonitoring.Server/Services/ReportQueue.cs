using System.Threading.Channels;
using Vnmonitoring.Server.Models;

public class ReportQueue
{
    private readonly Channel<WeatherStationsReport> _queue = Channel.CreateUnbounded<WeatherStationsReport>();

    public async Task EnqueueAsync(WeatherStationsReport report)
    {
        await _queue.Writer.WriteAsync(report);
    }

    public IAsyncEnumerable<WeatherStationsReport> DequeueAsync(CancellationToken token)
    {
        return _queue.Reader.ReadAllAsync(token);
    }
}
