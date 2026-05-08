using FluentValidation;

namespace Vnmonitoring.Server.Validation;

public sealed class IntValidator : AbstractValidator<int>
{
    public IntValidator()
    {
        RuleFor(value => value)
            .GreaterThan(0)
            .WithMessage("ID phải lớn hơn 0.");
    }
}

public sealed class LongValidator : AbstractValidator<long>
{
    public LongValidator()
    {
        RuleFor(value => value)
            .GreaterThan(0)
            .WithMessage("ID phải lớn hơn 0.");
    }
}

public sealed class GuidValidator : AbstractValidator<Guid>
{
    public GuidValidator()
    {
        RuleFor(value => value)
            .NotEmpty()
            .WithMessage("ID không hợp lệ.");
    }
}
