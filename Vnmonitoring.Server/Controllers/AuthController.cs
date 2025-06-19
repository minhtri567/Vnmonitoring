using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Vnmonitoring.Server.Models;
using Vnmonitoring.Server.Services;

namespace Vnmonitoring.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly JwtService _jwtService;
        private readonly WeatherDataContext _context;
        public AuthController(JwtService jwtService, WeatherDataContext context)
        {
            _jwtService = jwtService;
            _context = context;
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginRequest request)
        {
            var user = _context.SysMembers
                .FirstOrDefault(u => u.MemUsername == request.Username && u.MemPassword == request.Password);

            if (user == null)
                return Unauthorized(new { message = "Invalid username or password" });

            var userRoles = _context.SysRoleMembers
                .Where(rm => rm.MemId == user.MemId)
                .Select(rm => rm.RoleId)
                .ToList();

            List<long?> cqRoles = new List<long?>();

            if (user.MemCq != null && user.MemCq.CqId != null)
            {
                cqRoles = _context.SysRoleCoquans
                    .Where(rc => rc.CqId == user.MemCq.CqId)
                    .Select(rc => rc.RoleId)
                    .ToList();
            }

            var allRoleIds = userRoles.Union(cqRoles).Distinct().ToList();

            var allRoleNames = _context.SysRoles
                .Where(r => allRoleIds.Contains(r.RoleId))
                .Select(r => r.RoleMa)
                .ToList();

            var rolebool = allRoleNames.Any() ? true : false ;

            var token = _jwtService.GenerateToken(user.MemUsername, allRoleNames);

            return Ok(new
            {
                username = user.MemUsername,
                fullName = user.MemHoten,
                iduser = user.MemId,
                role = rolebool,
                Token = token
            });
        }

    }
}
