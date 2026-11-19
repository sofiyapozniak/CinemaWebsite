using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CinemaWebsite.Data.Entities.Movie;

namespace CinemaWebsite.Data.Entities.Genre;

public class MovieGenres
{
    public long MovieId { get; set; }

    public long GenreId { get; set; }

    public Movies Movie { get; set; } = null!;

    public Genres Genre { get; set; } = null!;
}