
using CinemaWebsite.Data.Entities.Booking;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Extensions;

public class TicketsConfiguration : IEntityTypeConfiguration<Tickets>
{
    public void Configure(EntityTypeBuilder<Tickets> builder)
    {
        builder.ToTable("tickets", table =>
        {
            table.HasCheckConstraint(
                "tickets_price_check",
                "price >= 0");
        });

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.BookingId)
            .HasColumnName("booking_id")
            .IsRequired();

        builder.Property(x => x.SeatId)
            .HasColumnName("seat_id")
            .IsRequired();

        builder.Property(x => x.Price)
            .HasColumnName("price")
            .HasPrecision(10, 2)
            .IsRequired();

        builder.HasOne(x => x.Booking)
            .WithMany()
            .HasForeignKey(x => x.BookingId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(x => x.Seat)
            .WithMany()
            .HasForeignKey(x => x.SeatId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
