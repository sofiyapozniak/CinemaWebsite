namespace CinemaWebsite.Data.Entities;

public class Hall
{
    public long Id { get; set; }

    public long CinemaId { get; set; }

    public string Name { get; set; } = null!;

    public Cinema Cinema { get; set; } = null!;
}
