
using CinemaWebsite.BLL.Features.Auth;
using CinemaWebsite.BLL.Features.Auth.DTOs;
using CinemaWebsite.DAL.Abstractions;
using CinemaWebsite.Data.Entities;
using Microsoft.AspNetCore.Identity;
using System.Linq.Expressions;

namespace CinemaWebsite.Tests.Auth;

public class AuthServiceTests
{
    [Fact]
    public async Task RegisterAsync_ShouldCreateUserAndReturnToken()
    {
        // Arrange
        var userRepository = new FakeBaseRepository<User>();

        var roleRepository = new FakeBaseRepository<Role>(
            new Role
            {
                Id = 1,
                Name = "user"
            });

        var service = new AuthService(
            userRepository,
            roleRepository,
            CreateJwtOptions());

        var request = new RegisterRequest
        {
            FirstName = "  Sofia  ",
            LastName = "  Pozniak  ",
            Email = "  TEST@example.com  ",
            Phone = "+375291234567",
            Password = "Password123!"
        };

        // Act
        var response = await service.RegisterAsync(request);

        // Assert
        var user = Assert.Single(userRepository.Items);

        Assert.Equal("Sofia", user.FirstName);
        Assert.Equal("Pozniak", user.LastName);
        Assert.Equal("test@example.com", user.Email);
        Assert.Equal("+375291234567", user.Phone);
        Assert.Equal(1, user.RoleId);

        Assert.NotEmpty(response.AccessToken);
        Assert.True(response.ExpiresAt > DateTime.UtcNow);
    }

    [Fact]
    public async Task LoginAsync_ShouldReturnTokenForCorrectCredentials()
    {
        // Arrange
        var user = new User
        {
            Id = 1,
            RoleId = 1,
            FirstName = "Sofia",
            LastName = "Pozniak",
            Email = "test@example.com",
            Balance = 0
        };

        var passwordHasher = new PasswordHasher<User>();

        user.PasswordHash = passwordHasher.HashPassword(
            user,
            "Password123!");

        var userRepository = new FakeBaseRepository<User>(user);

        var roleRepository = new FakeBaseRepository<Role>(
            new Role
            {
                Id = 1,
                Name = "user"
            });

        var service = new AuthService(
            userRepository,
            roleRepository,
            CreateJwtOptions());

        var request = new LoginRequest
        {
            Email = "TEST@example.com",
            Password = "Password123!"
        };

        // Act
        var response = await service.LoginAsync(request);

        // Assert
        Assert.NotEmpty(response.AccessToken);
        Assert.True(response.ExpiresAt > DateTime.UtcNow);
    }

    [Fact]
    public async Task LoginAsync_ShouldThrowExceptionForWrongPassword()
    {
        // Arrange
        var user = new User
        {
            Id = 1,
            RoleId = 1,
            FirstName = "Sofia",
            LastName = "Pozniak",
            Email = "test@example.com"
        };

        var passwordHasher = new PasswordHasher<User>();

        user.PasswordHash = passwordHasher.HashPassword(
            user,
            "CorrectPassword123!");

        var userRepository = new FakeBaseRepository<User>(user);
        var roleRepository = new FakeBaseRepository<Role>();

        var service = new AuthService(
            userRepository,
            roleRepository,
            CreateJwtOptions());

        var request = new LoginRequest
        {
            Email = "test@example.com",
            Password = "WrongPassword123!"
        };

        // Act & Assert
        await Assert.ThrowsAsync<InvalidOperationException>(
            () => service.LoginAsync(request));
    }

    private static JwtOptions CreateJwtOptions()
    {
        return new JwtOptions
        {
            Issuer = "CinemaWebsite",
            Audience = "CinemaWebsite.Client",
            Secret = "This-is-a-test-secret-key-at-least-32-characters!",
            ExpirationMinutes = 1440
        };
    }

    private sealed class FakeBaseRepository<TEntity> : IBaseRepository<TEntity>
        where TEntity : class
    {
        public List<TEntity> Items { get; } = [];

        public FakeBaseRepository(params TEntity[] entities)
        {
            Items.AddRange(entities);
        }

        public Task<List<TEntity>> GetAllAsync(
            CancellationToken cancellationToken = default)
        {
            return Task.FromResult(Items);
        }

        public Task<TEntity?> FirstOrDefaultAsync(
            Expression<Func<TEntity, bool>> predicate,
            CancellationToken cancellationToken = default)
        {
            var compiledPredicate = predicate.Compile();

            return Task.FromResult(
                Items.FirstOrDefault(compiledPredicate));
        }

        public Task AddAsync(
            TEntity entity,
            CancellationToken cancellationToken = default)
        {
            Items.Add(entity);

            return Task.CompletedTask;
        }

        public void Update(TEntity entity)
        {
        }

        public void Delete(TEntity entity)
        {
            Items.Remove(entity);
        }

        public Task<int> SaveChangesAsync(
            CancellationToken cancellationToken = default)
        {
            return Task.FromResult(1);
        }
    }
}
