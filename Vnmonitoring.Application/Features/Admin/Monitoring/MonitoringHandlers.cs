using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Vnmonitoring.Application.Abstractions.Persistence;
using Vnmonitoring.Application.Abstractions.Services;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Features.Admin;
public sealed class CreateWeatherReportCommandHandler : IRequestHandler<CreateWeatherReportCommand, object>
{
    private readonly IWeatherDataContext _context;
    private readonly IReportQueue _reportQueue;
    public CreateWeatherReportCommandHandler(IWeatherDataContext context, IReportQueue reportQueue)
    {
        _context = context;
        _reportQueue = reportQueue;
    }
    public async Task<object> Handle(CreateWeatherReportCommand request, CancellationToken cancellationToken)
    {
        var report = new WeatherStationsReport
        {
            RpType = request.RpType,
            NameFile = request.NameFile,
            RequestTime = DateTime.SpecifyKind(request.RequestTime, DateTimeKind.Unspecified),
            Ngaybatdau = DateTime.SpecifyKind(request.NgayBatDau, DateTimeKind.Unspecified),
            Ngayketthuc = DateTime.SpecifyKind(request.NgayKetThuc, DateTimeKind.Unspecified),
            Tansuat = request.TanSuat,
            Email = request.Email,
            Trangthai = request.TrangThai,
            CreatedBy = request.CreatedBy,
            IsPublic = request.IsPublic
        };
        _context.WeatherStationsReports.Add(report);
        await _context.SaveChangesAsync(cancellationToken);
        foreach (var station in request.Stations)
        {
            _context.WeatherStationsReportLists.Add(new WeatherStationsReportList
            {
                WeatherStationsReportId = report.Id,
                ProvineId = station.ProvinceId,
                StationId = station.StationId
            });
        }
        await _context.SaveChangesAsync(cancellationToken);
        await _reportQueue.EnqueueAsync(report);
        return new { success = true };
    }
}
public sealed class GetMonitoringDataQueryHandler : IRequestHandler<GetMonitoringDataQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetMonitoringDataQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetMonitoringDataQuery request, CancellationToken cancellationToken)
    {
        var query = from a in _context.MonitoringData
                    join b in _context.IwThongsoquantracs on a.TsktId equals b.TsktId
                    join c in _context.MonitoringStations on b.StationId equals c.StationId
                    where (request.FromDate == null || a.DataThoigian >= request.FromDate)
                       && (request.ToDate == null || a.DataThoigian <= request.ToDate)
                       && (request.Type == null || a.DataMaloaithongso == request.Type)
                       && (request.Keyword == null || b.StationId.ToLower().Contains(request.Keyword.ToLower()) || c.StationName.ToLower().Contains(request.Keyword.ToLower()))
                    orderby a.DataThoigian descending
                    select new
                    {
                        a.DataId, a.TsktId, a.DataThoigian, a.DataThoigiancapnhat, a.DataGiatriSothuc,
                        a.DataGiatriChuoi, a.DataTonghop, a.DataMaloaithongso, a.Createby,
                        TsktTen = b.TsktTen, StationId = b.StationId, StationName = c.StationName
                    };
        var total = await query.CountAsync(cancellationToken);
        var data = await query.Skip((request.Page - 1) * request.PageSize).Take(request.PageSize).ToListAsync(cancellationToken);
        return new { data, total, page = request.Page, pageSize = request.PageSize };
    }
}

public sealed class GetMonitoringDataByIdQueryHandler : IRequestHandler<GetMonitoringDataByIdQuery, MonitoringDatum>
{
    private readonly IWeatherDataContext _context;
    public GetMonitoringDataByIdQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<MonitoringDatum> Handle(GetMonitoringDataByIdQuery request, CancellationToken cancellationToken)
        => await _context.MonitoringData.Include(d => d.Tskt).FirstOrDefaultAsync(d => d.DataId == request.Id, cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy dữ liệu quan trắc.");
}

public sealed class AddMonitoringDataCommandHandler : IRequestHandler<AddMonitoringDataCommand, MonitoringDatum>
{
    private readonly IWeatherDataContext _context;
    public AddMonitoringDataCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MonitoringDatum> Handle(AddMonitoringDataCommand request, CancellationToken cancellationToken)
    {
        _context.MonitoringData.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdateMonitoringDataCommandHandler : IRequestHandler<UpdateMonitoringDataCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public UpdateMonitoringDataCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(UpdateMonitoringDataCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.MonitoringData.FirstOrDefaultAsync(x => x.DataId == request.Id, cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy dữ liệu quan trắc.");
        existing.TsktId = request.Model.TsktId;
        existing.DataThoigian = request.Model.DataThoigian;
        existing.DataThoigiancapnhat = request.Model.DataThoigiancapnhat;
        existing.DataGiatriSothuc = request.Model.DataGiatriSothuc;
        existing.DataGiatriChuoi = request.Model.DataGiatriChuoi;
        existing.DataTonghop = request.Model.DataTonghop;
        existing.DataMaloaithongso = request.Model.DataMaloaithongso;
        existing.Createby = request.Model.Createby;
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class DeleteMonitoringDataCommandHandler : IRequestHandler<DeleteMonitoringDataCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public DeleteMonitoringDataCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(DeleteMonitoringDataCommand request, CancellationToken cancellationToken)
    {
        var item = await _context.MonitoringData.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy dữ liệu quan trắc.");
        _context.MonitoringData.Remove(item);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

