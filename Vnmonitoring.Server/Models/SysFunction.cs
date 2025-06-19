using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysFunction
{
    public int FnId { get; set; }

    public int? FnThutu { get; set; }

    public string? FnTen { get; set; }

    public string? FnMota { get; set; }

    public string? FnMa { get; set; }

    public bool? FnActive { get; set; }

    public DateTime? FnNgaytao { get; set; }

    public DateTime? FnNgaycapnhat { get; set; }

    public string? FnNguoitao { get; set; }

    public int? FnDmid { get; set; }

    public string? FnUrl { get; set; }

    public virtual ICollection<SysDanhmuc> SysDanhmucs { get; set; } = new List<SysDanhmuc>();
}
