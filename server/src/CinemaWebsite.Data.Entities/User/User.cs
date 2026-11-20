namespace CinemaWebsite.Data.Entities;

public class User
{
    public long Id { get; set; }

    public long RoleId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Phone { get; set; }

    public string PasswordHash { get; set; } = null!;

    public decimal Balance { get; set; }

    public DateTime CreatedAt { get; set; }

    public Role Role { get; set; } = null!;
}
