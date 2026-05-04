using MediatR;
using Microsoft.AspNetCore.Identity;
using Vnmonitoring.Application.Abstractions.Repositories;
using Vnmonitoring.Application.Abstractions.Services;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Features.Auth.Login;

public sealed class LoginCommandHandler : IRequestHandler<LoginCommand, LoginResult>
{
    private readonly IUserRepository _userRepository;
    private readonly IJwtTokenService _jwtTokenService;
    private readonly IPasswordHasher<SysMember> _passwordHasher;

    public LoginCommandHandler(
        IUserRepository userRepository,
        IJwtTokenService jwtTokenService,
        IPasswordHasher<SysMember> passwordHasher)
    {
        _userRepository = userRepository;
        _jwtTokenService = jwtTokenService;
        _passwordHasher = passwordHasher;
    }

    public async Task<LoginResult> Handle(LoginCommand request, CancellationToken cancellationToken)
    {
        var user = await _userRepository.GetByUsernameAsync(request.Username, cancellationToken);
        if (user is null)
        {
            return LoginResult.Failure("Sai tên đăng nhập");
        }

        if (user.MemActive == false && user.MemDeleteAt != null)
        {
            return LoginResult.Failure("Tài khoản đã bị xóa ko thể đăng nhập !");
        }

        if (user.MemActive == false)
        {
            return LoginResult.Failure("Tài khoản đã bị khóa ko thể đăng nhập !");
        }

        var verifyResult = _passwordHasher.VerifyHashedPassword(user, user.MemPassword ?? string.Empty, request.Password);
        if (verifyResult != PasswordVerificationResult.Success)
        {
            return LoginResult.Failure("Sai  mật khẩu.");
        }

        var userRoles = await _userRepository.GetRoleIdsByMemberAsync(user.MemId, cancellationToken);
        var organizationRoles = Array.Empty<long?>();

        if (user.MemCq?.CqId is int organizationId)
        {
            organizationRoles = (await _userRepository.GetRoleIdsByOrganizationAsync(organizationId, cancellationToken)).ToArray();
        }

        var allRoleCodes = (await _userRepository
                .GetRoleCodesAsync(userRoles.Union(organizationRoles).Distinct(), cancellationToken))
            .Where(role => !string.IsNullOrWhiteSpace(role))
            .Select(role => role!)
            .ToList();

        var token = _jwtTokenService.GenerateToken(user.MemUsername, allRoleCodes);
        user.MemLastloginAt = DateTime.Now;

        await _userRepository.UpdateAsync(user, cancellationToken);
        await _userRepository.SaveChangesAsync(cancellationToken);

        return LoginResult.Success(new LoginResponse
        {
            Username = user.MemUsername,
            FullName = user.MemHoten ?? string.Empty,
            IdUser = user.MemId,
            Role = allRoleCodes.Any(),
            Token = token
        });
    }
}
