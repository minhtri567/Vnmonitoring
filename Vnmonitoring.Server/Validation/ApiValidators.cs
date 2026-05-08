using FluentValidation;
using Vnmonitoring.Server.DTOs;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Server.Validation;

public sealed class LoginRequestValidator : AbstractValidator<LoginRequest>
{
    public LoginRequestValidator()
    {
        RuleFor(x => x.Username)
            .NotEmpty().WithMessage("Tên đăng nhập không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.Password)
            .NotEmpty().WithMessage("Mật khẩu không được để trống.")
            .MaximumLength(250);
    }
}

public sealed class SysDanhmucPhanloaiValidator : AbstractValidator<SysDanhmucPhanloai>
{
    public SysDanhmucPhanloaiValidator()
    {
        RuleFor(x => x.LdmTen)
            .NotEmpty().WithMessage("Tên phân loại không được để trống.")
            .MaximumLength(200);

        RuleFor(x => x.LdmMa)
            .NotEmpty().WithMessage("Mã phân loại không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.LdmPid)
            .GreaterThan(0).When(x => x.LdmPid.HasValue)
            .WithMessage("LdmPid phải lớn hơn 0.");
    }
}

public sealed class SysFunctionValidator : AbstractValidator<SysFunction>
{
    public SysFunctionValidator()
    {
        RuleFor(x => x.FnTen)
            .NotEmpty().WithMessage("Tên chức năng không được để trống.")
            .MaximumLength(500);

        RuleFor(x => x.FnMa)
            .NotEmpty().WithMessage("Mã chức năng không được để trống.")
            .MaximumLength(50);

        RuleFor(x => x.FnUrl)
            .NotEmpty().WithMessage("URL chức năng không được để trống.")
            .MaximumLength(250);
    }
}

public sealed class SysDanhmucValidator : AbstractValidator<SysDanhmuc>
{
    public SysDanhmucValidator()
    {
        RuleFor(x => x.DmTen)
            .NotEmpty().WithMessage("Tên danh mục không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.DmMa)
            .NotEmpty().WithMessage("Mã danh mục không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.DmLdmId)
            .NotNull().WithMessage("Loại danh mục là bắt buộc.")
            .GreaterThan(0).WithMessage("Loại danh mục không hợp lệ.");

        RuleFor(x => x.Functionid)
            .GreaterThan(0).When(x => x.Functionid.HasValue)
            .WithMessage("FunctionId phải lớn hơn 0.");
    }
}

public sealed class MapboxApikeyValidator : AbstractValidator<MapboxApikey>
{
    public MapboxApikeyValidator()
    {
        RuleFor(x => x.KeyValue)
            .NotEmpty().WithMessage("API key không được để trống.");
    }
}

public sealed class MapSourceValidator : AbstractValidator<MapSource>
{
    public MapSourceValidator()
    {
        RuleFor(x => x.Name)
            .NotEmpty().WithMessage("Tên nguồn bản đồ không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.SourceType)
            .NotEmpty().WithMessage("Loại source không được để trống.")
            .MaximumLength(20);

        RuleFor(x => x.SourceUrl)
            .NotEmpty().WithMessage("Source URL không được để trống.");

        RuleFor(x => x.ApikeyId)
            .GreaterThan(0).When(x => x.ApikeyId.HasValue)
            .WithMessage("ApikeyId phải lớn hơn 0.");
    }
}

public sealed class MapLayerValidator : AbstractValidator<MapLayer>
{
    public MapLayerValidator()
    {
        RuleFor(x => x.Name)
            .NotEmpty().WithMessage("Tên layer không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.LayerType)
            .NotEmpty().When(x => x.IsGroup != true)
            .WithMessage("Layer type là bắt buộc khi không phải group.");

        RuleFor(x => x.SourceId)
            .GreaterThan(0).When(x => x.SourceId.HasValue)
            .WithMessage("SourceId phải lớn hơn 0.");

        RuleFor(x => x.ParentId)
            .GreaterThan(0).When(x => x.ParentId.HasValue)
            .WithMessage("ParentId phải lớn hơn 0.");

        RuleFor(x => x.MinZoom)
            .InclusiveBetween(0, 24).When(x => x.MinZoom.HasValue)
            .WithMessage("MinZoom phải nằm trong khoảng 0-24.");

        RuleFor(x => x.MaxZoom)
            .InclusiveBetween(0, 24).When(x => x.MaxZoom.HasValue)
            .WithMessage("MaxZoom phải nằm trong khoảng 0-24.");

        RuleFor(x => x)
            .Must(x => !x.MinZoom.HasValue || !x.MaxZoom.HasValue || x.MinZoom <= x.MaxZoom)
            .WithMessage("MinZoom không được lớn hơn MaxZoom.");
    }
}

public sealed class StationDtoValidator : AbstractValidator<StationDto>
{
    public StationDtoValidator()
    {
        RuleFor(x => x.provine_id)
            .GreaterThan(0)
            .WithMessage("Tỉnh/thành không hợp lệ.");

        RuleFor(x => x.station_id)
            .NotEmpty().WithMessage("Mã trạm không được để trống.");
    }
}

public sealed class CreateWeatherReportDtoValidator : AbstractValidator<CreateWeatherReportDto>
{
    public CreateWeatherReportDtoValidator()
    {
        RuleFor(x => x.name_file)
            .NotEmpty().WithMessage("Tên file không được để trống.");

        RuleFor(x => x.request_time)
            .NotEqual(default(DateTime)).WithMessage("Thời gian yêu cầu không hợp lệ.");

        RuleFor(x => x.ngaybatdau)
            .NotEqual(default(DateTime)).WithMessage("Ngày bắt đầu không hợp lệ.");

        RuleFor(x => x.ngayketthuc)
            .NotEqual(default(DateTime)).WithMessage("Ngày kết thúc không hợp lệ.")
            .GreaterThanOrEqualTo(x => x.ngaybatdau).WithMessage("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu.");

        RuleFor(x => x.rp_type)
            .NotEmpty().WithMessage("Loại báo cáo không được để trống.");

        RuleFor(x => x.tansuat)
            .NotEmpty().WithMessage("Tần suất không được để trống.");

        RuleFor(x => x.email)
            .NotEmpty().WithMessage("Email không được để trống.")
            .EmailAddress().WithMessage("Email không đúng định dạng.");

        RuleFor(x => x.created_by)
            .NotEmpty().WithMessage("Người tạo không hợp lệ.");

        RuleFor(x => x.stations)
            .NotEmpty().WithMessage("Danh sách trạm không được để trống.");

        RuleForEach(x => x.stations).SetValidator(new StationDtoValidator());
    }
}

public sealed class SysMemberValidator : AbstractValidator<SysMember>
{
    public SysMemberValidator()
    {
        RuleFor(x => x.MemUsername)
            .NotEmpty().WithMessage("Tên đăng nhập không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.MemHoten)
            .NotEmpty().WithMessage("Họ tên không được để trống.")
            .MaximumLength(450);

        RuleFor(x => x.MemPassword)
            .MinimumLength(6).When(x => !string.IsNullOrWhiteSpace(x.MemPassword))
            .WithMessage("Mật khẩu phải có ít nhất 6 ký tự.");

        RuleFor(x => x.MemEmail)
            .EmailAddress().When(x => !string.IsNullOrWhiteSpace(x.MemEmail))
            .WithMessage("Email không đúng định dạng.");

        RuleFor(x => x.MemCqId)
            .GreaterThan(0).When(x => x.MemCqId.HasValue)
            .WithMessage("Cơ quan không hợp lệ.");
    }
}

public sealed class SysRoleValidator : AbstractValidator<SysRole>
{
    public SysRoleValidator()
    {
        RuleFor(x => x.RoleTen)
            .NotEmpty().WithMessage("Tên vai trò không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.RoleMa)
            .NotEmpty().WithMessage("Mã vai trò không được để trống.")
            .MaximumLength(150);

        RuleFor(x => x.RoleStt)
            .GreaterThanOrEqualTo(0).When(x => x.RoleStt.HasValue)
            .WithMessage("Thứ tự vai trò không hợp lệ.");
    }
}

public sealed class MonitoringStationValidator : AbstractValidator<MonitoringStation>
{
    public MonitoringStationValidator()
    {
        RuleFor(x => x.StationId)
            .NotEmpty().WithMessage("Mã trạm không được để trống.");

        RuleFor(x => x.StationName)
            .NotEmpty().WithMessage("Tên trạm không được để trống.");

        RuleFor(x => x.CommuneId)
            .GreaterThan(0).When(x => x.CommuneId.HasValue)
            .WithMessage("Xã/phường không hợp lệ.");

        RuleFor(x => x.Lat)
            .InclusiveBetween(-90, 90).When(x => x.Lat.HasValue)
            .WithMessage("Vĩ độ phải nằm trong khoảng -90 đến 90.");

        RuleFor(x => x.Lon)
            .InclusiveBetween(-180, 180).When(x => x.Lon.HasValue)
            .WithMessage("Kinh độ phải nằm trong khoảng -180 đến 180.");
    }
}

public sealed class MonitoringDatumValidator : AbstractValidator<MonitoringDatum>
{
    public MonitoringDatumValidator()
    {
        RuleFor(x => x.TsktId)
            .GreaterThan(0)
            .WithMessage("TsktId không hợp lệ.");

        RuleFor(x => x.DataThoigian)
            .NotEqual(default(DateTime))
            .WithMessage("Thời gian dữ liệu không hợp lệ.");

        RuleFor(x => x.DataMaloaithongso)
            .NotEmpty()
            .WithMessage("Mã loại thông số không được để trống.");

        RuleFor(x => x)
            .Must(x => x.DataGiatriSothuc.HasValue || !string.IsNullOrWhiteSpace(x.DataGiatriChuoi))
            .WithMessage("Phải có giá trị số thực hoặc giá trị chuỗi.");
    }
}
