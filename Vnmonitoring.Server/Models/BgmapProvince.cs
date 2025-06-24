using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class BgmapProvince
{
    public int Gid { get; set; }

    public string? TenTinh { get; set; }

    public string? Code { get; set; }

    public string? TinhSeo { get; set; }

    public virtual ICollection<BgmapCommune> BgmapCommunes { get; set; } = new List<BgmapCommune>();
}
