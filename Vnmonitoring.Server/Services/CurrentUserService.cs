using Vnmonitoring.Application.Abstractions.Services;

namespace Vnmonitoring.Server.Services;

public sealed class CurrentUserService : ICurrentUserService
{
    private readonly IHttpContextAccessor _httpContextAccessor;

    public CurrentUserService(IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
    }

    public string Username => _httpContextAccessor.HttpContext?.User?.Identity?.Name ?? "unknown";
}
