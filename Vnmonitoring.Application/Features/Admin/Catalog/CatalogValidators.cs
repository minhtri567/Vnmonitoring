using FluentValidation;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
public sealed class AddPhanloaiCommandValidator : AbstractValidator<AddPhanloaiCommand>
{
    public AddPhanloaiCommandValidator()
    {
        RuleFor(x => x.Model.LdmTen).NotEmpty().MaximumLength(200);
        RuleFor(x => x.Model.LdmMa).NotEmpty().MaximumLength(150);
    }
}

public sealed class UpdatePhanloaiCommandValidator : AbstractValidator<UpdatePhanloaiCommand>
{
    public UpdatePhanloaiCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.LdmId).Equal(x => x.Id);
        RuleFor(x => x.Model.LdmTen).NotEmpty().MaximumLength(200);
        RuleFor(x => x.Model.LdmMa).NotEmpty().MaximumLength(150);
    }
}

public sealed class DeletePhanloaiCommandValidator : AbstractValidator<DeletePhanloaiCommand>
{
    public DeletePhanloaiCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}

public sealed class AddChucNangCommandValidator : AbstractValidator<AddChucNangCommand>
{
    public AddChucNangCommandValidator()
    {
        RuleFor(x => x.Model.FnTen).NotEmpty().MaximumLength(500);
        RuleFor(x => x.Model.FnMa).NotEmpty().MaximumLength(50);
        RuleFor(x => x.Model.FnUrl).NotEmpty().MaximumLength(250);
    }
}

public sealed class UpdateChucNangCommandValidator : AbstractValidator<UpdateChucNangCommand>
{
    public UpdateChucNangCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.FnId).Equal(x => x.Id);
        RuleFor(x => x.Model.FnTen).NotEmpty().MaximumLength(500);
        RuleFor(x => x.Model.FnMa).NotEmpty().MaximumLength(50);
        RuleFor(x => x.Model.FnUrl).NotEmpty().MaximumLength(250);
    }
}

public sealed class DeleteChucNangCommandValidator : AbstractValidator<DeleteChucNangCommand>
{
    public DeleteChucNangCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}

public sealed class AddDanhMucCommandValidator : AbstractValidator<AddDanhMucCommand>
{
    public AddDanhMucCommandValidator()
    {
        RuleFor(x => x.Model.DmTen).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.DmMa).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.DmLdmId).NotNull().GreaterThan(0);
    }
}

public sealed class UpdateDanhMucCommandValidator : AbstractValidator<UpdateDanhMucCommand>
{
    public UpdateDanhMucCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.DmId).Equal(x => x.Id);
        RuleFor(x => x.Model.DmTen).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.DmMa).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.DmLdmId).NotNull().GreaterThan(0);
    }
}

public sealed class DeleteDanhMucCommandValidator : AbstractValidator<DeleteDanhMucCommand>
{
    public DeleteDanhMucCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}
