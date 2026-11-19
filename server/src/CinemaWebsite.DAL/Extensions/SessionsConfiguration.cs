
using CinemaWebsite.Data.Entities.Session;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Extensions;

public class SessionsConfiguration : IEntityTypeConfiguration<Sessions>
{
    public void Configure(EntityTypeBuilder<Sessions> builder)
    {
        builder.ToTable("sessions", table =>
        {
            table.HasCheckConstraint(
                "sessions_base_price_check",
                "base_price >= 0");

            table.HasCheckConstraint(
                "sessions_check",
                "end_time > start_time");

            table.HasCheckConstraint(
                "sessions_status_check",
                "status IN ('active', 'cancelled')");
        });

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.MovieId)
            .HasColumnName("movie_id")
            .IsRequired();

        builder.Property(x => x.HallId)
            .HasColumnName("hall_id")
            .IsRequired();

        builder.Property(x => x.StartTime)
            .HasColumnName("start_time")
            .HasColumnType("timestamp without time zone")
            .IsRequired();

        builder.Property(x => x.EndTime)
            .HasColumnName("end_time")
            .HasColumnType("timestamp without time zone")
            .IsRequired();

        builder.Property(x => x.BasePrice)
            .HasColumnName("base_price")
            .HasPrecision(10, 2)
            .IsRequired();

        builder.Property(x => x.Status)
            .HasColumnName("status")
            .HasMaxLength(20)
            .HasDefaultValue("active")
            .IsRequired();

        builder.HasOne(x => x.Movie)
            .WithMany()
            .HasForeignKey(x => x.MovieId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(x => x.Hall)
            .WithMany()
            .HasForeignKey(x => x.HallId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
