using CinemaWebsite.Data.Entities.User;
using CinemaWebsite.Data.Entities.Movie;
using CinemaWebsite.Data.Entities.Genre;
using CinemaWebsite.Data.Entities.Cinema;
using CinemaWebsite.Data.Entities.Seat;
using CinemaWebsite.Data.Entities.Session;
using CinemaWebsite.Data.Entities.Booking;
using CinemaWebsite.Data.Entities.Transaction;
using Microsoft.EntityFrameworkCore;

namespace CinemaWebsite.DAL;

public class CinemaWebsiteDatabaseContext : DbContext
{
    public CinemaWebsiteDatabaseContext(
        DbContextOptions<CinemaWebsiteDatabaseContext> options)
        : base(options)
    {
    }

    public DbSet<Role> Roles => Set<Role>();

    public DbSet<Users> Users => Set<Users>();

    public DbSet<Transactions> Transactions => Set<Transactions>();

    public DbSet<Movies> Movies => Set<Movies>();

    public DbSet<Genres> Genres => Set<Genres>();

    public DbSet<MovieGenres> MovieGenres => Set<MovieGenres>();

    public DbSet<Cinemas> Cinemas => Set<Cinemas>();

    public DbSet<Halls> Halls => Set<Halls>();

    public DbSet<SeatTypes> SeatTypes => Set<SeatTypes>();

    public DbSet<Seats> Seats => Set<Seats>();

    public DbSet<Sessions> Sessions => Set<Sessions>();

    public DbSet<Bookings> Bookings => Set<Bookings>();

    public DbSet<Tickets> Tickets => Set<Tickets>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfigurationsFromAssembly(
            typeof(CinemaWebsiteDatabaseContext).Assembly);
    }
}