using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Vnmonitoring.Application.Features.Admin;
using Vnmonitoring.Server.DTOs;
using Vnmonitoring.Server.Models;

namespace Vnmonitoring.Server.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class AdminController : Controller
    {
        private readonly ISender _sender;

        public AdminController(ISender sender)
        {
            _sender = sender;
        }

        [HttpGet("menu")]
        public async Task<IActionResult> GetMenu(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetMenuQuery(), cancellationToken));

        [HttpGet("allphanloai")]
        public async Task<IActionResult> GetAllPhanloai(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllPhanloaiQuery(), cancellationToken));

        [HttpPost("addphanloai")]
        public async Task<IActionResult> AddPhanloai([FromBody] SysDanhmucPhanloai model, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddPhanloaiCommand(model), cancellationToken));

        [HttpPut("updatephanloai/{id}")]
        public async Task<IActionResult> UpdatePhanloai(int id, [FromBody] SysDanhmucPhanloai model, CancellationToken cancellationToken) => Ok(await _sender.Send(new UpdatePhanloaiCommand(id, model), cancellationToken));

        [HttpDelete("deletephanloai/{id}")]
        public async Task<IActionResult> DeletePhanloai(int id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeletePhanloaiCommand(id), cancellationToken);
            return Ok();
        }

        [HttpGet("chucnang")]
        public async Task<IActionResult> Getchucnang(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetChucNangQuery(), cancellationToken));

        [HttpGet("allchucnang")]
        public async Task<IActionResult> Getallchucnang(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllChucNangQuery(), cancellationToken));

        [HttpPost("addchucnang")]
        public async Task<IActionResult> AddChucNang([FromBody] SysFunction model, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddChucNangCommand(model), cancellationToken));

        [HttpPut("updatechucnang/{id}")]
        public async Task<IActionResult> UpdateChucNang(int id, [FromBody] SysFunction model, CancellationToken cancellationToken) => Ok(await _sender.Send(new UpdateChucNangCommand(id, model), cancellationToken));

        [HttpDelete("deletechucnang/{id}")]
        public async Task<IActionResult> DeleteChucNang(int id, CancellationToken cancellationToken) => Ok(await _sender.Send(new DeleteChucNangCommand(id), cancellationToken));

        [HttpGet("alldanhmuc")]
        public async Task<ActionResult<IEnumerable<SysDanhmuc>>> GetAll(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllDanhMucQuery(), cancellationToken));

        [HttpPost("adddanhmuc")]
        public async Task<ActionResult<SysDanhmuc>> Create([FromBody] SysDanhmuc model, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddDanhMucCommand(model), cancellationToken));

        [HttpPut("updatedanhmuc/{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] SysDanhmuc model, CancellationToken cancellationToken) => Ok(await _sender.Send(new UpdateDanhMucCommand(id, model), cancellationToken));

        [HttpDelete("deletedanhmuc/{id}")]
        public async Task<IActionResult> Delete(int id, CancellationToken cancellationToken) => Ok(await _sender.Send(new DeleteDanhMucCommand(id), cancellationToken));

        [HttpGet("all-apikeys")]
        public async Task<IActionResult> GetAllApikeys(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllApiKeysQuery(), cancellationToken));

        [HttpPost("add-apikey")]
        public async Task<IActionResult> AddApikey([FromBody] MapboxApikey apikey, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddApiKeyCommand(apikey), cancellationToken));

        [HttpPut("update-apikey/{id}")]
        public async Task<IActionResult> UpdateApikey(int id, [FromBody] MapboxApikey apikey, CancellationToken cancellationToken) => Ok(await _sender.Send(new UpdateApiKeyCommand(id, apikey), cancellationToken));

        [HttpDelete("delete-apikey/{id}")]
        public async Task<IActionResult> DeleteApikey(int id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeleteApiKeyCommand(id), cancellationToken);
            return Ok();
        }

        [HttpGet("all-mapsource")]
        public async Task<IActionResult> GetAllMapSource(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllMapSourcesQuery(), cancellationToken));

        [HttpPost("add-mapsource")]
        public async Task<IActionResult> AddMapSource([FromBody] MapSource source, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddMapSourceCommand(source), cancellationToken));

        [HttpPut("update-mapsource/{id}")]
        public async Task<IActionResult> UpdateMapSource(int id, [FromBody] MapSource source, CancellationToken cancellationToken) => Ok(await _sender.Send(new UpdateMapSourceCommand(id, source), cancellationToken));

        [HttpDelete("delete-mapsource/{id}")]
        public async Task<IActionResult> DeleteMapSource(int id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeleteMapSourceCommand(id), cancellationToken);
            return Ok();
        }

        [HttpGet("all-maplayers")]
        public async Task<IActionResult> GetAllMapLayers(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllMapLayersQuery(), cancellationToken));

        [HttpPost("add-maplayer")]
        public async Task<IActionResult> AddMapLayer([FromBody] MapLayer layer, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddMapLayerCommand(layer), cancellationToken));

        [HttpPut("update-maplayer/{id}")]
        public async Task<IActionResult> UpdateMapLayer(int id, [FromBody] MapLayer layer, CancellationToken cancellationToken) => Ok(await _sender.Send(new UpdateMapLayerCommand(id, layer), cancellationToken));

        [HttpDelete("delete-maplayer/{id}")]
        public async Task<IActionResult> DeleteMapLayer(int id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeleteMapLayerCommand(id), cancellationToken);
            return Ok();
        }

        [HttpPost("add-report")]
        public async Task<IActionResult> Addreport([FromBody] CreateWeatherReportDto dto, CancellationToken cancellationToken)
        {
            var result = await _sender.Send(new CreateWeatherReportCommand(
                dto.name_file,
                dto.request_time,
                dto.ngaybatdau,
                dto.ngayketthuc,
                dto.tansuat,
                dto.rp_type,
                dto.email,
                dto.trangthai,
                dto.cq_id,
                dto.created_by,
                dto.is_public,
                dto.stations.Select(s => new WeatherReportStationItem(s.provine_id, s.station_id)).ToArray()), cancellationToken);

            return Ok(result);
        }

        [HttpGet("all-user")]
        public async Task<ActionResult<IEnumerable<SysMember>>> GetSysMembers(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllUsersQuery(), cancellationToken));

        [HttpPost("create-user")]
        public async Task<ActionResult<SysMember>> CreateSysMember([FromBody] SysMember member, CancellationToken cancellationToken)
        {
            await _sender.Send(new CreateUserCommand(member), cancellationToken);
            return NoContent();
        }

        [HttpPut("update-user/{id}")]
        public async Task<IActionResult> UpdateSysMember(Guid id, [FromBody] SysMember member, CancellationToken cancellationToken)
        {
            await _sender.Send(new UpdateUserCommand(id, member), cancellationToken);
            return NoContent();
        }

        [HttpDelete("delete-user/{id}")]
        public async Task<IActionResult> DeleteSysMember(Guid id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeleteUserCommand(id), cancellationToken);
            return NoContent();
        }

        [HttpGet("shortallroles")]
        public async Task<ActionResult<IEnumerable<SysRole>>> GetshortAllRoles(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetShortAllRolesQuery(), cancellationToken));

        [HttpGet("allroles")]
        public async Task<ActionResult<IEnumerable<SysRole>>> GetAllRoles(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllRolesQuery(), cancellationToken));

        [HttpPost("addrole")]
        public async Task<ActionResult<SysRole>> AddRole([FromBody] SysRole role, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddRoleCommand(role), cancellationToken));

        [HttpPut("updaterole/{id}")]
        public async Task<IActionResult> UpdateRole(long id, [FromBody] SysRole role, CancellationToken cancellationToken)
        {
            await _sender.Send(new UpdateRoleCommand(id, role), cancellationToken);
            return NoContent();
        }

        [HttpDelete("deleterole/{id}")]
        public async Task<IActionResult> DeleteRole(long id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeleteRoleCommand(id), cancellationToken);
            return NoContent();
        }

        [HttpGet("shortallcoquan")]
        public async Task<ActionResult<IEnumerable<SysCoquan>>> GetshortAllCoquan(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetShortAllCoquanQuery(), cancellationToken));

        [HttpGet("allcoquan")]
        public async Task<ActionResult<IEnumerable<SysCoquan>>> GetAllCoquan(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllCoquanQuery(), cancellationToken));

        [HttpGet("shortallstation")]
        public async Task<ActionResult<IEnumerable<MonitoringStation>>> Getshortallstation(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetShortAllStationQuery(), cancellationToken));

        [HttpGet("allstations/search")]
        public async Task<ActionResult<object>> GetAllStations([FromQuery] int page = 1, [FromQuery] int pageSize = 10, CancellationToken cancellationToken = default)
            => Ok(await _sender.Send(new GetAllStationsQuery(page, pageSize), cancellationToken));

        [HttpGet("invalid-stations")]
        public async Task<IActionResult> GetInvalidStations([FromQuery] int page = 1, [FromQuery] int pageSize = 10, CancellationToken cancellationToken = default)
            => Ok(await _sender.Send(new GetInvalidStationsQuery(page, pageSize), cancellationToken));

        [HttpGet("GetStationsWithoutData")]
        public async Task<IActionResult> GetStationsWithoutData([FromQuery] string type = "RAIN", [FromQuery] DateTime? fromDate = null, [FromQuery] DateTime? toDate = null, [FromQuery] int page = 1, [FromQuery] int pageSize = 10, CancellationToken cancellationToken = default)
            => Ok(await _sender.Send(new GetStationsWithoutDataQuery(type, fromDate, toDate, page, pageSize), cancellationToken));

        [HttpPost("addstations")]
        public async Task<ActionResult<MonitoringStation>> AddStations([FromBody] MonitoringStation data, CancellationToken cancellationToken) => Ok(await _sender.Send(new AddStationCommand(data), cancellationToken));

        [HttpPut("updatestations/{id}")]
        public async Task<IActionResult> UpdateStations(Guid id, [FromBody] MonitoringStation data, CancellationToken cancellationToken)
        {
            await _sender.Send(new UpdateStationCommand(id, data), cancellationToken);
            return NoContent();
        }

        [HttpDelete("deletestations/{id}")]
        public async Task<IActionResult> Deletestations(Guid id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeleteStationCommand(id), cancellationToken);
            return NoContent();
        }

        [HttpGet("getmonitoringdata/search")]
        public async Task<ActionResult<object>> GetMonitoringData([FromQuery] int page = 1, [FromQuery] int pageSize = 10, [FromQuery] DateTime? fromDate = null, [FromQuery] DateTime? toDate = null, [FromQuery] string? type = null, [FromQuery] string? keyword = null, CancellationToken cancellationToken = default)
            => Ok(await _sender.Send(new GetMonitoringDataQuery(page, pageSize, fromDate, toDate, type, keyword), cancellationToken));

        [HttpGet("getmonitoringdata/{id}")]
        public async Task<ActionResult<MonitoringDatum>> getmonitoringdata(int id, CancellationToken cancellationToken) => Ok(await _sender.Send(new GetMonitoringDataByIdQuery(id), cancellationToken));

        [HttpPost("postmonitoringdata")]
        public async Task<ActionResult<MonitoringDatum>> postmonitoringdata([FromBody] MonitoringDatum input, CancellationToken cancellationToken)
        {
            var created = await _sender.Send(new AddMonitoringDataCommand(input), cancellationToken);
            return CreatedAtAction(nameof(getmonitoringdata), new { id = created.DataId }, created);
        }

        [HttpPut("putmonitoringdata/{id}")]
        public async Task<IActionResult> putmonitoringdata(int id, [FromBody] MonitoringDatum input, CancellationToken cancellationToken)
        {
            await _sender.Send(new UpdateMonitoringDataCommand(id, input), cancellationToken);
            return NoContent();
        }

        [HttpDelete("deletemonitoringdata/{id}")]
        public async Task<IActionResult> deletemonitoringdata(int id, CancellationToken cancellationToken)
        {
            await _sender.Send(new DeleteMonitoringDataCommand(id), cancellationToken);
            return NoContent();
        }

        [HttpGet("getalltypedata")]
        public async Task<ActionResult<IEnumerable<SysDanhmuc>>> Getalltypedata(CancellationToken cancellationToken) => Ok(await _sender.Send(new GetAllTypeDataQuery(), cancellationToken));
    }
}
