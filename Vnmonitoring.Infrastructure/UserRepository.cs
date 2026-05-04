using Microsoft.EntityFrameworkCore;
using Vnmonitoring.Application.Abstractions.Repositories;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Infrastructure;

public sealed class UserRepository : IUserRepository
{
    private readonly WeatherDataContext _context;

    public UserRepository(WeatherDataContext context)
    {
        _context = context;
    }

    public async Task<SysMember?> GetByUsernameAsync(string username, CancellationToken cancellationToken = default)
    {
        return await _context.SysMembers
            .Include(member => member.MemCq)
            .FirstOrDefaultAsync(member => member.MemUsername == username, cancellationToken);
    }

    public async Task<IReadOnlyCollection<long?>> GetRoleIdsByMemberAsync(Guid memberId, CancellationToken cancellationToken = default)
    {
        return await _context.SysRoleMembers
            .Where(roleMember => roleMember.MemId == memberId)
            .Select(roleMember => roleMember.RoleId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyCollection<long?>> GetRoleIdsByOrganizationAsync(int organizationId, CancellationToken cancellationToken = default)
    {
        return await _context.SysRoleCoquans
            .Where(roleOrganization => roleOrganization.CqId == organizationId)
            .Select(roleOrganization => roleOrganization.RoleId)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyCollection<string?>> GetRoleCodesAsync(IEnumerable<long?> roleIds, CancellationToken cancellationToken = default)
    {
        var ids = roleIds.Where(roleId => roleId.HasValue).Select(roleId => roleId!.Value).Distinct().ToList();
        if (ids.Count == 0)
        {
            return Array.Empty<string?>();
        }

        return await _context.SysRoles
            .Where(role => ids.Contains(role.RoleId))
            .Select(role => role.RoleMa)
            .ToListAsync(cancellationToken);
    }

    public Task UpdateAsync(SysMember user, CancellationToken cancellationToken = default)
    {
        _context.SysMembers.Update(user);
        return Task.CompletedTask;
    }

    public Task SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return _context.SaveChangesAsync(cancellationToken);
    }
}
