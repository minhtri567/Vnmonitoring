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
public sealed record GetAllTypeDataQuery() : IRequest<object>;
