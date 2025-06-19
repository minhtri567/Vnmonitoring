using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class MapLayer
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public string? SourceLayer { get; set; }

    public string? Filter { get; set; }

    public string? Layout { get; set; }

    public bool? VisibleByDefault { get; set; }

    public bool? IsPublic { get; set; }

    public int? SortOrder { get; set; }

    public string? Paint { get; set; }

    public string? LayerType { get; set; }

    public int? SourceId { get; set; }

    public int? ParentId { get; set; }

    public bool? IsGroup { get; set; }

    public int? MinZoom { get; set; }

    public int? MaxZoom { get; set; }

    public virtual ICollection<MapLayer> InverseParent { get; set; } = new List<MapLayer>();

    public virtual ICollection<MapLayerCoquanAccess> MapLayerCoquanAccesses { get; set; } = new List<MapLayerCoquanAccess>();

    public virtual ICollection<MapLayerMemberAccess> MapLayerMemberAccesses { get; set; } = new List<MapLayerMemberAccess>();

    public virtual MapLayer? Parent { get; set; }

    public virtual MapSource? Source { get; set; }
}
