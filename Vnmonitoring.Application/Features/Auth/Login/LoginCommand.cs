using MediatR;

namespace Vnmonitoring.Application.Features.Auth.Login;

public sealed record LoginCommand(string Username, string Password) : IRequest<LoginResult>;
