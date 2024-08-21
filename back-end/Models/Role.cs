using System;
using System.Collections.Generic;

namespace WebCoffe.Models
{
    public partial class Role
    {
        public Role()
        {
            Users = new HashSet<User>();
        }

        public string RoleValue { get; set; } = null!;
        public string? RoleDescription { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}
