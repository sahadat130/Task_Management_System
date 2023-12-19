using Microsoft.AspNetCore.Mvc;

namespace AuthUI.Controllers
{
    public class UIController : Controller
    {
        public new ActionResult User()
        {
            return View();
        }
    }
}
