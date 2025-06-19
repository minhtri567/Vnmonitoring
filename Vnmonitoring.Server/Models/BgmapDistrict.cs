using System;
using System.Collections.Generic;
using NetTopologySuite.Geometries;

namespace Vnmonitoring.Server.Models;

public partial class BgmapDistrict
{
    public int Gid { get; set; }

    public string? TenHuyen { get; set; }

    public int TinhId { get; set; }

    public Geometry? Geom4326 { get; set; }

    public virtual ICollection<BgmapCommune> BgmapCommunes { get; set; } = new List<BgmapCommune>();

    public virtual BgmapProvince Tinh { get; set; } = null!;
}
