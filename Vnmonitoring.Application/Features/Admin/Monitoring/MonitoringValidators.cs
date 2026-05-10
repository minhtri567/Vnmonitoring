using FluentValidation;

namespace Vnmonitoring.Application.Features.Admin;

using Vnmonitoring.Server.Models;
public sealed class CreateWeatherReportCommandValidator : AbstractValidator<CreateWeatherReportCommand>
{
    public CreateWeatherReportCommandValidator()
    {
        RuleFor(x => x.NameFile).NotEmpty();
        RuleFor(x => x.RequestTime).NotEqual(default(DateTime));
        RuleFor(x => x.NgayBatDau).NotEqual(default(DateTime));
        RuleFor(x => x.NgayKetThuc).GreaterThanOrEqualTo(x => x.NgayBatDau);
        RuleFor(x => x.RpType).NotEmpty();
        RuleFor(x => x.TanSuat).NotEmpty();
        RuleFor(x => x.Email).NotEmpty().EmailAddress();
        RuleFor(x => x.CreatedBy).NotEmpty();
        RuleFor(x => x.Stations).NotEmpty();
        RuleForEach(x => x.Stations).ChildRules(station =>
        {
            station.RuleFor(x => x.ProvinceId).GreaterThan(0);
            station.RuleFor(x => x.StationId).NotEmpty();
        });
    }
}

public sealed class GetMonitoringDataQueryValidator : AbstractValidator<GetMonitoringDataQuery>
{
    public GetMonitoringDataQueryValidator()
    {
        RuleFor(x => x.Page).GreaterThan(0);
        RuleFor(x => x.PageSize).InclusiveBetween(1, 500);
    }
}

public sealed class GetMonitoringDataByIdQueryValidator : AbstractValidator<GetMonitoringDataByIdQuery>
{
    public GetMonitoringDataByIdQueryValidator() => RuleFor(x => x.Id).GreaterThan(0);
}

public sealed class AddMonitoringDataCommandValidator : AbstractValidator<AddMonitoringDataCommand>
{
    public AddMonitoringDataCommandValidator()
    {
        RuleFor(x => x.Model.TsktId).GreaterThan(0);
        RuleFor(x => x.Model.DataThoigian).NotEqual(default(DateTime));
        RuleFor(x => x.Model.DataMaloaithongso).NotEmpty();
    }
}

public sealed class UpdateMonitoringDataCommandValidator : AbstractValidator<UpdateMonitoringDataCommand>
{
    public UpdateMonitoringDataCommandValidator()
    {
        RuleFor(x => x.Id).GreaterThan(0);
        RuleFor(x => x.Model.DataId).Equal(x => x.Id);
        RuleFor(x => x.Model.TsktId).GreaterThan(0);
        RuleFor(x => x.Model.DataThoigian).NotEqual(default(DateTime));
        RuleFor(x => x.Model.DataMaloaithongso).NotEmpty();
    }
}

public sealed class DeleteMonitoringDataCommandValidator : AbstractValidator<DeleteMonitoringDataCommand>
{
    public DeleteMonitoringDataCommandValidator() => RuleFor(x => x.Id).GreaterThan(0);
}


