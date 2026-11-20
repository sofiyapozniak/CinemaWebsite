namespace CinemaWebsite.Data.Entities;

public class Cinema
{
    public long Id { get; set; }

    public string Name { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public string? WorkingHours { get; set; }

    public ICollection<Hall> Halls { get; set; } = new List<Hall>();
}
