using Microsoft.EntityFrameworkCore;

namespace Auth.Repository.Model.Entity
{
    public partial class AuthDBContext : DbContext
    {
        public AuthDBContext(){}
        public AuthDBContext(DbContextOptions<AuthDBContext> options) : base(options) { }
        public DbSet<MenuInfo> MenuInfo { get; set; }
        public DbSet<Permission> Permission { get; set; }
        public DbSet<Role> Role { get; set; }
        public DbSet<User> User { get; set; }
        public DbSet<UsersRole> UsersRole { get; set; }
        public DbSet<Information> Information { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
        }
    }
}
