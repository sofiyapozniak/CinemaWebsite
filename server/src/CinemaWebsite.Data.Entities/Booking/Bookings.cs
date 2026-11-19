using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CinemaWebsite.Data.Entities.Session;
using CinemaWebsite.Data.Entities.User;

namespace CinemaWebsite.Data.Entities.Booking;

public class Bookings
{
    public long Id { get; set; }

    public long UserId { get; set; }

    public long SessionId { get; set; }

    public string Status { get; set; } = null!;

    public DateTime? ExpiresAt { get; set; }

    public DateTime CreatedAt { get; set; }

    public Users User { get; set; } = null!;

    public Sessions Session { get; set; } = null!;
}
