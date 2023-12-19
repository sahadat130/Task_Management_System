using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace WebApplication2.Pages
{
    public class RegisterModel : PageModel
    {
        private readonly ILogger<PrivacyModel> _logger;

        public RegisterModel(ILogger<PrivacyModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}
