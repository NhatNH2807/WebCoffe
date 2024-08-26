using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class User
    {
        public User()
        {
            Carts = new HashSet<Cart>();
            Tokens = new HashSet<Token>();
            Transactions = new HashSet<Transaction>();
        }

        public int Id { get; set; }
        public string? FullName { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? RoleValue { get; set; }
        public bool? IsLocked { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreateAt { get; set; }

        public virtual Role? RoleValueNavigation { get; set; }
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<Token> Tokens { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
