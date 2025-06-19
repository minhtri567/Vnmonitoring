using System;
using System.Collections.Generic;
using NetTopologySuite.Geometries;

namespace Vnmonitoring.Server.Models;

public partial class BgmapProvince
{
    public int Gid { get; set; }

    public MultiPolygon? Geom4326 { get; set; }

    public string? TenTinh { get; set; }

    public string? Code { get; set; }

    public string? TinhSeo { get; set; }

    public virtual ICollection<BgmapCommune> BgmapCommunes { get; set; } = new List<BgmapCommune>();
}
