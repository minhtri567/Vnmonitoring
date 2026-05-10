using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Vnmonitoring.Application.Abstractions.Persistence;
using Vnmonitoring.Application.Abstractions.Services;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Features.Admin;
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
        => await _context.SysCoquans.OrderBy(c => c.CqStt).ToListAsync(cancellationToken);
}
