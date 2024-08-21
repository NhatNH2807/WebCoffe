namespace WebCoffe.Dto;

public class ProductDto
{
    public int Id { get; set; }
    public string? ProductName { get; set; }
    public string? ProductDescription { get; set; }
    public decimal? ProductPrice { get; set; }
    public int? Quantity { get; set; }
    public string? Image { get; set; }
}