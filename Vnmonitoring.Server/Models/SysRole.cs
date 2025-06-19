using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysRole
{
    public long RoleId { get; set; }

    public string? RoleTen { get; set; }

    public int? RoleStt { get; set; }

    public string? RoleNguoitao { get; set; }

    public string? RoleMa { get; set; }

    public int? RoleType { get; set; }

    public virtual ICollection<SysRoleCoquan> SysRoleCoquans { get; set; } = new List<SysRoleCoquan>();

    public virtual ICollection<SysRoleMember> SysRoleMembers { get; set; } = new List<SysRoleMember>();
}
