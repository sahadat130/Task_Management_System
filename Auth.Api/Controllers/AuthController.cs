using Auth.Api.Controllers;
using Auth.Repository.Model.Common;
using Auth.Repository.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace AuthApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : BaseController
    {
        public AuthController(IUnitOfWork uow)
        {
            Uow = uow;
        }

        [HttpPost("[action]")]
        public async Task<SessionDataModel> Login([FromBody] LoginEntity entity)
        {
            try
            {
                var search = await Uow.TblUser.FirstOrDefault(m => m.Email == entity.email && m.Password == entity.Password);
                SessionDataModel SDM = new SessionDataModel();
                SDM.UserID = search.UserID;
                SDM.UserName = search.UserName;
                var Token = CreateJwt(SDM);
                if (search != null)
                {
                    return new SessionDataModel()
                    {
                        MsgCode = "200",
                        Msg = "Login Successfully",
                        UserID = search.UserID,
                        Token = Token,
                    };
                }
                else
                {
                    return new SessionDataModel()
                    {
                        MsgCode = "500",
                        Msg = "Login Unsuccessfully",
                    };

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        [Authorize]
        [HttpGet("[action]")]
        public async Task<SessionDataModel> GetMenu()
        {
            try
            {
                var res = await Uow.TblMenuInfo.GetAll();
                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Menu Get Successfully",
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
        [HttpGet("[action]/{UserId:int}")]
        public SessionDataModel GetMenuUserWise(int UserId)
        {
            try
            {
                var res = Uow.AllRepositoryMethod.GetMenuUserWise(UserId);
                return new SessionDataModel()
                {
                    MsgCode = "200",
                    Msg = "Menu Get Successfully",
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

        private string CreateJwt(SessionDataModel entity)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes("ShahadatHossainHasib");
            var identity = new ClaimsIdentity(new Claim[]
            {
                 new Claim(ClaimTypes.Role, $"{entity.UserID}"),
                 new Claim(ClaimTypes.Name,$"{entity.UserName}")
            });

            var credentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = identity,
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = credentials
            };
            var token = jwtTokenHandler.CreateToken(tokenDescriptor);
            return jwtTokenHandler.WriteToken(token);
        }
    }
}
