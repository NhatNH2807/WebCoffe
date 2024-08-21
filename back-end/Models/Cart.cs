using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class Cart
    {
        public Cart()
        {
            Orders = new HashSet<Order>();
            ProductCarts = new HashSet<ProductCart>();
        }

        public int Id { get; set; }
        public string? Status { get; set; }
        public DateTime? CreateAt { get; set; }
        public int? UserId { get; set; }

        public virtual User? User { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<ProductCart> ProductCarts { get; set; }
    }
}
