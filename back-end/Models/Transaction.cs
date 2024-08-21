using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class Transaction
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public decimal? Amount { get; set; }
        public string? PayType { get; set; }
        public DateTime? CreateAt { get; set; }
        public string? Status { get; set; }

        public virtual User? User { get; set; }
    }
}
