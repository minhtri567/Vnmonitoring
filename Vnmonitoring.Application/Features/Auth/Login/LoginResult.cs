namespace Vnmonitoring.Application.Features.Auth.Login;

public sealed class LoginResult
{
    public bool Succeeded { get; init; }
    public string? ErrorMessage { get; init; }
    public LoginResponse? Response { get; init; }

    public static LoginResult Success(LoginResponse response) => new()
    {
        Succeeded = true,
        Response = response
    };

    public static LoginResult Failure(string message) => new()
    {
        Succeeded = false,
        ErrorMessage = message
    };
}
