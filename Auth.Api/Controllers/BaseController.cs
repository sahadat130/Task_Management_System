using Auth.Repository.UnitOfWork;
using Microsoft.AspNetCore.Mvc;
namespace Auth.Api.Controllers
{
    public class BaseController : ControllerBase
    {
        protected IUnitOfWork Uow { get; set; }
    }
}
