using MediatR;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;

public sealed record GetMenuQuery() : IRequest<object>;
public sealed record GetAllPhanloaiQuery() : IRequest<IReadOnlyList<SysDanhmucPhanloai>>;
public sealed record AddPhanloaiCommand(SysDanhmucPhanloai Model) : IRequest<SysDanhmucPhanloai>;
public sealed record UpdatePhanloaiCommand(int Id, SysDanhmucPhanloai Model) : IRequest<SysDanhmucPhanloai>;
public sealed record DeletePhanloaiCommand(int Id) : IRequest<Unit>;

public sealed record GetChucNangQuery() : IRequest<object>;
public sealed record GetAllChucNangQuery() : IRequest<object>;
public sealed record AddChucNangCommand(SysFunction Model) : IRequest<SysFunction>;
public sealed record UpdateChucNangCommand(int Id, SysFunction Model) : IRequest<SysFunction>;
public sealed record DeleteChucNangCommand(int Id) : IRequest<object>;

public sealed record GetAllDanhMucQuery() : IRequest<IReadOnlyList<SysDanhmuc>>;
public sealed record AddDanhMucCommand(SysDanhmuc Model) : IRequest<SysDanhmuc>;
public sealed record UpdateDanhMucCommand(int Id, SysDanhmuc Model) : IRequest<SysDanhmuc>;
public sealed record DeleteDanhMucCommand(int Id) : IRequest<object>;

public sealed record GetAllApiKeysQuery() : IRequest<IReadOnlyList<MapboxApikey>>;
public sealed record AddApiKeyCommand(MapboxApikey Model) : IRequest<MapboxApikey>;
public sealed record UpdateApiKeyCommand(int Id, MapboxApikey Model) : IRequest<MapboxApikey>;
public sealed record DeleteApiKeyCommand(int Id) : IRequest<Unit>;

public sealed record GetAllMapSourcesQuery() : IRequest<object>;
public sealed record AddMapSourceCommand(MapSource Model) : IRequest<MapSource>;
public sealed record UpdateMapSourceCommand(int Id, MapSource Model) : IRequest<MapSource>;
public sealed record DeleteMapSourceCommand(int Id) : IRequest<Unit>;

public sealed record GetAllMapLayersQuery() : IRequest<object>;
public sealed record AddMapLayerCommand(MapLayer Model) : IRequest<MapLayer>;
public sealed record UpdateMapLayerCommand(int Id, MapLayer Model) : IRequest<MapLayer>;
public sealed record DeleteMapLayerCommand(int Id) : IRequest<Unit>;

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

public sealed record GetAllUsersQuery() : IRequest<object>;
public sealed record CreateUserCommand(SysMember Model) : IRequest<Unit>;
public sealed record UpdateUserCommand(Guid Id, SysMember Model) : IRequest<Unit>;
public sealed record DeleteUserCommand(Guid Id) : IRequest<Unit>;

public sealed record GetShortAllRolesQuery() : IRequest<object>;
public sealed record GetAllRolesQuery() : IRequest<IReadOnlyList<SysRole>>;
public sealed record AddRoleCommand(SysRole Model) : IRequest<SysRole>;
public sealed record UpdateRoleCommand(long Id, SysRole Model) : IRequest<Unit>;
public sealed record DeleteRoleCommand(long Id) : IRequest<Unit>;

public sealed record GetShortAllCoquanQuery() : IRequest<object>;
public sealed record GetAllCoquanQuery() : IRequest<IReadOnlyList<SysCoquan>>;

public sealed record GetShortAllStationQuery() : IRequest<object>;
public sealed record GetAllStationsQuery(int Page = 1, int PageSize = 10) : IRequest<object>;
public sealed record GetInvalidStationsQuery(int Page = 1, int PageSize = 10) : IRequest<object>;
public sealed record GetStationsWithoutDataQuery(string Type = "RAIN", DateTime? FromDate = null, DateTime? ToDate = null, int Page = 1, int PageSize = 10) : IRequest<object>;
public sealed record AddStationCommand(MonitoringStation Model) : IRequest<MonitoringStation>;
public sealed record UpdateStationCommand(Guid Id, MonitoringStation Model) : IRequest<Unit>;
public sealed record DeleteStationCommand(Guid Id) : IRequest<Unit>;

public sealed record GetMonitoringDataQuery(int Page = 1, int PageSize = 10, DateTime? FromDate = null, DateTime? ToDate = null, string? Type = null, string? Keyword = null) : IRequest<object>;
public sealed record GetMonitoringDataByIdQuery(int Id) : IRequest<MonitoringDatum>;
public sealed record AddMonitoringDataCommand(MonitoringDatum Model) : IRequest<MonitoringDatum>;
public sealed record UpdateMonitoringDataCommand(int Id, MonitoringDatum Model) : IRequest<Unit>;
public sealed record DeleteMonitoringDataCommand(int Id) : IRequest<Unit>;

public sealed record GetAllTypeDataQuery() : IRequest<object>;
