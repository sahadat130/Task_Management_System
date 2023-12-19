using Auth.Repository.Model.Entity;
using Auth.Repository.Repository;
namespace Auth.Repository.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private AuthDBContext _context { get; set; }
        public UnitOfWork(AuthDBContext context)
        {
            this._context = context;
        }
        private AllRepositoryMethod allRepositoryMethod;
        public AllRepositoryMethod AllRepositoryMethod
        {
            get
            {
                if (this.allRepositoryMethod == null)
                {
                    this.allRepositoryMethod = new AllRepositoryMethod(_context);
                }
                return allRepositoryMethod;
            }
        }
        private IRepository<Role> tblRole;
        public IRepository<Role> TblRole
        {
            get
            {
                if (this.tblRole == null)
                {
                    this.tblRole = new GenericRepository<Role>(_context);
                }
                return tblRole;
            }
        }
        private IRepository<Information> tblInformation;
        public IRepository<Information> TblInformation
        {
            get
            {
                if (this.tblInformation == null)
                {
                    this.tblInformation = new GenericRepository<Information>(_context);
                }
                return tblInformation;
            }
        }
        private IRepository<User> tblUser;
        public IRepository<User> TblUser
        {
            get
            {
                if (this.tblUser == null)
                {
                    this.tblUser = new GenericRepository<User>(_context);
                }
                return tblUser;
            }
        }
        private IRepository<MenuInfo> tblMenuInfo;
        public IRepository<MenuInfo> TblMenuInfo
        {
            get
            {
                if (this.tblMenuInfo == null)
                {
                    this.tblMenuInfo = new GenericRepository<MenuInfo>(_context);
                }
                return tblMenuInfo;
            }
        }
        private IRepository<Permission> tblPermission;
        public IRepository<Permission> TblPermission
        {
            get
            {
                if (this.tblPermission == null)
                {
                    this.tblPermission = new GenericRepository<Permission>(_context);
                }
                return tblPermission;
            }
        }
        private IRepository<UsersRole> tblUsersRole;
        public IRepository<UsersRole> TblUsersRole
        {
            get
            {
                if (this.tblUsersRole == null)
                {
                    this.tblUsersRole = new GenericRepository<UsersRole>(_context);
                }
                return tblUsersRole;
            }
        }
    }
}
