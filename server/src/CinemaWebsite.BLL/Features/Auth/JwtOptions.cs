namespace CinemaWebsite.BLL.Features.Auth;

public class JwtOptions
{
    public string Issuer { get; set; } = null!;

    public string Audience { get; set; } = null!;

    public string Secret { get; set; } = null!;

    public int ExpirationMinutes { get; set; } = 60;
}