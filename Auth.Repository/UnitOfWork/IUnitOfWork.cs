using Auth.Repository.Model.Entity;
using Auth.Repository.Repository;
namespace Auth.Repository.UnitOfWork
{
    public interface IUnitOfWork
    {
        AllRepositoryMethod AllRepositoryMethod { get; }
        IRepository<MenuInfo> TblMenuInfo { get; }
        IRepository<Information> TblInformation { get; }
        IRepository<Permission> TblPermission { get; }
        IRepository<Role> TblRole { get; }
        IRepository<User> TblUser { get; }
        IRepository<UsersRole> TblUsersRole { get; }
    }
}
