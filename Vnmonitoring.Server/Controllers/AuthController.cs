using DocumentFormat.OpenXml.Spreadsheet;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
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
        private readonly IPasswordHasher<SysMember> _passwordHasher;
        public AuthController(JwtService jwtService, WeatherDataContext context, IPasswordHasher<SysMember> passwordHasher)
        {
            _jwtService = jwtService;
            _context = context;
            _passwordHasher = passwordHasher;
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginRequest request)
        {
            var user = _context.SysMembers
                .FirstOrDefault(u => u.MemUsername == request.Username );

            if (user == null)
            {
                return Unauthorized(new { message = "Sai tên đăng nhập" });
            }
            
            if (user.MemActive == false && user.MemDeleteAt != null)
            {
                return Unauthorized(new { message = "Tài khoản đã bị xóa ko thể đăng nhập !" });
            }
            if (user.MemActive == false && user.MemDeleteAt == null)
            {
                return Unauthorized(new { message = "Tài khoản đã bị khóa ko thể đăng nhập !" });
            }

            var verifyResult = _passwordHasher.VerifyHashedPassword(user, user.MemPassword, request.Password);
            if (verifyResult != PasswordVerificationResult.Success)
                return Unauthorized(new { message = "Sai  mật khẩu." });

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

            user.MemLastloginAt = DateTime.Now;
            _context.SysMembers.Update(user);

            _context.SaveChangesAsync();

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
