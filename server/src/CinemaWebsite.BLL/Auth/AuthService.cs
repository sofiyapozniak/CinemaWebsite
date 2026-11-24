using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using CinemaWebsite.BLL.Auth.DTOs;
using CinemaWebsite.DAL.Abstractions;
using CinemaWebsite.Data.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;

namespace CinemaWebsite.BLL.Auth;

public class AuthService : IAuthService
{
    private readonly IBaseRepository<User> _userRepository;
    private readonly IBaseRepository<Role> _roleRepository;
    private readonly PasswordHasher<User> _passwordHasher;
    private readonly JwtOptions _jwtOptions;

    public AuthService(
        IBaseRepository<User> userRepository,
        IBaseRepository<Role> roleRepository,
        JwtOptions jwtOptions)
    {
        _userRepository = userRepository;
        _roleRepository = roleRepository;
        _jwtOptions = jwtOptions;
        _passwordHasher = new PasswordHasher<User>();
    }

    public async Task<AuthResponse> RegisterAsync(
        RegisterRequest request,
        CancellationToken cancellationToken = default)
    {
        var email = request.Email.Trim().ToLowerInvariant();

        var existingUser = await _userRepository.FirstOrDefaultAsync(
            user => user.Email == email,
            cancellationToken);

        if (existingUser is not null)
        {
            throw new InvalidOperationException(
                "Пользователь с таким email уже зарегистрирован.");
        }

        var userRole = await _roleRepository.FirstOrDefaultAsync(
            role => role.Name == "user",
            cancellationToken);

        if (userRole is null)
        {
            throw new InvalidOperationException(
                "Роль user не найдена в базе данных.");
        }

        var user = new User
        {
            RoleId = userRole.Id,
            Role = userRole,
            FirstName = request.FirstName.Trim(),
            LastName = request.LastName.Trim(),
            Email = email,
            Phone = request.Phone?.Trim(),
            Balance = 0,
            CreatedAt = DateTime.SpecifyKind(
            DateTime.UtcNow,
            DateTimeKind.Unspecified)
        };

        user.PasswordHash = _passwordHasher.HashPassword(
            user,
            request.Password);

        await _userRepository.AddAsync(user, cancellationToken);
        await _userRepository.SaveChangesAsync(cancellationToken);

        return CreateAuthResponse(user, userRole.Name);
    }

    public async Task<AuthResponse> LoginAsync(
        LoginRequest request,
        CancellationToken cancellationToken = default)
    {
        var email = request.Email.Trim().ToLowerInvariant();

        var user = await _userRepository.FirstOrDefaultAsync(
            user => user.Email == email,
            cancellationToken);

        if (user is null)
        {
            throw new InvalidOperationException(
                "Неверный email или пароль.");
        }

        var passwordResult = _passwordHasher.VerifyHashedPassword(
            user,
            user.PasswordHash,
            request.Password);

        if (passwordResult == PasswordVerificationResult.Failed)
        {
            throw new InvalidOperationException(
                "Неверный email или пароль.");
        }

        var role = await _roleRepository.FirstOrDefaultAsync(
            role => role.Id == user.RoleId,
            cancellationToken);

        if (role is null)
        {
            throw new InvalidOperationException(
                "Роль пользователя не найдена.");
        }

        return CreateAuthResponse(user, role.Name);
    }

    private AuthResponse CreateAuthResponse(User user, string roleName)
    {
        if (string.IsNullOrWhiteSpace(_jwtOptions.Secret))
        {
            throw new InvalidOperationException(
                "JWT Secret не настроен.");
        }

        var keyBytes = Encoding.UTF8.GetBytes(_jwtOptions.Secret);

        if (keyBytes.Length < 32)
        {
            throw new InvalidOperationException(
                "JWT Secret должен содержать не менее 32 байт.");
        }

        var expiresAt = DateTime.UtcNow.AddMinutes(
            _jwtOptions.ExpirationMinutes);

        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim(ClaimTypes.Role, roleName)
        };

        var signingKey = new SymmetricSecurityKey(keyBytes);

        var credentials = new SigningCredentials(
            signingKey,
            SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: _jwtOptions.Issuer,
            audience: _jwtOptions.Audience,
            claims: claims,
            expires: expiresAt,
            signingCredentials: credentials);

        var tokenString = new JwtSecurityTokenHandler()
            .WriteToken(token);

        return new AuthResponse
        {
            AccessToken = tokenString,
            ExpiresAt = expiresAt,
            UserId = user.Id,
            FirstName = user.FirstName,
            LastName = user.LastName,
            Email = user.Email,
            Role = roleName
        };
    }
}