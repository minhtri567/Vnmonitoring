using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Vnmonitoring.Application.Abstractions.Persistence;
using Vnmonitoring.Application.Abstractions.Services;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Features.Admin;

public sealed class GetMenuQueryHandler : IRequestHandler<GetMenuQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetMenuQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetMenuQuery request, CancellationToken cancellationToken)
    {
        var query =
            from a in _context.SysDanhmucs
            join b in _context.SysDanhmucPhanloais on a.DmLdmId equals b.LdmId
            join c in _context.SysFunctions on a.Functionid equals c.FnId into gj
            from c in gj.DefaultIfEmpty()
            where b.LdmMa == "PHAN_MEM_QUAN_TRAC_MUA"
            select new
            {
                a.DmId,
                a.DmTen,
                a.DmMa,
                a.DmPid,
                a.DmStt,
                a.DmMota,
                FnUrl = c != null ? c.FnUrl : null,
                a.DmIconUrl
            };

        return await query.ToListAsync(cancellationToken);
    }
}

public sealed class GetAllPhanloaiQueryHandler : IRequestHandler<GetAllPhanloaiQuery, IReadOnlyList<SysDanhmucPhanloai>>
{
    private readonly IWeatherDataContext _context;
    public GetAllPhanloaiQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<IReadOnlyList<SysDanhmucPhanloai>> Handle(GetAllPhanloaiQuery request, CancellationToken cancellationToken)
        => await _context.SysDanhmucPhanloais.ToListAsync(cancellationToken);
}

public sealed class AddPhanloaiCommandHandler : IRequestHandler<AddPhanloaiCommand, SysDanhmucPhanloai>
{
    private readonly IWeatherDataContext _context;
    public AddPhanloaiCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<SysDanhmucPhanloai> Handle(AddPhanloaiCommand request, CancellationToken cancellationToken)
    {
        _context.SysDanhmucPhanloais.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdatePhanloaiCommandHandler : IRequestHandler<UpdatePhanloaiCommand, SysDanhmucPhanloai>
{
    private readonly IWeatherDataContext _context;
    public UpdatePhanloaiCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<SysDanhmucPhanloai> Handle(UpdatePhanloaiCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.SysDanhmucPhanloais.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy phân loại.");
        existing.LdmTen = request.Model.LdmTen;
        existing.LdmMa = request.Model.LdmMa;
        existing.LdmMota = request.Model.LdmMota;
        existing.LdmPid = request.Model.LdmPid;
        existing.LdmStt = request.Model.LdmStt;
        existing.LdmUrl = request.Model.LdmUrl;
        await _context.SaveChangesAsync(cancellationToken);
        return existing;
    }
}

public sealed class DeletePhanloaiCommandHandler : IRequestHandler<DeletePhanloaiCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public DeletePhanloaiCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(DeletePhanloaiCommand request, CancellationToken cancellationToken)
    {
        var model = await _context.SysDanhmucPhanloais.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy phân loại.");
        _context.SysDanhmucPhanloais.Remove(model);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class GetChucNangQueryHandler : IRequestHandler<GetChucNangQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetChucNangQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetChucNangQuery request, CancellationToken cancellationToken)
    {
        var query = await _context.SysFunctions.Where(f => f.FnActive == true).Select(f => new { f.FnMa, f.FnUrl }).ToListAsync(cancellationToken);
        if (!query.Any()) throw new KeyNotFoundException("Không có chức năng nào.");
        return query;
    }
}

public sealed class GetAllChucNangQueryHandler : IRequestHandler<GetAllChucNangQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetAllChucNangQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetAllChucNangQuery request, CancellationToken cancellationToken)
    {
        var query = await _context.SysFunctions.ToListAsync(cancellationToken);
        if (!query.Any()) throw new KeyNotFoundException("Không có chức năng nào.");
        return query;
    }
}

public sealed class AddChucNangCommandHandler : IRequestHandler<AddChucNangCommand, SysFunction>
{
    private readonly IWeatherDataContext _context;
    private readonly ICurrentUserService _currentUser;
    public AddChucNangCommandHandler(IWeatherDataContext context, ICurrentUserService currentUser)
    {
        _context = context;
        _currentUser = currentUser;
    }
    public async Task<SysFunction> Handle(AddChucNangCommand request, CancellationToken cancellationToken)
    {
        var entity = new SysFunction
        {
            FnTen = request.Model.FnTen,
            FnMa = request.Model.FnMa,
            FnUrl = request.Model.FnUrl,
            FnNgaycapnhat = DateTime.Now,
            FnNgaytao = request.Model.FnNgaytao,
            FnActive = request.Model.FnActive,
            FnNguoitao = _currentUser.Username,
            FnMota = request.Model.FnMota
        };
        _context.SysFunctions.Add(entity);
        await _context.SaveChangesAsync(cancellationToken);
        return entity;
    }
}

public sealed class UpdateChucNangCommandHandler : IRequestHandler<UpdateChucNangCommand, SysFunction>
{
    private readonly IWeatherDataContext _context;
    private readonly ICurrentUserService _currentUser;
    public UpdateChucNangCommandHandler(IWeatherDataContext context, ICurrentUserService currentUser)
    {
        _context = context;
        _currentUser = currentUser;
    }
    public async Task<SysFunction> Handle(UpdateChucNangCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.SysFunctions.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy chức năng.");
        existing.FnTen = request.Model.FnTen;
        existing.FnMa = request.Model.FnMa;
        existing.FnUrl = request.Model.FnUrl;
        existing.FnNgaycapnhat = DateTime.Now;
        existing.FnActive = request.Model.FnActive;
        existing.FnNguoitao = _currentUser.Username;
        existing.FnMota = request.Model.FnMota;
        await _context.SaveChangesAsync(cancellationToken);
        return existing;
    }
}

public sealed class DeleteChucNangCommandHandler : IRequestHandler<DeleteChucNangCommand, object>
{
    private readonly IWeatherDataContext _context;
    public DeleteChucNangCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(DeleteChucNangCommand request, CancellationToken cancellationToken)
    {
        var func = await _context.SysFunctions.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy chức năng.");
        _context.SysFunctions.Remove(func);
        await _context.SaveChangesAsync(cancellationToken);
        return new { message = "Đã xóa thành công." };
    }
}

public sealed class GetAllDanhMucQueryHandler : IRequestHandler<GetAllDanhMucQuery, IReadOnlyList<SysDanhmuc>>
{
    private readonly IWeatherDataContext _context;
    public GetAllDanhMucQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<IReadOnlyList<SysDanhmuc>> Handle(GetAllDanhMucQuery request, CancellationToken cancellationToken)
        => await _context.SysDanhmucs.ToListAsync(cancellationToken);
}

public sealed class AddDanhMucCommandHandler : IRequestHandler<AddDanhMucCommand, SysDanhmuc>
{
    private readonly IWeatherDataContext _context;
    public AddDanhMucCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<SysDanhmuc> Handle(AddDanhMucCommand request, CancellationToken cancellationToken)
    {
        _context.SysDanhmucs.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdateDanhMucCommandHandler : IRequestHandler<UpdateDanhMucCommand, SysDanhmuc>
{
    private readonly IWeatherDataContext _context;
    public UpdateDanhMucCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<SysDanhmuc> Handle(UpdateDanhMucCommand request, CancellationToken cancellationToken)
    {
        var entity = await _context.SysDanhmucs.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy danh mục.");
        entity.DmTen = request.Model.DmTen;
        entity.DmMa = request.Model.DmMa;
        entity.DmPid = request.Model.DmPid;
        entity.DmStt = request.Model.DmStt;
        entity.DmMota = request.Model.DmMota;
        entity.DmLdmId = request.Model.DmLdmId;
        entity.DmIconUrl = request.Model.DmIconUrl;
        entity.Functionid = request.Model.Functionid;
        await _context.SaveChangesAsync(cancellationToken);
        return entity;
    }
}

public sealed class DeleteDanhMucCommandHandler : IRequestHandler<DeleteDanhMucCommand, object>
{
    private readonly IWeatherDataContext _context;
    public DeleteDanhMucCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(DeleteDanhMucCommand request, CancellationToken cancellationToken)
    {
        var entity = await _context.SysDanhmucs.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy danh mục.");
        _context.SysDanhmucs.Remove(entity);
        await _context.SaveChangesAsync(cancellationToken);
        return new { message = "Xóa thành công" };
    }
}

public sealed class GetAllApiKeysQueryHandler : IRequestHandler<GetAllApiKeysQuery, IReadOnlyList<MapboxApikey>>
{
    private readonly IWeatherDataContext _context;
    public GetAllApiKeysQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<IReadOnlyList<MapboxApikey>> Handle(GetAllApiKeysQuery request, CancellationToken cancellationToken)
        => await _context.MapboxApikeys.ToListAsync(cancellationToken);
}

public sealed class AddApiKeyCommandHandler : IRequestHandler<AddApiKeyCommand, MapboxApikey>
{
    private readonly IWeatherDataContext _context;
    public AddApiKeyCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MapboxApikey> Handle(AddApiKeyCommand request, CancellationToken cancellationToken)
    {
        request.Model.CreatedAt = DateTime.Now;
        _context.MapboxApikeys.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdateApiKeyCommandHandler : IRequestHandler<UpdateApiKeyCommand, MapboxApikey>
{
    private readonly IWeatherDataContext _context;
    public UpdateApiKeyCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MapboxApikey> Handle(UpdateApiKeyCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.MapboxApikeys.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy API key.");
        existing.KeyValue = request.Model.KeyValue;
        existing.Description = request.Model.Description;
        existing.Active = request.Model.Active;
        await _context.SaveChangesAsync(cancellationToken);
        return existing;
    }
}

public sealed class DeleteApiKeyCommandHandler : IRequestHandler<DeleteApiKeyCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public DeleteApiKeyCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(DeleteApiKeyCommand request, CancellationToken cancellationToken)
    {
        var apikey = await _context.MapboxApikeys.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy API key.");
        _context.MapboxApikeys.Remove(apikey);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class GetAllMapSourcesQueryHandler : IRequestHandler<GetAllMapSourcesQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetAllMapSourcesQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetAllMapSourcesQuery request, CancellationToken cancellationToken)
        => await _context.MapSources.Select(m => new { m.Id, m.Name, m.Description, m.Bounds, m.Scheme, m.Active, m.SourceType, m.SourceUrl, m.ApikeyId }).ToListAsync(cancellationToken);
}

public sealed class AddMapSourceCommandHandler : IRequestHandler<AddMapSourceCommand, MapSource>
{
    private readonly IWeatherDataContext _context;
    public AddMapSourceCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MapSource> Handle(AddMapSourceCommand request, CancellationToken cancellationToken)
    {
        _context.MapSources.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdateMapSourceCommandHandler : IRequestHandler<UpdateMapSourceCommand, MapSource>
{
    private readonly IWeatherDataContext _context;
    public UpdateMapSourceCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MapSource> Handle(UpdateMapSourceCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.MapSources.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy map source.");
        existing.Name = request.Model.Name;
        existing.Description = request.Model.Description;
        existing.SourceUrl = request.Model.SourceUrl;
        existing.Bounds = request.Model.Bounds;
        existing.Scheme = request.Model.Scheme;
        existing.Active = request.Model.Active;
        existing.ApikeyId = request.Model.ApikeyId;
        existing.SourceType = request.Model.SourceType;
        await _context.SaveChangesAsync(cancellationToken);
        return existing;
    }
}

public sealed class DeleteMapSourceCommandHandler : IRequestHandler<DeleteMapSourceCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public DeleteMapSourceCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(DeleteMapSourceCommand request, CancellationToken cancellationToken)
    {
        var source = await _context.MapSources.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy map source.");
        _context.MapSources.Remove(source);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class GetAllMapLayersQueryHandler : IRequestHandler<GetAllMapLayersQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetAllMapLayersQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetAllMapLayersQuery request, CancellationToken cancellationToken)
    {
        var flatList = await _context.MapLayers.Select(m => new LayerNode
        {
            key = m.Id,
            label = m.Name,
            Description = m.Description,
            LayerType = m.LayerType,
            SourceLayer = m.SourceLayer,
            Layout = m.Layout,
            Filter = m.Filter,
            Paint = m.Paint,
            MinZoom = m.MinZoom,
            MaxZoom = m.MaxZoom,
            VisibleByDefault = m.VisibleByDefault,
            IsPublic = m.IsPublic,
            SourceId = m.SourceId,
            ParentId = m.ParentId,
            SortOrder = m.SortOrder,
            IsGroup = m.IsGroup
        }).ToListAsync(cancellationToken);
        var lookup = flatList.ToLookup(x => x.ParentId);
        foreach (var node in flatList)
        {
            node.Children = lookup[node.key].OrderBy(c => c.SortOrder).ToList();
        }
        return lookup[null].OrderBy(x => x.SortOrder).ToList();
    }
}

public sealed class AddMapLayerCommandHandler : IRequestHandler<AddMapLayerCommand, MapLayer>
{
    private readonly IWeatherDataContext _context;
    public AddMapLayerCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MapLayer> Handle(AddMapLayerCommand request, CancellationToken cancellationToken)
    {
        _context.MapLayers.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdateMapLayerCommandHandler : IRequestHandler<UpdateMapLayerCommand, MapLayer>
{
    private readonly IWeatherDataContext _context;
    public UpdateMapLayerCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<MapLayer> Handle(UpdateMapLayerCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.MapLayers.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy map layer.");
        existing.Name = request.Model.Name;
        existing.Description = request.Model.Description;
        existing.SourceLayer = request.Model.SourceLayer;
        existing.Filter = request.Model.Filter;
        existing.Layout = request.Model.Layout;
        existing.Paint = request.Model.Paint;
        existing.MinZoom = request.Model.MinZoom;
        existing.MaxZoom = request.Model.MaxZoom;
        existing.LayerType = request.Model.LayerType;
        existing.VisibleByDefault = request.Model.VisibleByDefault;
        existing.SourceId = request.Model.SourceId;
        existing.IsPublic = request.Model.IsPublic;
        existing.SortOrder = request.Model.SortOrder;
        existing.ParentId = request.Model.ParentId;
        existing.IsGroup = request.Model.IsGroup;
        await _context.SaveChangesAsync(cancellationToken);
        return existing;
    }
}

public sealed class DeleteMapLayerCommandHandler : IRequestHandler<DeleteMapLayerCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public DeleteMapLayerCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(DeleteMapLayerCommand request, CancellationToken cancellationToken)
    {
        var layer = await _context.MapLayers.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy map layer.");
        _context.MapLayers.Remove(layer);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

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

public sealed class GetAllUsersQueryHandler : IRequestHandler<GetAllUsersQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetAllUsersQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetAllUsersQuery request, CancellationToken cancellationToken)
        => await _context.SysMembers.Select(s => new
        {
            s.MemId,
            s.MemUsername,
            s.MemHoten,
            memCqId = s.MemCq == null ? null : new { s.MemCq.CqId, s.MemCq.CqTen },
            s.MemEmail,
            roleIds = s.SysRoleMembers.Select(rm => new { rm.RoleId, rm.Role.RoleStt, rm.Role.RoleTen }).ToList(),
            MemUpdateAt = s.MemUpdateAt.HasValue ? s.MemUpdateAt.Value.ToString("HH:mm:ss dd/MM/yyy") : null,
            MemCreateAt = s.MemCreateAt.HasValue ? s.MemCreateAt.Value.ToString("HH:mm:ss dd/MM/yyy") : null,
            MemLastloginAt = s.MemLastloginAt.HasValue ? s.MemLastloginAt.Value.ToString("HH:mm:ss dd/MM/yyy") : null,
            MemDeleteAt = s.MemDeleteAt.HasValue ? s.MemDeleteAt.Value.ToString("HH:mm:ss dd/MM/yyy") : null,
            s.MemDeleteBy,
            s.MemUpdateBy,
            s.MemActive
        }).ToListAsync(cancellationToken);
}

public sealed class CreateUserCommandHandler : IRequestHandler<CreateUserCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    private readonly IPasswordHasher<SysMember> _passwordHasher;
    public CreateUserCommandHandler(IWeatherDataContext context, IPasswordHasher<SysMember> passwordHasher)
    {
        _context = context;
        _passwordHasher = passwordHasher;
    }
    public async Task<Unit> Handle(CreateUserCommand request, CancellationToken cancellationToken)
    {
        if (await _context.SysMembers.AnyAsync(u => u.MemUsername == request.Model.MemUsername, cancellationToken))
            throw new InvalidOperationException("Tên đăng nhập đã tồn tại cho người dùng khác.");
        request.Model.MemId = Guid.NewGuid();
        if (!string.IsNullOrWhiteSpace(request.Model.MemPassword))
            request.Model.MemPassword = _passwordHasher.HashPassword(request.Model, request.Model.MemPassword);
        request.Model.MemCreateAt = DateTime.Now;
        request.Model.MemUpdateAt = DateTime.Now;
        request.Model.MemDeleteAt = null;
        _context.SysMembers.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class UpdateUserCommandHandler : IRequestHandler<UpdateUserCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    private readonly ICurrentUserService _currentUser;
    public UpdateUserCommandHandler(IWeatherDataContext context, ICurrentUserService currentUser)
    {
        _context = context;
        _currentUser = currentUser;
    }
    public async Task<Unit> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
    {
        if (await _context.SysMembers.AnyAsync(u => u.MemUsername == request.Model.MemUsername && u.MemId != request.Id, cancellationToken))
            throw new InvalidOperationException("Tên đăng nhập đã tồn tại cho người dùng khác.");
        var existing = await _context.SysMembers.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy người dùng.");
        existing.MemUsername = request.Model.MemUsername;
        existing.MemHoten = request.Model.MemHoten;
        existing.MemEmail = request.Model.MemEmail;
        existing.MemActive = request.Model.MemActive;
        existing.MemCqId = request.Model.MemCqId;
        existing.MemUpdateAt = DateTime.Now;
        existing.MemUpdateBy = _currentUser.Username;
        if (request.Model.MemActive == true) existing.MemDeleteAt = null;
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class DeleteUserCommandHandler : IRequestHandler<DeleteUserCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    private readonly ICurrentUserService _currentUser;
    public DeleteUserCommandHandler(IWeatherDataContext context, ICurrentUserService currentUser)
    {
        _context = context;
        _currentUser = currentUser;
    }
    public async Task<Unit> Handle(DeleteUserCommand request, CancellationToken cancellationToken)
    {
        var member = await _context.SysMembers.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy người dùng.");
        if (member.MemActive == false) throw new InvalidOperationException("Người dùng này đã bị xóa trước đó.");
        member.MemActive = false;
        member.MemDeleteAt = DateTime.Now;
        member.MemDeleteBy = _currentUser.Username;
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class GetShortAllRolesQueryHandler : IRequestHandler<GetShortAllRolesQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetShortAllRolesQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetShortAllRolesQuery request, CancellationToken cancellationToken)
        => await _context.SysRoles.Select(s => new { s.RoleTen, s.RoleId, s.RoleStt }).OrderBy(r => r.RoleStt).ToListAsync(cancellationToken);
}

public sealed class GetAllRolesQueryHandler : IRequestHandler<GetAllRolesQuery, IReadOnlyList<SysRole>>
{
    private readonly IWeatherDataContext _context;
    public GetAllRolesQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<IReadOnlyList<SysRole>> Handle(GetAllRolesQuery request, CancellationToken cancellationToken)
        => await _context.SysRoles.OrderBy(r => r.RoleStt).ToListAsync(cancellationToken);
}

public sealed class AddRoleCommandHandler : IRequestHandler<AddRoleCommand, SysRole>
{
    private readonly IWeatherDataContext _context;
    public AddRoleCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<SysRole> Handle(AddRoleCommand request, CancellationToken cancellationToken)
    {
        _context.SysRoles.Add(request.Model);
        await _context.SaveChangesAsync(cancellationToken);
        return request.Model;
    }
}

public sealed class UpdateRoleCommandHandler : IRequestHandler<UpdateRoleCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public UpdateRoleCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(UpdateRoleCommand request, CancellationToken cancellationToken)
    {
        var existing = await _context.SysRoles.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy vai trò.");
        existing.RoleTen = request.Model.RoleTen;
        existing.RoleStt = request.Model.RoleStt;
        existing.RoleMa = request.Model.RoleMa;
        existing.RoleType = request.Model.RoleType;
        existing.RoleNguoitao = request.Model.RoleNguoitao;
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class DeleteRoleCommandHandler : IRequestHandler<DeleteRoleCommand, Unit>
{
    private readonly IWeatherDataContext _context;
    public DeleteRoleCommandHandler(IWeatherDataContext context) => _context = context;
    public async Task<Unit> Handle(DeleteRoleCommand request, CancellationToken cancellationToken)
    {
        var role = await _context.SysRoles.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy vai trò.");
        _context.SysRoles.Remove(role);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
    }
}

public sealed class GetShortAllCoquanQueryHandler : IRequestHandler<GetShortAllCoquanQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetShortAllCoquanQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetShortAllCoquanQuery request, CancellationToken cancellationToken)
        => await _context.SysCoquans.Select(s => new { s.CqId, s.CqTen, s.CqStt }).OrderBy(r => r.CqStt).ToListAsync(cancellationToken);
}

public sealed class GetAllCoquanQueryHandler : IRequestHandler<GetAllCoquanQuery, IReadOnlyList<SysCoquan>>
{
    private readonly IWeatherDataContext _context;
    public GetAllCoquanQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<IReadOnlyList<SysCoquan>> Handle(GetAllCoquanQuery request, CancellationToken cancellationToken)
        => await _context.SysCoquans.OrderBy(r => r.CqStt).ToListAsync(cancellationToken);
}

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
        var data = await _context.MonitoringStations.FindAsync([request.Id], cancellationToken)
            ?? throw new KeyNotFoundException("Không tìm thấy trạm.");
        _context.MonitoringStations.Remove(data);
        await _context.SaveChangesAsync(cancellationToken);
        return Unit.Value;
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

public sealed class GetAllTypeDataQueryHandler : IRequestHandler<GetAllTypeDataQuery, object>
{
    private readonly IWeatherDataContext _context;
    public GetAllTypeDataQueryHandler(IWeatherDataContext context) => _context = context;
    public async Task<object> Handle(GetAllTypeDataQuery request, CancellationToken cancellationToken)
        => await (from a in _context.SysDanhmucs
                  join b in _context.SysDanhmucPhanloais on a.DmLdmId equals b.LdmId
                  where b.LdmMa == "DATA_TYPE"
                  select new { label = a.DmTen, value = a.DmMa }).ToListAsync(cancellationToken);
}
