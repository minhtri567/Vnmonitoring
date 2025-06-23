using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysMember
{
    public Guid MemId { get; set; }

    public string MemUsername { get; set; } = null!;

    public string? MemPassword { get; set; }

    public string? MemHoten { get; set; }

    public int? MemCqId { get; set; }

    public string? MemEmail { get; set; }

    public bool? MemActive { get; set; }

    public DateTime? MemCreateAt { get; set; }

    public DateTime? MemUpdateAt { get; set; }

    public DateTime? MemLastloginAt { get; set; }

    public DateTime? MemDeleteAt { get; set; }

    public string? MemDeleteBy { get; set; }

    public string? MemUpdateBy { get; set; }

    public virtual ICollection<MapLayerMemberAccess> MapLayerMemberAccesses { get; set; } = new List<MapLayerMemberAccess>();

    public virtual SysCoquan? MemCq { get; set; }

    public virtual ICollection<SysRoleMember> SysRoleMembers { get; set; } = new List<SysRoleMember>();

    public virtual ICollection<WeatherStationsReport> WeatherStationsReports { get; set; } = new List<WeatherStationsReport>();
}
