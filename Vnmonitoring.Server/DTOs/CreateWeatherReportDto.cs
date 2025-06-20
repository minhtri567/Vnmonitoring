using Vnmonitoring.Server.Controllers;

namespace Vnmonitoring.Server.DTOs
{
    public class CreateWeatherReportDto
    {
        public string name_file { get; set; }
        public DateTime request_time { get; set; }
        public DateTime ngaybatdau { get; set; }
        public DateTime ngayketthuc { get; set; }
        public string tansuat { get; set; }
        public string rp_type { get; set; }
        public string email { get; set; }
        public int trangthai { get; set; }
        public int cq_id { get; set; }
        public Guid created_by { get; set; }
        public bool is_public { get; set; }
        public List<StationDto> stations { get; set; }
    }
}
