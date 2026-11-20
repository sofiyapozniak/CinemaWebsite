using CinemaWebsite.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Configurations;

public class MovieConfiguration : IEntityTypeConfiguration<Movie>
{
    public void Configure(EntityTypeBuilder<Movie> builder)
    {
        builder.ToTable("movies");

        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id)
            .HasColumnName("id")
            .UseIdentityAlwaysColumn();

        builder.Property(x => x.Title)
            .HasColumnName("title")
            .HasMaxLength(200)
            .IsRequired();

        builder.Property(x => x.OriginalTitle)
            .HasColumnName("original_title")
            .HasMaxLength(255);

        builder.Property(x => x.Description)
            .HasColumnName("description")
            .HasColumnType("text");

        builder.Property(x => x.DurationMin)
            .HasColumnName("duration_min")
            .IsRequired();

        builder.Property(x => x.AgeRating)
            .HasColumnName("age_rating")
            .HasMaxLength(10)
            .IsRequired();

        builder.Property(x => x.ReleaseYear)
            .HasColumnName("release_year");

        builder.Property(x => x.Country)
            .HasColumnName("country")
            .HasMaxLength(100);

        builder.Property(x => x.Director)
            .HasColumnName("director")
            .HasMaxLength(150);

        builder.Property(x => x.Actors)
            .HasColumnName("actors")
            .HasColumnType("text");

        builder.Property(x => x.PosterUrl)
            .HasColumnName("poster_url")
            .HasMaxLength(500);

        builder.Property(x => x.TrailerUrl)
            .HasColumnName("trailer_url")
            .HasMaxLength(500);

        builder.Property(x => x.RentalStart)
            .HasColumnName("rental_start")
            .HasColumnType("date");

        builder.Property(x => x.RentalEnd)
            .HasColumnName("rental_end")
            .HasColumnType("date");
    }
}
