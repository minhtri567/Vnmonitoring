using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class MapLayerCoquanAccess
{
    public int Id { get; set; }

    public int? CqId { get; set; }

    public int? LayerId { get; set; }

    public virtual SysCoquan? Cq { get; set; }

    public virtual MapLayer? Layer { get; set; }
}
