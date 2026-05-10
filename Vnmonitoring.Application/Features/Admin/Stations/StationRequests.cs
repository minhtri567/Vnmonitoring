using MediatR;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
public sealed record GetShortAllStationQuery() : IRequest<object>;
public sealed record GetAllStationsQuery(int Page = 1, int PageSize = 10) : IRequest<object>;
public sealed record GetInvalidStationsQuery(int Page = 1, int PageSize = 10) : IRequest<object>;
public sealed record GetStationsWithoutDataQuery(string Type = "RAIN", DateTime? FromDate = null, DateTime? ToDate = null, int Page = 1, int PageSize = 10) : IRequest<object>;
public sealed record AddStationCommand(MonitoringStation Model) : IRequest<MonitoringStation>;
public sealed record UpdateStationCommand(Guid Id, MonitoringStation Model) : IRequest<Unit>;
public sealed record DeleteStationCommand(Guid Id) : IRequest<Unit>;
