using Auth.Api.Controllers;
using Auth.Repository.Model.Common;
using Auth.Repository.Model.Entity;
using Auth.Repository.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace AuthApi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : BaseController
    {
        public RoleController(IUnitOfWork uow)
        {
            Uow = uow;
        }

        [HttpGet("[action]")]
        public async Task<SessionDataModel> GetRole()
        {
            try
            {
                var res = await Uow.TblRole.GetAll();
                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Role Get Successfully",
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


        [HttpPost("[action]")]
        public async Task<SessionDataModel> RoleSave([FromBody] Role entity)
        {
            try
            {
                entity.CreatedAt = DateTime.Now;
                entity.UpdateAt = DateTime.Now;
                await Uow.TblRole.Add(entity);

                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Role Save Successfully",
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


        [HttpPost("[action]")]
        public async Task<SessionDataModel> RoleUpdate([FromBody] Role entity)
        {
            try
            {
                entity.UpdateAt = DateTime.Now;
                await Uow.TblRole.Update(entity);

                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Role Update Successfully",
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
