using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class MapboxApikey
{
    public int Id { get; set; }

    public string KeyValue { get; set; } = null!;

    public string? Description { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? CreatedAt { get; set; }

    public bool? Active { get; set; }

    public virtual ICollection<MapSource> MapSources { get; set; } = new List<MapSource>();
}
