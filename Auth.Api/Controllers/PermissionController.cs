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
    [Route("api/[controller]")]
    [ApiController]
    public class PermissionController : BaseController
    {
        public PermissionController(IUnitOfWork uow)
        {
            Uow = uow;
        }
        [Authorize]
        [HttpGet("[action]")]
        public SessionDataModel GetPermission()
        {
            try
            {
                var res = Uow.AllRepositoryMethod.GetPermission();
                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Permission Get Successfull",
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
        public async Task<SessionDataModel> PermissionSave([FromBody] Permission entity)
        {
            try
            {
                entity.CreatedAt = DateTime.Now;
                entity.UpdatedAt = DateTime.Now;
                await Uow.TblPermission.Add(entity);

                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Permission Save Successfull",
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
        public async Task<SessionDataModel> PermissionUpdate([FromBody] Permission entity)
        {
            try
            {
                entity.UpdatedAt = DateTime.Now;
                await Uow.TblPermission.Update(entity);

                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Permission Update Successfull",
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
