using Auth.Api.Controllers;
using Auth.Repository.Model.Common;
using Auth.Repository.Model.Entity;
using Auth.Repository.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using System.Transactions;

namespace AuthApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : BaseController
    {
        public UserController(IUnitOfWork uow)
        {
            Uow = uow;
        }
        [HttpPost("[action]")]
        public async Task<SessionDataModel> UserRegister([FromBody] User entity)
        {
            using (TransactionScope DbRollback = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    //User Table data save
                    entity.CreatedAt = DateTime.Now;
                    entity.UpdatedAt = DateTime.Now;
                    await Uow.TblUser.Add(entity);

                    //User Role Table Date save
                    UsersRole UR = new UsersRole();
                    UR.RoleID = 3;
                    UR.UserID = entity.UserID;
                    await Uow.TblUsersRole.Add(UR);

                    DbRollback.Complete();
                    return new SessionDataModel()
                    {
                        MsgCode = "200",
                        Msg = "User Save Successfully",
                    };
                }
                catch (Exception ex)
                {
                    DbRollback.Dispose();
                    return new SessionDataModel()
                    {
                        MsgCode = "500",
                        Msg = ex.ToString(),
                    };
                }
            }
        }
        [Authorize]
        [HttpPost("[action]")]
        public async Task<SessionDataModel> UserSave([FromBody] User entity)
        {
            using (TransactionScope DbRollback = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    //User Table data save
                    entity.CreatedAt = DateTime.Now;
                    entity.UpdatedAt = DateTime.Now;
                    await Uow.TblUser.Add(entity);

                    //User Role Table Date save
                    UsersRole UR = new UsersRole();
                    UR.RoleID = entity.RoleID;
                    UR.UserID = entity.UserID;
                    await Uow.TblUsersRole.Add(UR);


                    return new SessionDataModel()
                    {
                        MsgCode = "200",
                        Msg = "User Save Successfully",
                    };
                }
                catch (Exception ex)
                {
                    return new SessionDataModel()
                    {
                        MsgCode = "500",
                        Msg = ex.ToString(),
                    };
                }
            }
        }

        [Authorize]
        [HttpGet("[action]")]
        public SessionDataModel GetUser()
        {
            try
            {
                var res = Uow.AllRepositoryMethod.GetUser();

                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "User Get Successfully",
                    ResponseData = res,
                };
            }
            catch (Exception ex)
            {
                return new SessionDataModel()
                {
                    MsgCode = "500",
                    Msg = ex.ToString(),
                };
            }
        }


        [Authorize]
        [HttpPost("[action]")]
        public async Task<SessionDataModel> UserUpdate([FromBody] User entity)
        {
            try
            {
                entity.UpdatedAt = DateTime.Now;
                await Uow.TblUser.Update(entity);

                var search = await Uow.TblUsersRole.FirstOrDefault(m => m.UserRoleID == entity.UserRoleID);
                search.RoleID = entity.RoleID;
                search.UserID = entity.UserID;
                await Uow.TblUsersRole.Update(search);


                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "User Update Successfully",
                };
            }
            catch (Exception ex)
            {
                return new SessionDataModel()
                {
                    MsgCode = "500",
                    Msg = ex.ToString(),
                };
            }
        }
    }
}
