using System;
using System.Collections.Generic;

namespace Vnmonitoring.Server.Models;

public partial class Hyper34Chunk
{
    public int DataId { get; set; }

    public int TsktId { get; set; }

    public DateTime DataThoigian { get; set; }

    public DateTime? DataThoigiancapnhat { get; set; }

    public float? DataGiatriSothuc { get; set; }

    public string? DataGiatriChuoi { get; set; }

    public string? Createby { get; set; }

    public string? DataTonghop { get; set; }

    public string? DataMaloaithongso { get; set; }

    public virtual IwThongsoquantrac Tskt { get; set; } = null!;
}
