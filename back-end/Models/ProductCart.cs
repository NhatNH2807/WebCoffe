using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class ProductCart
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public int? CartId { get; set; }
        public int? ProductQuantity { get; set; }

        public virtual Cart? Cart { get; set; }
        public virtual Product? Product { get; set; }
    }
}
