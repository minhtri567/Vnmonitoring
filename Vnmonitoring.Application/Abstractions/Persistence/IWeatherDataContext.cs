using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Abstractions.Persistence;

public interface IWeatherDataContext
{
    DbSet<BgmapCommune> BgmapCommunes { get; }
    DbSet<BgmapProvince> BgmapProvinces { get; }
    DbSet<IwThongsoquantrac> IwThongsoquantracs { get; }
    DbSet<MapLayer> MapLayers { get; }
    DbSet<MapSource> MapSources { get; }
    DbSet<MapboxApikey> MapboxApikeys { get; }
    DbSet<MonitoringDatum> MonitoringData { get; }
    DbSet<MonitoringStation> MonitoringStations { get; }
    DbSet<SysCoquan> SysCoquans { get; }
    DbSet<SysDanhmuc> SysDanhmucs { get; }
    DbSet<SysDanhmucPhanloai> SysDanhmucPhanloais { get; }
    DbSet<SysFunction> SysFunctions { get; }
    DbSet<SysMember> SysMembers { get; }
    DbSet<SysRole> SysRoles { get; }
    DbSet<SysRoleCoquan> SysRoleCoquans { get; }
    DbSet<SysRoleMember> SysRoleMembers { get; }
    DbSet<WeatherStationsReport> WeatherStationsReports { get; }
    DbSet<WeatherStationsReportList> WeatherStationsReportLists { get; }

    EntityEntry Entry(object entity);
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}
