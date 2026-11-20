namespace CinemaWebsite.Data.Entities;

public class SeatType
{
    public long Id { get; set; }

    public string Name { get; set; } = null!;

    public decimal PriceCoefficient { get; set; }
}
