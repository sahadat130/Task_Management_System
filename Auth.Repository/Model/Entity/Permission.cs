using System;
using System.ComponentModel.DataAnnotations;

namespace Auth.Repository.Model.Entity
{
    public partial class Permission
    {
        [Key]
        public int PermissionID { get; set; }
        public string PermissionName { get; set; }
        public int RoleID { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
