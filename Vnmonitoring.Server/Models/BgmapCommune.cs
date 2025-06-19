using System;
using System.Collections.Generic;
using NetTopologySuite.Geometries;

namespace Vnmonitoring.Server.Models;

public partial class BgmapCommune
{
    public int Gid { get; set; }

    public string? TenXa { get; set; }

    public Geometry? Geom4326 { get; set; }

    public int? TinhId { get; set; }

    public virtual ICollection<MonitoringStation> MonitoringStations { get; set; } = new List<MonitoringStation>();

    public virtual BgmapProvince? Tinh { get; set; }
}
