using System.Linq.Expressions;

namespace CinemaWebsite.DAL.Abstractions;

public interface IBaseRepository<TEntity>
    where TEntity : class
{
    Task<List<TEntity>> GetAllAsync(
        CancellationToken cancellationToken = default);

    Task<TEntity?> FirstOrDefaultAsync(
        Expression<Func<TEntity, bool>> predicate,
        CancellationToken cancellationToken = default);

    Task AddAsync(
        TEntity entity,
        CancellationToken cancellationToken = default);

    void Update(TEntity entity);

    void Delete(TEntity entity);

    Task<int> SaveChangesAsync(
        CancellationToken cancellationToken = default);
}
