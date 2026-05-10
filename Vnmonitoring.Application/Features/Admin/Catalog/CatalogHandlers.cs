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
