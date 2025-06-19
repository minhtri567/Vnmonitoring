using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class MapSource
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public string? SourceUrl { get; set; }

    public string? Bounds { get; set; }

    public string? Scheme { get; set; }

    public string? SourceType { get; set; }

    public bool? Active { get; set; }

    public int? ApikeyId { get; set; }

    public virtual MapboxApikey? Apikey { get; set; }

    public virtual ICollection<MapLayer> MapLayers { get; set; } = new List<MapLayer>();
}
