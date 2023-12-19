using System.ComponentModel.DataAnnotations;

namespace Auth.Repository.Model.Entity
{
    public partial class UsersRole
    {
        [Key]
        public int UserRoleID { get; set; }
        public int UserID { get; set; }
        public int RoleID { get; set; }
    }
}
