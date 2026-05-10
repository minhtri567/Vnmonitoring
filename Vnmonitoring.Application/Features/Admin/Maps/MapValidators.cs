using FluentValidation;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
public sealed class AddApiKeyCommandValidator : AbstractValidator<AddApiKeyCommand>
{
    public AddApiKeyCommandValidator() => RuleFor(x => x.Model.KeyValue).NotEmpty();
}

public sealed class UpdateApiKeyCommandValidator : AbstractValidator<UpdateApiKeyCommand>
{
    public UpdateApiKeyCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.Id).Equal(x => x.Id);
        RuleFor(x => x.Model.KeyValue).NotEmpty();
    }
}

public sealed class DeleteApiKeyCommandValidator : AbstractValidator<DeleteApiKeyCommand>
{
    public DeleteApiKeyCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}

public sealed class AddMapSourceCommandValidator : AbstractValidator<AddMapSourceCommand>
{
    public AddMapSourceCommandValidator()
    {
        RuleFor(x => x.Model.Name).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.SourceType).NotEmpty().MaximumLength(20);
        RuleFor(x => x.Model.SourceUrl).NotEmpty();
    }
}

public sealed class UpdateMapSourceCommandValidator : AbstractValidator<UpdateMapSourceCommand>
{
    public UpdateMapSourceCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.Id).Equal(x => x.Id);
        RuleFor(x => x.Model.Name).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.SourceType).NotEmpty().MaximumLength(20);
        RuleFor(x => x.Model.SourceUrl).NotEmpty();
    }
}

public sealed class DeleteMapSourceCommandValidator : AbstractValidator<DeleteMapSourceCommand>
{
    public DeleteMapSourceCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}

public sealed class AddMapLayerCommandValidator : AbstractValidator<AddMapLayerCommand>
{
    public AddMapLayerCommandValidator()
    {
        RuleFor(x => x.Model.Name).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.MinZoom).InclusiveBetween(0, 24).When(x => x.Model.MinZoom.HasValue);
        RuleFor(x => x.Model.MaxZoom).InclusiveBetween(0, 24).When(x => x.Model.MaxZoom.HasValue);
        RuleFor(x => x.Model).Must(x => !x.MinZoom.HasValue || !x.MaxZoom.HasValue || x.MinZoom <= x.MaxZoom)
            .WithMessage("MinZoom không được lớn hơn MaxZoom.");
    }
}

public sealed class UpdateMapLayerCommandValidator : AbstractValidator<UpdateMapLayerCommand>
{
    public UpdateMapLayerCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.Id).Equal(x => x.Id);
        RuleFor(x => x.Model.Name).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Model.MinZoom).InclusiveBetween(0, 24).When(x => x.Model.MinZoom.HasValue);
        RuleFor(x => x.Model.MaxZoom).InclusiveBetween(0, 24).When(x => x.Model.MaxZoom.HasValue);
        RuleFor(x => x.Model).Must(x => !x.MinZoom.HasValue || !x.MaxZoom.HasValue || x.MinZoom <= x.MaxZoom)
            .WithMessage("MinZoom không được lớn hơn MaxZoom.");
    }
}

public sealed class DeleteMapLayerCommandValidator : AbstractValidator<DeleteMapLayerCommand>
{
    public DeleteMapLayerCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}
