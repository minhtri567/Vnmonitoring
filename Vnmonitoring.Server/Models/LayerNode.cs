namespace Vnmonitoring.Server.Models
{
    public class LayerNode
    {
        public int key { get; set; }
        public string label { get; set; }
        public string LayerType { get; set; }
        public string? Description { get; set; }
        public string SourceLayer { get; set; }
        public string Layout { get; set; }
        public string Filter { get; set; }
        public object Paint { get; set; }
        public int? MinZoom { get; set; }
        public int? MaxZoom { get; set; }
        public bool? VisibleByDefault { get; set; }
        public bool? IsPublic { get; set; }
        public int? SourceId { get; set; }
        public int? ParentId { get; set; }
        public int? SortOrder { get; set; }
        public bool? IsGroup { get; set; }
        public List<LayerNode> Children { get; set; } = new();
    }
}
