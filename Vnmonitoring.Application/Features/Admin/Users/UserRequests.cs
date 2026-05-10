using MediatR;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
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
