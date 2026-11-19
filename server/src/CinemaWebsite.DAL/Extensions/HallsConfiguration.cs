
using CinemaWebsite.Data.Entities.Cinema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Extensions;

public class HallsConfiguration : IEntityTypeConfiguration<Halls>
{
    public void Configure(EntityTypeBuilder<Halls> builder)
    {
        builder.ToTable("halls");

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.CinemaId)
            .HasColumnName("cinema_id")
            .IsRequired();

        builder.Property(x => x.Name)
            .HasColumnName("name")
            .HasMaxLength(100)
            .IsRequired();

        builder.HasOne(x => x.Cinema)
            .WithMany(x => x.Halls)
            .HasForeignKey(x => x.CinemaId)
            .OnDelete(DeleteBehavior.NoAction);
    }
}
