using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Server.DTOs
{
    public class TreeNodeDto
    {
        public string Key { get; set; }
        public string Label { get; set; }
        public LayerNode Data { get; set; }
        public List<TreeNodeDto> Children { get; set; } = new();
    }
}
