using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class Product
    {
        public Product()
        {
            ProductCarts = new HashSet<ProductCart>();
        }

        public int Id { get; set; }
        public string? ProductName { get; set; }
        public string? ProductDescription { get; set; }
        public decimal? ProductPrice { get; set; }
        public int? Quantity { get; set; }
        public string? Image { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime? CreateAt { get; set; }

        public virtual ICollection<ProductCart> ProductCarts { get; set; }
    }
}
