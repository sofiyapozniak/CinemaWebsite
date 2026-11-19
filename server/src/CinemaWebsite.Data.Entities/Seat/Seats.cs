using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CinemaWebsite.Data.Entities.Cinema;

namespace CinemaWebsite.Data.Entities.Seat;

public class Seats
{
    public long Id { get; set; }

    public long HallId { get; set; }

    public long SeatTypeId { get; set; }

    public int RowNumber { get; set; }

    public int SeatNumber { get; set; }

    public int? PosX { get; set; }

    public int? PosY { get; set; }

    public Halls Hall { get; set; } = null!;

    public SeatTypes SeatType { get; set; } = null!;
}
