
using CinemaWebsite.Data.Entities.Seat;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Extensions;

public class SeatTypesConfiguration : IEntityTypeConfiguration<SeatTypes>
{
    public void Configure(EntityTypeBuilder<SeatTypes> builder)
    {
        builder.ToTable("seat_types");

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.Name)
            .HasColumnName("name")
            .HasMaxLength(50)
            .IsRequired();

        builder.HasIndex(x => x.Name)
            .IsUnique();

        builder.Property(x => x.PriceCoefficient)
            .HasColumnName("price_coefficient")
            .HasPrecision(4, 2)
            .IsRequired();
    }
}
