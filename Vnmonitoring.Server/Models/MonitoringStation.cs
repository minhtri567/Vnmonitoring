using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class MonitoringStation
{
    public Guid Key { get; set; }

    public string StationId { get; set; } = null!;

    public string? StationName { get; set; }

    public int? CommuneId { get; set; }

    public string? Luuvuc { get; set; }

    public double? Lat { get; set; }

    public double? Lon { get; set; }

    public string? Description { get; set; }

    public string? InforData { get; set; }

    public DateTime? CreateAt { get; set; }

    public string? CreateBy { get; set; }

    public DateTime? UpdateAt { get; set; }

    public string? UpdateBy { get; set; }

    public DateTime? DeleteAt { get; set; }

    public string? DeleteBy { get; set; }

    public virtual BgmapCommune? Commune { get; set; }

    public virtual ICollection<IwThongsoquantrac> IwThongsoquantracs { get; set; } = new List<IwThongsoquantrac>();

    public virtual ICollection<WeatherStationsReportList> WeatherStationsReportLists { get; set; } = new List<WeatherStationsReportList>();
}
