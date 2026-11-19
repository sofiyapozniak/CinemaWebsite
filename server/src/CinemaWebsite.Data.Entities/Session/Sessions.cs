using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CinemaWebsite.Data.Entities.Cinema;
using CinemaWebsite.Data.Entities.Movie;

namespace CinemaWebsite.Data.Entities.Session;

public class Sessions
{
    public long Id { get; set; }

    public long MovieId { get; set; }

    public long HallId { get; set; }

    public DateTime StartTime { get; set; }

    public DateTime EndTime { get; set; }

    public decimal BasePrice { get; set; }

    public string Status { get; set; } = null!;

    public Movies Movie { get; set; } = null!;

    public Halls Hall { get; set; } = null!;
}