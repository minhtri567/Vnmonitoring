using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class SysRoleCoquan
{
    public int Id { get; set; }

    public int? CqId { get; set; }

    public long? RoleId { get; set; }

    public virtual SysCoquan? Cq { get; set; }

    public virtual SysRole? Role { get; set; }
}
