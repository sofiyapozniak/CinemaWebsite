using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CinemaWebsite.Data.Entities.Booking;
using CinemaWebsite.Data.Entities.User;

namespace CinemaWebsite.Data.Entities.Transaction;

public class Transactions
{
    public long Id { get; set; }

    public long UserId { get; set; }

    public long? BookingId { get; set; }

    public string Type { get; set; } = null!;

    public decimal Amount { get; set; }

    public DateTime CreatedAt { get; set; }

    public Users User { get; set; } = null!;

    public Bookings? Booking { get; set; }
}