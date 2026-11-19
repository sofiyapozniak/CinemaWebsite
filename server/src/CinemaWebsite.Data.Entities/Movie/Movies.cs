using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaWebsite.Data.Entities.Movie;

public class Movies
{
    public long Id { get; set; }

    public string Title { get; set; } = null!;

    public string? OriginalTitle { get; set; }

    public string? Description { get; set; }

    public int DurationMin { get; set; }

    public int? ReleaseYear { get; set; }

    public string? Country { get; set; }

    public string? Director { get; set; }

    public string AgeRating { get; set; } = null!;

    public string? Actors { get; set; }

    public string? PosterUrl { get; set; }

    public string? TrailerUrl { get; set; }

    public DateOnly? RentalStart { get; set; }

    public DateOnly? RentalEnd { get; set; }
}
