using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Vnmonitoring.Application.Abstractions.Persistence;
using Vnmonitoring.Application.Abstractions.Repositories;
using Vnmonitoring.Server.Services;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("DefaultConnection");
        if (string.IsNullOrWhiteSpace(connectionString))
        {
            throw new InvalidOperationException("DefaultConnection is not configured in appsettings.");
        }

        services.AddDbContext<WeatherDataContext>(options =>
            options.UseNpgsql(connectionString, x => x.UseNetTopologySuite()));
        services.AddScoped<IWeatherDataContext>(serviceProvider => serviceProvider.GetRequiredService<WeatherDataContext>());

        services.AddScoped<IUserRepository, UserRepository>();

        services.Configure<MyConfig>(configuration.GetSection("MyConfig"));
        services.Configure<EmailHelper.SmtpSettings>(configuration.GetSection("SmtpSettings"));

        services.AddSingleton<ReportQueue>();
        services.AddSingleton<Vnmonitoring.Application.Abstractions.Services.IReportQueue>(serviceProvider => serviceProvider.GetRequiredService<ReportQueue>());
        services.AddHostedService<WeatherReportProcessor>();
        services.AddHttpClient<IRainDataService, RainDataService>();
        services.AddHostedService<RainDataHostedService>();
        services.AddTransient<EmailHelper>();

        return services;
    }
}
