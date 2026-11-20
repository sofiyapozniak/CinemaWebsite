namespace CinemaWebsite.Data.Entities;

public class Seat
{
    public long Id { get; set; }

    public long HallId { get; set; }

    public long SeatTypeId { get; set; }

    public int RowNumber { get; set; }

    public int SeatNumber { get; set; }

    public int? PosX { get; set; }

    public int? PosY { get; set; }

    public Hall Hall { get; set; } = null!;

    public SeatType SeatType { get; set; } = null!;
}
