using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Vnmonitoring.Application.Abstractions.Persistence;
using Vnmonitoring.Application.Abstractions.Services;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Features.Admin;
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

