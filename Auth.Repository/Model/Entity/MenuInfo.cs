using System.ComponentModel.DataAnnotations;

namespace Auth.Repository.Model.Entity
{
    public partial class MenuInfo
    {
        [Key]
        public int MenuID { get; set; }
        public string MenuName { get; set; }
        public string Url { get; set; }
    }
}
