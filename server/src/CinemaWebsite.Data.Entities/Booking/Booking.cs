namespace CinemaWebsite.Data.Entities;

public class Booking
{
    public long Id { get; set; }

    public long UserId { get; set; }

    public long SessionId { get; set; }

    public string Status { get; set; } = null!;

    public DateTime? ExpiresAt { get; set; }

    public DateTime CreatedAt { get; set; }

    public User User { get; set; } = null!;

    public Session Session { get; set; } = null!;
}
