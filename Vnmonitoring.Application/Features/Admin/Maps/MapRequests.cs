using MediatR;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
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
