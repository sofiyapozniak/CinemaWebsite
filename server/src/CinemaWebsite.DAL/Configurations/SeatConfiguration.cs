using CinemaWebsite.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Configurations;

public class SeatConfiguration : IEntityTypeConfiguration<Seat>
{
    public void Configure(EntityTypeBuilder<Seat> builder)
    {
        builder.ToTable("seats");

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.HallId)
            .HasColumnName("hall_id")
            .IsRequired();

        builder.Property(x => x.SeatTypeId)
            .HasColumnName("seat_type_id")
            .IsRequired();

        builder.Property(x => x.RowNumber)
            .HasColumnName("row_number")
            .IsRequired();

        builder.Property(x => x.SeatNumber)
            .HasColumnName("seat_number")
            .IsRequired();

        builder.Property(x => x.PosX)
            .HasColumnName("pos_x");

        builder.Property(x => x.PosY)
            .HasColumnName("pos_y");

        builder.HasIndex(x => new
        {
            x.HallId,
            x.RowNumber,
            x.SeatNumber
        }).IsUnique();

        builder.HasOne(x => x.Hall)
            .WithMany()
            .HasForeignKey(x => x.HallId)
            .OnDelete(DeleteBehavior.NoAction);

        builder.HasOne(x => x.SeatType)
            .WithMany()
            .HasForeignKey(x => x.SeatTypeId)
            .OnDelete(DeleteBehavior.NoAction);
    }
}
