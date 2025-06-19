using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class MapLayerMemberAccess
{
    public int Id { get; set; }

    public Guid? MemId { get; set; }

    public int? LayerId { get; set; }

    public virtual MapLayer? Layer { get; set; }

    public virtual SysMember? Mem { get; set; }
}
