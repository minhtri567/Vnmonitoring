namespace Vnmonitoring.Application.Abstractions.Services;

public interface IJwtTokenService
{
    string GenerateToken(string username, IEnumerable<string> roles);
}
