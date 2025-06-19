using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysDanhmucPhanloai
{
    public int LdmId { get; set; }

    public string? LdmTen { get; set; }

    public string? LdmMa { get; set; }

    public string? LdmMota { get; set; }

    public int? LdmPid { get; set; }

    public int? LdmStt { get; set; }

    public string? LdmUrl { get; set; }

    public virtual ICollection<SysDanhmuc> SysDanhmucs { get; set; } = new List<SysDanhmuc>();
}
