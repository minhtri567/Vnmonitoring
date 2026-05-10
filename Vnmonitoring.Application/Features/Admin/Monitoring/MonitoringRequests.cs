using MediatR;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
public sealed record CreateWeatherReportCommand(
    string NameFile,
    DateTime RequestTime,
    DateTime NgayBatDau,
    DateTime NgayKetThuc,
    string TanSuat,
    string RpType,
    string Email,
    int TrangThai,
    int CqId,
    Guid CreatedBy,
    bool IsPublic,
    IReadOnlyCollection<WeatherReportStationItem> Stations) : IRequest<object>;

public sealed record WeatherReportStationItem(int ProvinceId, string StationId);
public sealed record GetMonitoringDataQuery(int Page = 1, int PageSize = 10, DateTime? FromDate = null, DateTime? ToDate = null, string? Type = null, string? Keyword = null) : IRequest<object>;
public sealed record GetMonitoringDataByIdQuery(int Id) : IRequest<MonitoringDatum>;
public sealed record AddMonitoringDataCommand(MonitoringDatum Model) : IRequest<MonitoringDatum>;
public sealed record UpdateMonitoringDataCommand(int Id, MonitoringDatum Model) : IRequest<Unit>;
public sealed record DeleteMonitoringDataCommand(int Id) : IRequest<Unit>;
