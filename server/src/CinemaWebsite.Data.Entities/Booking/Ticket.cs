namespace CinemaWebsite.Data.Entities;

public class Ticket
{
    public long Id { get; set; }

    public long BookingId { get; set; }

    public long SeatId { get; set; }

    public decimal Price { get; set; }

    public Booking Booking { get; set; } = null!;

    public Seat Seat { get; set; } = null!;
}
