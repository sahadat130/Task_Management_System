using Auth.Repository.Model.Entity;
using System;
using System.Linq;

namespace Auth.Repository.Repository
{
    public class AllRepositoryMethod : GenericRepository<dynamic>
    {
        public AllRepositoryMethod(AuthDBContext context) : base(context) { }
        private AuthDBContext Context => context;

        public dynamic GetPermission()
        {
            var res = (from Per in context.Permission
                       join Role in context.Role on Per.RoleID equals Role.RoleID
                       join Mi in context.MenuInfo on Per.PermissionName equals Mi.Url
                       select new
                       {
                           Per.PermissionID,
                           Per.PermissionName,
                           Per.CreatedAt,
                           Per.RoleID,
                           Role.RoleName,
                           Mi.MenuName
                       }).ToList();
            return res;
        }

        public dynamic GetMenuUserWise(int UserId)
        {
            var res = (from Us in context.User
                       join Ur in context.UsersRole on Us.UserID equals Ur.UserID
                       join Per in context.Permission on Ur.RoleID equals Per.RoleID
                       join Mi in context.MenuInfo on Per.PermissionName equals Mi.Url
                       where Us.UserID == UserId
                       select new
                       {
                           Mi.Url,
                           Mi.MenuName
                       }).ToList();
            return res;
        }

        public dynamic GetUser()
        {
            var res = (from Ur in context.User
                       join URole in context.UsersRole on Ur.UserID equals URole.UserID
                       join Role in context.Role on URole.RoleID equals Role.RoleID
                       select new
                       {
                           Ur.UserID,
                           Ur.CreatedAt,
                           Ur.UserName,
                           Ur.Password,
                           Ur.Email,
                           URole.UserRoleID,
                           Role.RoleID,
                           Role.RoleName,
                       }).ToList();
            return res;
        }
        //public SessionDataModel Login(LoginEntity user)
        //{
        //    try
        //    {
        //        var retMsg = "";
        //        var loginuser = (from Ei in Context.EmployeeInfo
        //                         join Ui in Context.UserInfo on Ei.EmpID equals Ui.EmpID
        //                         where Ei.Email == user.LoginID && Ui.Password == user.Password
        //                         select new
        //                         {
        //                             Ui,
        //                             Ei
        //                         }).FirstOrDefault();
        //        if (loginuser == null)
        //        {
        //            retMsg = "Invalid username or password";
        //            //var vUser = appContext.UserLogin.FirstOrDefault(u => u.LoginID == user.LoginID);
        //            //if (vUser != null)
        //            //{
        //            //    vUser.WrongAttempt = vUser.WrongAttempt + 1;
        //            //    if (vUser.WrongAttempt >= 5)
        //            //    {
        //            //        vUser.IsTempoarryBlocked = 1;
        //            //    }
        //            //    Update(vUser);
        //            //}
        //        }
        //        else
        //        {
        //            if (loginuser.Ui.IsActive == false)
        //            {
        //                retMsg = user.LoginID + " is Deactive";
        //            }
        //            else
        //            {

        //                return new SessionDataModel()
        //                {
        //                    MsgCode = "OK",
        //                    Msg = "Successfull",
        //                    UserID = loginuser.Ui.UserID,
        //                    UserName = loginuser.Ei.EmpName,
        //                    CompanyID = loginuser.Ui.CompanyID,
        //                };
        //            }
        //        }
        //        return new SessionDataModel()
        //        {
        //            MsgCode = "Error",
        //            Msg = retMsg
        //        };
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}
        //public List<Menu> GetMenus(int userid)
        //{
        //    List<Menu> menus = new List<Menu>();
        //    try
        //    {
        //        var menu = Context.Menu.FromSqlRaw("EXECUTE dbo.spMenus {0}", userid).ToList();
        //        foreach (var item in menu)
        //        {
        //            Menu menuView = new Menu();
        //            menuView.MenuId = item.MenuId;
        //            menuView.ParentId = item.MenuCode;
        //            menuView.ParentId = item.ParentId;
        //            menuView.MenuText = item.MenuText;
        //            menuView.Url = item.Url;
        //            menuView.MenuOrder = item.MenuOrder;
        //            menuView.Icon = item.Icon;
        //            menuView.IsActive = item.IsActive;
        //            menuView.RootMenu = item.RootMenu;
        //            menus.Add(menuView);
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    return menus;
        //}
        //public dynamic GetUserWithEmpID(int EmpID)
        //{
        //    var res = (from Ui in Context.UserInfo
        //                     where Ui.EmpID == EmpID
        //                     select Ui).FirstOrDefault();
        //    return res;
        //}
    }
}
