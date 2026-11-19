
using CinemaWebsite.Data.Entities.Genre;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CinemaWebsite.DAL.Extensions;

public class MovieGenresConfiguration : IEntityTypeConfiguration<MovieGenres>
{
    public void Configure(EntityTypeBuilder<MovieGenres> builder)
    {
        builder.ToTable("movie_genres");

        builder.HasKey(x => new { x.MovieId, x.GenreId });

        builder.Property(x => x.MovieId)
            .HasColumnName("movie_id");

        builder.Property(x => x.GenreId)
            .HasColumnName("genre_id");

        builder.HasOne(x => x.Movie)
            .WithMany()
            .HasForeignKey(x => x.MovieId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasOne(x => x.Genre)
            .WithMany()
            .HasForeignKey(x => x.GenreId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
