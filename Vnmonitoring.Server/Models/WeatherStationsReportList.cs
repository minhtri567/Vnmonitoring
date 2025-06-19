using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class WeatherStationsReportList
{
    public int Id { get; set; }

    public int? WeatherStationsReportId { get; set; }

    public int? ProvineId { get; set; }

    public string? StationId { get; set; }

    public virtual MonitoringStation? Station { get; set; }

    public virtual WeatherStationsReport? WeatherStationsReport { get; set; }
}
