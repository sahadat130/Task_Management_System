using System;
using System.ComponentModel.DataAnnotations;

namespace Auth.Repository.Model.Entity
{
    public partial class Role
    {
        [Key]
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdateAt { get; set; }
    }
}
