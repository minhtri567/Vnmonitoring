using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Application.Abstractions.Repositories;

public interface IUserRepository
{
    Task<SysMember?> GetByUsernameAsync(string username, CancellationToken cancellationToken = default);
    Task<IReadOnlyCollection<long?>> GetRoleIdsByMemberAsync(Guid memberId, CancellationToken cancellationToken = default);
    Task<IReadOnlyCollection<long?>> GetRoleIdsByOrganizationAsync(int organizationId, CancellationToken cancellationToken = default);
    Task<IReadOnlyCollection<string?>> GetRoleCodesAsync(IEnumerable<long?> roleIds, CancellationToken cancellationToken = default);
    Task UpdateAsync(SysMember user, CancellationToken cancellationToken = default);
    Task SaveChangesAsync(CancellationToken cancellationToken = default);
}
