namespace Vnmonitoring.Server.DTOs
{
    public class MemberCreateDto
    {
        public string MemUsername { get; set; } = null!;
        public string? MemPassword { get; set; }
        public string? MemHoten { get; set; }
        public string? MemEmail { get; set; }
        public string? MemMobile { get; set; }
        public int? MemCqId { get; set; }
        public List<long>? RoleIds { get; set; }
    }
}
