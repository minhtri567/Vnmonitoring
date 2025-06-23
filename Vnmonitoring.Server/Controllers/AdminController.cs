using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Vnmonitoring.Server.Models;
using Vnmonitoring.Server.DTOs;
using DocumentFormat.OpenXml.Office2010.Excel;

namespace Vnmonitoring.Server.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class AdminController : Controller
    {
        private readonly WeatherDataContext _context;
        private readonly ReportQueue _reportQueue;
        public AdminController( WeatherDataContext context , ReportQueue reportQueue)
        {
            _context = context;
            _reportQueue = reportQueue;
        }
        
        [HttpGet("menu")]
        public IActionResult GetMenu()
        {
            var query = from a in _context.SysDanhmucs
                        join b in _context.SysDanhmucPhanloais
                            on a.DmLdmId equals b.LdmId
                        join c in _context.SysFunctions
                            on a.Functionid equals c.FnId into gj
                        from c in gj.DefaultIfEmpty() 
                        where b.LdmMa == "PHAN_MEM_QUAN_TRAC_MUA"
                        select new
                        {
                            a.DmId,
                            a.DmTen,
                            a.DmMa,
                            a.DmPid,
                            a.DmStt,
                            a.DmMota,
                            FnUrl = c != null ? c.FnUrl : null,
                            a.DmIconUrl
                        };


            return Ok(query.ToList());
        }

        [HttpGet("allphanloai")]
        public async Task<IActionResult> GetAllPhanloai()
        {
            var list = await _context.SysDanhmucPhanloais.ToListAsync();
            return Ok(list);
        }

        // POST: api/Admin/addphanloai
        [HttpPost("addphanloai")]
        public async Task<IActionResult> AddPhanloai([FromBody] SysDanhmucPhanloai model)
        {
            _context.SysDanhmucPhanloais.Add(model);
            await _context.SaveChangesAsync();
            return Ok(model);
        }

        // PUT: api/Admin/updatephanloai/{id}
        [HttpPut("updatephanloai/{id}")]
        public async Task<IActionResult> UpdatePhanloai(int id, [FromBody] SysDanhmucPhanloai model)
        {
            var existing = await _context.SysDanhmucPhanloais.FindAsync(id);
            if (existing == null) return NotFound();

            existing.LdmTen = model.LdmTen;
            existing.LdmMa = model.LdmMa;
            existing.LdmMota = model.LdmMota;
            existing.LdmPid = model.LdmPid;
            existing.LdmStt = model.LdmStt;
            existing.LdmUrl = model.LdmUrl;

            await _context.SaveChangesAsync();
            return Ok(existing);
        }

        // DELETE: api/Admin/deletephanloai/{id}
        [HttpDelete("deletephanloai/{id}")]
        public async Task<IActionResult> DeletePhanloai(int id)
        {
            var model = await _context.SysDanhmucPhanloais.FindAsync(id);
            if (model == null) return NotFound();

            _context.SysDanhmucPhanloais.Remove(model);
            await _context.SaveChangesAsync();
            return Ok();
        }

        [HttpGet("chucnang")]
        public IActionResult Getchucnang()
        {
            var query = _context.SysFunctions.Where(f => f.FnActive == true).Select(f => new {f.FnMa , f.FnUrl}).ToList();
            if (!query.Any())
            {
                return NotFound(new { message = "Không có chức năng nào." });
            }
            return Ok(query.ToList());
        }
        [HttpGet("allchucnang")]
        public IActionResult Getallchucnang()
        {
            var query = _context.SysFunctions.ToList();
            if (!query.Any())
            {
                return NotFound(new { message = "Không có chức năng nào." });
            }
            return Ok(query.ToList());
        }

        [HttpPost("addchucnang")]
        public async Task<IActionResult> AddChucNang([FromBody] SysFunction model)
        {
            if (string.IsNullOrWhiteSpace(model.FnTen))
                return BadRequest("Tên chức năng không được để trống.");
            var newdata = new SysFunction();
            newdata.FnTen = model.FnTen;
            newdata.FnMa = model.FnMa;
            newdata.FnUrl = model.FnUrl;
            newdata.FnNgaycapnhat = DateTime.Now;
            newdata.FnNgaytao = model.FnNgaytao;
            newdata.FnActive = model.FnActive;
            var username = User?.Identity?.Name ?? "unknown";
            newdata.FnNguoitao = username;
            newdata.FnMota = model.FnMota;

            _context.SysFunctions.Add(newdata);
            await _context.SaveChangesAsync();
            return Ok(model);
        }

        [HttpPut("updatechucnang/{id}")]
        public async Task<IActionResult> UpdateChucNang(int id, [FromBody] SysFunction updated)
        {
            var existing = await _context.SysFunctions.FindAsync(id);
            if (existing == null)
                return NotFound();

            existing.FnTen = updated.FnTen;
            existing.FnMa = updated.FnMa;
            existing.FnUrl = updated.FnUrl;
            existing.FnNgaycapnhat = DateTime.Now;
            existing.FnActive = updated.FnActive;
            var username = User?.Identity?.Name ?? "unknown";
            existing.FnNguoitao = username;
            existing.FnMota = updated.FnMota;

            await _context.SaveChangesAsync();
            return Ok(existing);
        }

        [HttpDelete("deletechucnang/{id}")]
        public async Task<IActionResult> DeleteChucNang(int id)
        {
            var func = await _context.SysFunctions.FindAsync(id);
            if (func == null)
                return NotFound();

            _context.SysFunctions.Remove(func);
            await _context.SaveChangesAsync();
            return Ok(new { message = "Đã xóa thành công." });
        }

        [HttpGet("alldanhmuc")]
        public async Task<ActionResult<IEnumerable<SysDanhmuc>>> GetAll()
        {
            return await _context.SysDanhmucs.ToListAsync();
        }

        // POST: api/admin/adddanhmuc
        [HttpPost("adddanhmuc")]
        public async Task<ActionResult<SysDanhmuc>> Create(SysDanhmuc model)
        {
            _context.SysDanhmucs.Add(model);
            await _context.SaveChangesAsync();
            return Ok(model);
        }

        // PUT: api/admin/updatedanhmuc/{id}
        [HttpPut("updatedanhmuc/{id}")]
        public async Task<IActionResult> Update(int id, SysDanhmuc model)
        {
            if (id != model.DmId)
                return BadRequest("ID không khớp");

            var entity = await _context.SysDanhmucs.FindAsync(id);
            if (entity == null)
                return NotFound();

            entity.DmTen = model.DmTen;
            entity.DmMa = model.DmMa;
            entity.DmPid = model.DmPid;
            entity.DmStt = model.DmStt;
            entity.DmMota = model.DmMota;
            entity.DmLdmId = model.DmLdmId;
            entity.DmIconUrl = model.DmIconUrl;
            entity.Functionid = model.Functionid;

            await _context.SaveChangesAsync();
            return Ok(entity);
        }

        // DELETE: api/admin/deletedanhmuc/{id}
        [HttpDelete("deletedanhmuc/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var entity = await _context.SysDanhmucs.FindAsync(id);
            if (entity == null)
                return NotFound();

            _context.SysDanhmucs.Remove(entity);
            await _context.SaveChangesAsync();
            return Ok(new { message = "Xóa thành công" });
        }

        [HttpGet("all-apikeys")]
        public async Task<IActionResult> GetAllApikeys()
        {
            var apikeys = await _context.MapboxApikeys.ToListAsync();
            return Ok(apikeys);
        }

        [HttpPost("add-apikey")]
        public async Task<IActionResult> AddApikey([FromBody] MapboxApikey apikey)
        {
            apikey.CreatedAt = DateTime.Now;
            _context.MapboxApikeys.Add(apikey);
            await _context.SaveChangesAsync();
            return Ok(apikey);
        }

        [HttpPut("update-apikey/{id}")]
        public async Task<IActionResult> UpdateApikey(int id, [FromBody] MapboxApikey apikey)
        {
            var existing = await _context.MapboxApikeys.FindAsync(id);
            if (existing == null) return NotFound();

            existing.KeyValue = apikey.KeyValue;
            existing.Description = apikey.Description;
            existing.Active = apikey.Active;
            await _context.SaveChangesAsync();
            return Ok(existing);
        }

        [HttpDelete("delete-apikey/{id}")]
        public async Task<IActionResult> DeleteApikey(int id)
        {
            var apikey = await _context.MapboxApikeys.FindAsync(id);
            if (apikey == null) return NotFound();

            _context.MapboxApikeys.Remove(apikey);
            await _context.SaveChangesAsync();
            return Ok();
        }
        // ======== MAP SOURCE CRUD ========
        [HttpGet("all-mapsource")]
        public async Task<IActionResult> GetAllMapSource()
        {
            var Sources = await _context.MapSources
            .Select(m => new {
                m.Id,
                m.Name,
                m.Description,
                m.Bounds,
                m.Scheme,
                m.Active,
                m.SourceType,
                m.SourceUrl,
                m.ApikeyId
            })
        .ToListAsync();

            return Ok(Sources);
        }
        [HttpPost("add-mapsource")]
        public async Task<IActionResult> AddMapSource([FromBody] MapSource source)
        {
            _context.MapSources.Add(source);
            await _context.SaveChangesAsync();
            return Ok(source);
        }

        [HttpPut("update-mapsource/{id}")]
        public async Task<IActionResult> UpdateMapSource(int id, [FromBody] MapSource layer)
        {
            var existing = await _context.MapSources.FindAsync(id);
            if (existing == null) return NotFound();

            existing.Name = layer.Name;
            existing.Description = layer.Description;
            existing.SourceUrl = layer.SourceUrl;
            existing.Bounds = layer.Bounds;
            existing.Scheme = layer.Scheme;
            existing.Active = layer.Active;
            existing.ApikeyId = layer.ApikeyId;
            existing.SourceType = layer.SourceType;

            await _context.SaveChangesAsync();
            return Ok(existing);
        }

        [HttpDelete("delete-mapsource/{id}")]
        public async Task<IActionResult> DeleteMapSource(int id)
        {
            var source = await _context.MapSources.FindAsync(id);
            if (source == null) return NotFound();

            _context.MapSources.Remove(source);
            await _context.SaveChangesAsync();
            return Ok();
        }
        // ======== MAP LAYER CRUD ========

        [HttpGet("all-maplayers")]
        public async Task<IActionResult> GetAllMapLayers()
        {
            var flatList = await _context.MapLayers
            .Select(m => new LayerNode
            {
                key = m.Id,
                label = m.Name,
                Description = m.Description,
                LayerType = m.LayerType,
                SourceLayer = m.SourceLayer,
                Layout = m.Layout,
                Filter = m.Filter,
                Paint = m.Paint,
                MinZoom= m.MinZoom,
                MaxZoom= m.MaxZoom,
                VisibleByDefault = m.VisibleByDefault,
                IsPublic = m.IsPublic,
                SourceId = m.SourceId,
                ParentId = m.ParentId,
                SortOrder = m.SortOrder,
                IsGroup = m.IsGroup
            })
            .ToListAsync();

            var lookup = flatList.ToLookup(x => x.ParentId);

            foreach (var node in flatList)
            {
                node.Children = lookup[node.key].OrderBy(c => c.SortOrder).ToList();
            }

            var tree = lookup[null].OrderBy(x => x.SortOrder).ToList();
            return Ok(tree);
        }

        [HttpPost("add-maplayer")]
        public async Task<IActionResult> AddMapLayer([FromBody] MapLayer layer)
        {
            _context.MapLayers.Add(layer);
            await _context.SaveChangesAsync();
            return Ok(layer);
        }

        [HttpPut("update-maplayer/{id}")]
        public async Task<IActionResult> UpdateMapLayer(int id, [FromBody] MapLayer layer)
        {
            var existing = await _context.MapLayers.FindAsync(id);
            if (existing == null) return NotFound();

            existing.Name = layer.Name;
            existing.Description = layer.Description;
            existing.SourceLayer = layer.SourceLayer;
            existing.Filter = layer.Filter;
            existing.Layout = layer.Layout;
            existing.Paint = layer.Paint;
            existing.MinZoom = layer.MinZoom;
            existing.MaxZoom = layer.MaxZoom;
            existing.LayerType = layer.LayerType;
            existing.VisibleByDefault = layer.VisibleByDefault;
            existing.SourceId = layer.SourceId;
            existing.IsPublic = layer.IsPublic;
            existing.SortOrder = layer.SortOrder;
            existing.ParentId = layer.ParentId;
            existing.IsGroup = layer.IsGroup;

            await _context.SaveChangesAsync();
            return Ok(existing);
        }

        [HttpDelete("delete-maplayer/{id}")]
        public async Task<IActionResult> DeleteMapLayer(int id)
        {
            var layer = await _context.MapLayers.FindAsync(id);
            if (layer == null) return NotFound();

            _context.MapLayers.Remove(layer);
            await _context.SaveChangesAsync();
            return Ok();
        }

        [HttpPost("add-report")]
        public async Task<IActionResult> Addreport([FromBody] CreateWeatherReportDto dto)
        {
            dto.request_time = DateTime.SpecifyKind(dto.request_time, DateTimeKind.Unspecified);
            dto.ngaybatdau = DateTime.SpecifyKind(dto.ngaybatdau, DateTimeKind.Unspecified);
            dto.ngayketthuc = DateTime.SpecifyKind(dto.ngayketthuc, DateTimeKind.Unspecified);
            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                var report = new WeatherStationsReport
                {
                    RpType = dto.rp_type,
                    NameFile = dto.name_file,
                    RequestTime = dto.request_time,
                    Ngaybatdau = dto.ngaybatdau,
                    Ngayketthuc = dto.ngayketthuc,
                    Tansuat = dto.tansuat,
                    Email = dto.email,
                    Trangthai = dto.trangthai,
                    CreatedBy = dto.created_by,
                    IsPublic = dto.is_public
                };

                _context.WeatherStationsReports.Add(report);
                await _context.SaveChangesAsync();
                foreach (var station in dto.stations)
                {
                    _context.WeatherStationsReportLists.Add(new WeatherStationsReportList
                    {
                        WeatherStationsReportId = report.Id,
                        ProvineId = station.provine_id,
                        StationId = station.station_id
                    });
                }

                await _context.SaveChangesAsync();

                await _reportQueue.EnqueueAsync(report);
                await transaction.CommitAsync();

                return Ok(new { success = true });
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return BadRequest(new { error = ex.Message });
            }
        }
        [HttpGet("all-user")]
        public async Task<ActionResult<IEnumerable<SysMember>>> GetSysMembers()
        {
            var data =  await _context.SysMembers
                .Select(s => new
                {
                    s.MemId,
                    s.MemUsername,
                    s.MemHoten,
                    memCqId = s.MemCq == null ? null : new
                    {
                        s.MemCq.CqId,
                        s.MemCq.CqTen,
                    },
                    s.MemEmail,
                    roleIds = s.SysRoleMembers.Select(rm => new { rm.RoleId , rm.Role.RoleStt , rm.Role.RoleTen } ).ToList(),
                    MemUpdateAt = s.MemUpdateAt.Value.ToString("HH:mm:ss dd/MM/yyy"),
                    MemCreateAt = s.MemCreateAt.Value.ToString("HH:mm:ss dd/MM/yyy"),
                    MemLastloginAt = s.MemLastloginAt.Value.ToString("HH:mm:ss dd/MM/yyy"),
                    MemDeleteAt = s.MemDeleteAt.Value.ToString("HH:mm:ss dd/MM/yyy"),
                    MemDeleteBy = s.MemDeleteBy,
                    MemUpdateBy = s.MemUpdateBy,
                    s.MemActive
                })
                .ToListAsync();
            return Ok(data);
        }

        // POST: api/SysMember
        [HttpPost("create-user")]
        public async Task<ActionResult<SysMember>> CreateSysMember(SysMember member)
        {
            if (_context.SysMembers.Any(u => u.MemUsername == member.MemUsername))
            {
                return BadRequest(new { message = "Tên đăng nhập đã tồn tại cho người dùng khác." });
            }
            member.MemId = Guid.NewGuid();

            if (!string.IsNullOrWhiteSpace(member.MemPassword))
            {
                var hasher = new PasswordHasher<SysMember>();
                member.MemPassword = hasher.HashPassword(member, member.MemPassword);
            }
            member.MemCreateAt = DateTime.Now;
            member.MemUpdateAt = DateTime.Now;
            member.MemDeleteAt = null;

            _context.SysMembers.Add(member);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // PUT: api/SysMember/{id}
        [HttpPut("update-user/{id}")]
        public async Task<IActionResult> UpdateSysMember(Guid id, SysMember member)
        {
            if (id != member.MemId)
            {
                return BadRequest();
            }
            if (_context.SysMembers.Any(u => u.MemUsername == member.MemUsername && u.MemId != id))
            {
                return BadRequest(new { message = "Tên đăng nhập đã tồn tại cho người dùng khác." });
            }
            // Lấy bản ghi cũ
            var existingMember = await _context.SysMembers.FindAsync(id);
            if (existingMember == null)
                return NotFound();

            // Cập nhật các trường
            existingMember.MemUsername = member.MemUsername;
            existingMember.MemHoten = member.MemHoten;
            existingMember.MemEmail = member.MemEmail;
            existingMember.MemActive = member.MemActive;
            existingMember.MemCqId = member.MemCqId;
            existingMember.MemUpdateAt = DateTime.Now;
            existingMember.MemUpdateBy = User?.Identity?.Name ?? "unknown";
            if (member.MemActive == true)
            {
                existingMember.MemDeleteAt = null;
            }
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("delete-user/{id}")]
        public async Task<IActionResult> DeleteSysMember(Guid id)
        {
            var member = await _context.SysMembers.FindAsync(id);

            if (member == null)
            {
                return NotFound();
            }
            if (member.MemActive == false)
            {
                return BadRequest(new { message = "Người dùng này đã bị xóa trước đó." });
            }
            member.MemActive = false;
            member.MemDeleteAt = DateTime.Now;
            member.MemDeleteBy = User?.Identity?.Name ?? "unknown";
            _context.SysMembers.Update(member);

            await _context.SaveChangesAsync();

            return NoContent();
        }
        [HttpGet("shortallroles")]
        public async Task<ActionResult<IEnumerable<SysRole>>> GetshortAllRoles()
        {
            var data = await _context.SysRoles
                .Select(s => new
                {
                    s.RoleTen,
                    s.RoleId,
                    s.RoleStt,
                })
                .OrderBy(r => r.RoleStt)
                .ToListAsync();
            return Ok(data);
        }
        [HttpGet("allroles")]
        public async Task<ActionResult<IEnumerable<SysRole>>> GetAllRoles()
        {
            return await _context.SysRoles
                .OrderBy(r => r.RoleStt)
                .ToListAsync();
        }
        [HttpPost("addrole")]
        public async Task<ActionResult<SysRole>> AddRole(SysRole role)
        {
            _context.SysRoles.Add(role);
            await _context.SaveChangesAsync();
            return Ok(role);
        }
        [HttpPut("updaterole/{id}")]
        public async Task<IActionResult> UpdateRole(long id, SysRole role)
        {
            if (id != role.RoleId)
                return BadRequest();

            var existing = await _context.SysRoles.FindAsync(id);
            if (existing == null) return NotFound();

            existing.RoleTen = role.RoleTen;
            existing.RoleStt = role.RoleStt;
            existing.RoleMa = role.RoleMa;
            existing.RoleType = role.RoleType;
            existing.RoleNguoitao = role.RoleNguoitao;

            await _context.SaveChangesAsync();
            return NoContent();
        }
        [HttpDelete("deleterole/{id}")]
        public async Task<IActionResult> DeleteRole(long id)
        {
            var role = await _context.SysRoles.FindAsync(id);
            if (role == null) return NotFound();

            _context.SysRoles.Remove(role);
            await _context.SaveChangesAsync();
            return NoContent();
        }
        [HttpGet("shortallcoquan")]
        public async Task<ActionResult<IEnumerable<SysCoquan>>> GetshortAllCoquan()
        {
            var data = await _context.SysCoquans
                .Select(s => new
                {
                    s.CqId,
                    s.CqTen,
                    s.CqStt,
                })
                .OrderBy(r => r.CqStt)
                .ToListAsync();
            return Ok(data);
        }
        [HttpGet("allcoquan")]
        public async Task<ActionResult<IEnumerable<SysCoquan>>> GetAllCoquan()
        {
            return await _context.SysCoquans
                .OrderBy(r => r.CqStt)
                .ToListAsync();
        }

    }

}
