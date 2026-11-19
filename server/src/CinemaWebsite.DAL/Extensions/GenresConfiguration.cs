
using CinemaWebsite.Data.Entities.Genre;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Extensions;

public class GenresConfiguration : IEntityTypeConfiguration<Genres>
{
    public void Configure(EntityTypeBuilder<Genres> builder)
    {
        builder.ToTable("genres");

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.Name)
            .HasColumnName("name")
            .HasMaxLength(100)
            .IsRequired();

        builder.HasIndex(x => x.Name)
            .IsUnique();
    }
}
