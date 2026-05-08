using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Abstractions.Services;

public interface IReportQueue
{
    Task EnqueueAsync(WeatherStationsReport report);
}
