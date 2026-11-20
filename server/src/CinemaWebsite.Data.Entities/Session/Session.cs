namespace CinemaWebsite.Data.Entities;

public class Session
{
    public long Id { get; set; }

    public long MovieId { get; set; }

    public long HallId { get; set; }

    public DateTime StartTime { get; set; }

    public DateTime EndTime { get; set; }

    public decimal BasePrice { get; set; }

    public string Status { get; set; } = null!;

    public Movie Movie { get; set; } = null!;

    public Hall Hall { get; set; } = null!;
}
