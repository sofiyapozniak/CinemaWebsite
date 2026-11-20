namespace CinemaWebsite.Data.Entities;

public class Transaction
{
    public long Id { get; set; }

    public long UserId { get; set; }

    public long? BookingId { get; set; }

    public string Type { get; set; } = null!;

    public decimal Amount { get; set; }

    public DateTime CreatedAt { get; set; }

    public User User { get; set; } = null!;

    public Booking? Booking { get; set; }
}
