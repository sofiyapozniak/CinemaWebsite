using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CinemaWebsite.Data.Entities.Seat;

namespace CinemaWebsite.Data.Entities.Booking;

public class Tickets
{
    public long Id { get; set; }

    public long BookingId { get; set; }

    public long SeatId { get; set; }

    public decimal Price { get; set; }

    public Bookings Booking { get; set; } = null!;

    public Seats Seat { get; set; } = null!;
}
