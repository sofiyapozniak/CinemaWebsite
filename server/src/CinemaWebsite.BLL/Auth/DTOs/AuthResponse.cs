
namespace CinemaWebsite.BLL.Auth.DTOs;

public class AuthResponse
{
    public string AccessToken { get; set; } = null!;

    public DateTime ExpiresAt { get; set; }

    public long UserId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Role { get; set; } = null!;
}
