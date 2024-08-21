using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class Order
    {
        public int Id { get; set; }
        public int? CartId { get; set; }
        public string? Status { get; set; }
        public decimal? Amount { get; set; }

        public virtual Cart? Cart { get; set; }
    }
}
