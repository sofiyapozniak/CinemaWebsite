using CinemaWebsite.Data.Entities;
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

    public DbSet<User> Users => Set<User>();

    public DbSet<Transaction> Transactions => Set<Transaction>();

    public DbSet<Movie> Movies => Set<Movie>();

    public DbSet<Genre> Genres => Set<Genre>();

    public DbSet<MovieGenre> MovieGenres => Set<MovieGenre>();

    public DbSet<Cinema> Cinemas => Set<Cinema>();

    public DbSet<Hall> Halls => Set<Hall>();

    public DbSet<SeatType> SeatTypes => Set<SeatType>();

    public DbSet<Seat> Seats => Set<Seat>();

    public DbSet<Session> Sessions => Set<Session>();

    public DbSet<Booking> Bookings => Set<Booking>();

    public DbSet<Ticket> Tickets => Set<Ticket>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfigurationsFromAssembly(
            typeof(CinemaWebsiteDatabaseContext).Assembly);
    }
}
