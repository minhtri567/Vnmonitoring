using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class WeatherStationsReportShared
{
    public int Id { get; set; }

    public int ReportId { get; set; }

    public Guid MemId { get; set; }

    public virtual SysMember Mem { get; set; } = null!;

    public virtual WeatherStationsReport Report { get; set; } = null!;
}
