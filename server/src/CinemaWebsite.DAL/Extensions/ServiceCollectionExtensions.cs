
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CinemaWebsite.DAL.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddDal(
        this IServiceCollection services,
        string connectionString)
    {
        services.AddDbContext<CinemaWebsiteDatabaseContext>(
            options => options.UseNpgsql(connectionString));

        return services;
    }
}
