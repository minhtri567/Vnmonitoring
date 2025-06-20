using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysCoquan
{
    public int CqId { get; set; }

    public string? CqTen { get; set; }

    public string? CqMota { get; set; }

    public string? CqDiachi { get; set; }

    public string? CqNguoidaidien { get; set; }

    public string? CqDienthoai { get; set; }

    public string? CqEmail { get; set; }

    public string? CqGhichu { get; set; }

    public bool? CqActive { get; set; }

    public int? CqPid { get; set; }

    public int? CqStt { get; set; }

    public string? CqLoai { get; set; }

    public string? CqXaid { get; set; }

    public string? CqTinhid { get; set; }

    public virtual ICollection<MapLayerCoquanAccess> MapLayerCoquanAccesses { get; set; } = new List<MapLayerCoquanAccess>();

    public virtual ICollection<SysMember> SysMembers { get; set; } = new List<SysMember>();

    public virtual ICollection<SysRoleCoquan> SysRoleCoquans { get; set; } = new List<SysRoleCoquan>();
}
