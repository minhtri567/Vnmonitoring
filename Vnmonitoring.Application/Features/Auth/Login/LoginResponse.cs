namespace Vnmonitoring.Application.Features.Auth.Login;

public sealed class LoginResponse
{
    public string Username { get; init; } = string.Empty;
    public string FullName { get; init; } = string.Empty;
    public Guid IdUser { get; init; }
    public bool Role { get; init; }
    public string Token { get; init; } = string.Empty;
}
