using FluentValidation;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
public sealed class CreateUserCommandValidator : AbstractValidator<CreateUserCommand>
{
    public CreateUserCommandValidator()
    {
        RuleFor(x => x.Model.MemUsername).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.MemHoten).NotEmpty().MaximumLength(450);
        RuleFor(x => x.Model.MemPassword).NotEmpty().MinimumLength(6);
        RuleFor(x => x.Model.MemEmail).EmailAddress().When(x => !string.IsNullOrWhiteSpace(x.Model.MemEmail));
    }
}

public sealed class UpdateUserCommandValidator : AbstractValidator<UpdateUserCommand>
{
    public UpdateUserCommandValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Model.MemId).Equal(x => x.Id);
        RuleFor(x => x.Model.MemUsername).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.MemHoten).NotEmpty().MaximumLength(450);
        RuleFor(x => x.Model.MemEmail).EmailAddress().When(x => !string.IsNullOrWhiteSpace(x.Model.MemEmail));
    }
}

public sealed class DeleteUserCommandValidator : AbstractValidator<DeleteUserCommand>
{
    public DeleteUserCommandValidator() => RuleFor(x => x.Id).NotEmpty();
}

public sealed class AddRoleCommandValidator : AbstractValidator<AddRoleCommand>
{
    public AddRoleCommandValidator()
    {
        RuleFor(x => x.Model.RoleTen).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.RoleMa).NotEmpty().MaximumLength(150);
    }
}

public sealed class UpdateRoleCommandValidator : AbstractValidator<UpdateRoleCommand>
{
    public UpdateRoleCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.RoleId).Equal(x => x.Id);
        RuleFor(x => x.Model.RoleTen).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.RoleMa).NotEmpty().MaximumLength(150);
    }
}

public sealed class DeleteRoleCommandValidator : AbstractValidator<DeleteRoleCommand>
{
    public DeleteRoleCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}
