using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class Token
    {
        public int Id { get; set; }
        public string? TokenValue { get; set; }
        public bool? IsUsed { get; set; }
        public DateTime? ExpiredTime { get; set; }
        public string? Type { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? UserId { get; set; }

        public virtual User? User { get; set; }
    }
}
