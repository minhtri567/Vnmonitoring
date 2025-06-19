using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class WeatherStationsReport
{
    public int Id { get; set; }

    public string? NameFile { get; set; }

    public string? FileRef { get; set; }

    public DateTime RequestTime { get; set; }

    public DateTime Ngaybatdau { get; set; }

    public DateTime Ngayketthuc { get; set; }

    public string Tansuat { get; set; } = null!;

    public string? Email { get; set; }

    public int? Trangthai { get; set; }

    public Guid? CreatedBy { get; set; }

    public bool? IsPublic { get; set; }

    public string? RpType { get; set; }

    public virtual SysMember? CreatedByNavigation { get; set; }

    public virtual ICollection<WeatherStationsReportList> WeatherStationsReportLists { get; set; } = new List<WeatherStationsReportList>();
}
