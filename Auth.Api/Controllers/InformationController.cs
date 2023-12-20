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
    public class InformationController : BaseController
    {
        public InformationController(IUnitOfWork uow)
        {
            Uow = uow;
        }
        [HttpPost("[action]")]
        public async Task<SessionDataModel> InformationSave([FromBody] Information entity)
        {
            try
            {
                await Uow.TblInformation.Add(entity);

                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Information Save Successfully",
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
        public async Task<SessionDataModel> InformationUpdate([FromBody] Information entity)
        {
            try
            {
                await Uow.TblInformation.Update(entity);
                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Information Update Successfully",
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


        [HttpGet("[action]")]
        public async Task<SessionDataModel> GetInformation()
        {
            try
            {
                var res = await Uow.TblInformation.GetAll();
                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Information Get Successfully",
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
    }
}
