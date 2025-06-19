using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysDanhmuc
{
    public int DmId { get; set; }

    public string? DmTen { get; set; }

    public int? DmLdmId { get; set; }

    public string? DmMa { get; set; }

    public int? DmPid { get; set; }

    public int? DmStt { get; set; }

    public string? DmMota { get; set; }

    public string? DmIconUrl { get; set; }

    public int? Functionid { get; set; }

    public virtual SysDanhmucPhanloai? DmLdm { get; set; }

    public virtual SysFunction? Function { get; set; }
}
