using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysRoleMember
{
    public int Id { get; set; }

    public Guid? MemId { get; set; }

    public long? RoleId { get; set; }

    public virtual SysMember? Mem { get; set; }

    public virtual SysRole? Role { get; set; }
}
