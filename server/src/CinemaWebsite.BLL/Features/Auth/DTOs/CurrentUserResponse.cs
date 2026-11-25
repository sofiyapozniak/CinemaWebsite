namespace CinemaWebsite.BLL.Features.Auth.DTOs;

public class CurrentUserResponse
{
    public long UserId { get; set; }

    public string Email { get; set; } = null!;

    public string Role { get; set; } = null!;
}