
using CinemaWebsite.Data.Entities.Cinema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Extensions;

public class CinemasConfiguration : IEntityTypeConfiguration<Cinemas>
{
    public void Configure(EntityTypeBuilder<Cinemas> builder)
    {
        builder.ToTable("cinemas");

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.Name)
            .HasColumnName("name")
            .HasMaxLength(150)
            .IsRequired();

        builder.Property(x => x.Address)
            .HasColumnName("address")
            .HasMaxLength(255)
            .IsRequired();

        builder.Property(x => x.Phone)
            .HasColumnName("phone")
            .HasMaxLength(20);

        builder.Property(x => x.Email)
            .HasColumnName("email")
            .HasMaxLength(150);

        builder.Property(x => x.WorkingHours)
            .HasColumnName("working_hours")
            .HasMaxLength(100);
    }
}
