
namespace CinemaWebsite.BLL.Features.Auth.DTOs;

public class AuthResponse
{
    public string AccessToken { get; set; } = null!;

    public DateTime ExpiresAt { get; set; }
}
