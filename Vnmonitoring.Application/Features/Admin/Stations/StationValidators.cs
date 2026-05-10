using FluentValidation;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
public sealed class GetAllStationsQueryValidator : AbstractValidator<GetAllStationsQuery>
{
    public GetAllStationsQueryValidator()
    {
        RuleFor(x => x.Page).GreaterThan(0);
        RuleFor(x => x.PageSize).InclusiveBetween(1, 500);
    }
}

public sealed class GetInvalidStationsQueryValidator : AbstractValidator<GetInvalidStationsQuery>
{
    public GetInvalidStationsQueryValidator()
    {
        RuleFor(x => x.Page).GreaterThan(0);
        RuleFor(x => x.PageSize).InclusiveBetween(1, 500);
    }
}

public sealed class GetStationsWithoutDataQueryValidator : AbstractValidator<GetStationsWithoutDataQuery>
{
    public GetStationsWithoutDataQueryValidator()
    {
        RuleFor(x => x.Type).NotEmpty();
        RuleFor(x => x.Page).GreaterThan(0);
        RuleFor(x => x.PageSize).InclusiveBetween(1, 500);
    }
}

public sealed class AddStationCommandValidator : AbstractValidator<AddStationCommand>
{
    public AddStationCommandValidator()
    {
        RuleFor(x => x.Model.StationId).NotEmpty();
        RuleFor(x => x.Model.StationName).NotEmpty();
        RuleFor(x => x.Model.Lat).InclusiveBetween(-90, 90).When(x => x.Model.Lat.HasValue);
        RuleFor(x => x.Model.Lon).InclusiveBetween(-180, 180).When(x => x.Model.Lon.HasValue);
    }
}

public sealed class UpdateStationCommandValidator : AbstractValidator<UpdateStationCommand>
{
    public UpdateStationCommandValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Model.Key).Equal(x => x.Id);
        RuleFor(x => x.Model.StationId).NotEmpty();
        RuleFor(x => x.Model.StationName).NotEmpty();
        RuleFor(x => x.Model.Lat).InclusiveBetween(-90, 90).When(x => x.Model.Lat.HasValue);
        RuleFor(x => x.Model.Lon).InclusiveBetween(-180, 180).When(x => x.Model.Lon.HasValue);
    }
}

public sealed class DeleteStationCommandValidator : AbstractValidator<DeleteStationCommand>
{
    public DeleteStationCommandValidator() => RuleFor(x => x.Id).NotEmpty();
}
