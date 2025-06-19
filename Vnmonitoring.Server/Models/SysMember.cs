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

    public string? MemMobile { get; set; }

    public bool? MemActive { get; set; }

    public int? MemStt { get; set; }

    public int? MemNumofdaydisplay { get; set; }

    public string? MemHourdisplay { get; set; }

    public string? MemMinutedisplay { get; set; }

    public virtual ICollection<MapLayerMemberAccess> MapLayerMemberAccesses { get; set; } = new List<MapLayerMemberAccess>();

    public virtual SysCoquan? MemCq { get; set; }

    public virtual ICollection<SysRoleMember> SysRoleMembers { get; set; } = new List<SysRoleMember>();

    public virtual ICollection<WeatherStationsReport> WeatherStationsReports { get; set; } = new List<WeatherStationsReport>();
}
