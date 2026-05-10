using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Vnmonitoring.Application.Abstractions.Persistence;
using Vnmonitoring.Application.Abstractions.Services;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Features.Admin;
public sealed class GetShortAllStationQueryHandler : IRequestHandler<GetShortAllStationQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetShortAllStationQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetShortAllStationQuery request, CancellationToken cancellationToken)
        => await _context.MonitoringStations.Select(s => new { s.StationId, s.StationName, s.Lat, s.Lon }).ToListAsync(cancellationToken);
}

public sealed class GetAllStationsQueryHandler : IRequestHandler<GetAllStationsQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetAllStationsQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetAllStationsQuery request, CancellationToken cancellationToken)
    {
        var totalItems = await _context.MonitoringStations.CountAsync(cancellationToken);
        var query = _context.MonitoringStations.Include(s => s.Commune).ThenInclude(c => c.Tinh).OrderBy(s => s.StationId);
        var stations = await query.Skip((request.Page - 1) * request.PageSize).Take(request.PageSize)
            .Select(s => new
            {
                s.Key, s.StationId, s.StationName, s.Lat, s.Lon, s.Luuvuc, s.Description,
                ten_xa = s.Commune != null ? s.Commune.TenXa : null,
                ten_tinh = s.Commune != null && s.Commune.Tinh != null ? s.Commune.Tinh.TenTinh : null
            }).ToListAsync(cancellationToken);
        return new { data = stations, total = totalItems, page = request.Page, pageSize = request.PageSize };
    }
}

public sealed class GetInvalidStationsQueryHandler : IRequestHandler<GetInvalidStationsQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetInvalidStationsQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetInvalidStationsQuery request, CancellationToken cancellationToken)
    {
        var query = _context.MonitoringStations.Include(s => s.Commune).ThenInclude(c => c.Tinh)
            .Where(s => s.Lat == null || s.Lon == null || s.Lat < -90 || s.Lat > 90 || s.Lon < -180 || s.Lon > 180 || s.CommuneId == null)
            .OrderBy(s => s.StationId);
        var total = await query.CountAsync(cancellationToken);
        var stations = await query.Skip((request.Page - 1) * request.PageSize).Take(request.PageSize)
            .Select(s => new
            {
                s.StationId, s.StationName, s.Lat, s.Lon, s.CommuneId,
                CommuneName = s.Commune != null ? s.Commune.TenXa : null,
                ProvinceName = s.Commune != null && s.Commune.Tinh != null ? s.Commune.Tinh.TenTinh : null
            }).ToListAsync(cancellationToken);
        return new { data = stations, total, page = request.Page, pageSize = request.PageSize };
    }
}

public sealed class GetStationsWithoutDataQueryHandler : IRequestHandler<GetStationsWithoutDataQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetStationsWithoutDataQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetStationsWithoutDataQuery request, CancellationToken cancellationToken)
    {
        var fromDate = request.FromDate ?? DateTime.Now.Date.AddDays(-1);
        var toDate = request.ToDate ?? DateTime.Now;
        var stationIdsWithData = await (
            from a in _context.MonitoringData
            join b in _context.IwThongsoquantracs on a.TsktId equals b.TsktId
            where a.DataThoigian >= fromDate && a.DataThoigian < toDate && a.DataMaloaithongso == request.Type
            select b.StationId
        ).Distinct().ToListAsync(cancellationToken);
        var query = from c in _context.MonitoringStations
                    join d in _context.BgmapCommunes on c.CommuneId equals d.Gid into gj1
                    from d in gj1.DefaultIfEmpty()
                    join f in _context.BgmapProvinces on d.TinhId equals f.Gid into gj2
                    from f in gj2.DefaultIfEmpty()
                    where !stationIdsWithData.Contains(c.StationId)
                    orderby c.StationId
                    select new
                    {
                        c.StationId, c.StationName, c.Lat, c.Lon,
                        TenXa = d != null ? d.TenXa : null,
                        TenTinh = f != null ? f.TenTinh : null,
                        TinhSeo = f != null ? f.TinhSeo : null
                    };
        var total = await query.CountAsync(cancellationToken);
        var stations = await query.Skip((request.Page - 1) * request.PageSize).Take(request.PageSize).ToListAsync(cancellationToken);
        return new { data = stations, total, page = request.Page, pageSize = request.PageSize };
    }
}

public sealed class AddStationCommandHandler : IRequestHandler<AddStationCommand, MonitoringStation>
{
    private readonly IWeatherDataContext _context;
    public AddStationCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MonitoringStation> Handle(AddStationCommand request, CancellationToken cancellationToken)
    {
        _context.MonitoringStations.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdateStationCommandHandler : IRequestHandler<UpdateStationCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public UpdateStationCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(UpdateStationCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.MonitoringStations.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy trạm.");
        existing.StationId = request.Model.StationId;
        existing.StationName = request.Model.StationName;
        existing.CommuneId = request.Model.CommuneId;
        existing.Luuvuc = request.Model.Luuvuc;
        existing.Lat = request.Model.Lat;
        existing.Lon = request.Model.Lon;
        existing.Description = request.Model.Description;
        existing.InforData = request.Model.InforData;
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class DeleteStationCommandHandler : IRequestHandler<DeleteStationCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public DeleteStationCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(DeleteStationCommand request, CancellationToken cancellationToken)
    {
        var station = await _context.MonitoringStations.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("KhÃ´ng tÃ¬m tháº¥y tráº¡m.");
        _context.MonitoringStations.Remove(station);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}
