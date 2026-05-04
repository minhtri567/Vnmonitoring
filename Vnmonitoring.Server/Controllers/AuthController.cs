using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Vnmonitoring.Application.Features.Auth.Login;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly ISender _sender;

        public AuthController(ISender sender)
        {
            _sender = sender;
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request, CancellationToken cancellationToken)
        {
            var result = await _sender.Send(new LoginCommand(request.Username, request.Password), cancellationToken);
            if (!result.Succeeded)
            {
                return Unauthorized(new { message = result.ErrorMessage });
            }

            return Ok(result.Response);
        }
    }
}
