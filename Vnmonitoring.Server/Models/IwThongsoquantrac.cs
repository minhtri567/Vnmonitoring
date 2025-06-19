using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class IwThongsoquantrac
{
    public int TsktId { get; set; }

    public string? TsktTen { get; set; }

    public int? TsktStt { get; set; }

    public int? TsktDeletedstatus { get; set; }

    public string? TsktMaloaithongso { get; set; }

    public float? TsktNguongMin { get; set; }

    public float? TsktNguongMax { get; set; }

    public string? StationId { get; set; }

    public bool? TsktNhaplieuthucong { get; set; }

    public Guid? TsktKey { get; set; }

    public string? NguonDulieu { get; set; }

    public virtual ICollection<Hyper31Chunk> Hyper31Chunks { get; set; } = new List<Hyper31Chunk>();

    public virtual ICollection<Hyper32Chunk> Hyper32Chunks { get; set; } = new List<Hyper32Chunk>();

    public virtual ICollection<Hyper33Chunk> Hyper33Chunks { get; set; } = new List<Hyper33Chunk>();

    public virtual ICollection<MonitoringDatum> MonitoringData { get; set; } = new List<MonitoringDatum>();

    public virtual MonitoringStation? Station { get; set; }
}
