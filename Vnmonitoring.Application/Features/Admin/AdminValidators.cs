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
