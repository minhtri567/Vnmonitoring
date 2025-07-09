import React, { useEffect, useState, useRef } from "react";
import axios from '../axios/index';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { FloatLabel } from 'primereact/floatlabel';
import { Calendar } from 'primereact/calendar';
import {
    Button
} from "primereact/button";
import { Dropdown } from 'primereact/dropdown';
import { Dialog } from "primereact/dialog";
import { InputText } from "primereact/inputtext";
import { Toast } from "primereact/toast";

const AdminStationPage = () => {

    const now = new Date();
    const [stations, setStations] = useState([]);
    const [selectedStation, setSelectedStation] = useState(null);
    const [stationDialog, setStationDialog] = useState(false);
    const [deleteDialog, setDeleteDialog] = useState(false);
    const [station, setStation] = useState({});
    const [fromTime, setFromTime] = useState(null);
    const [toTime, setToTime] = useState(null);
    const [totalRecords, setTotalRecords] = useState(0);
    const [loading, setLoading] = useState(false);
    const [page, setPage] = useState(0);
    const [rows, setRows] = useState(10);
    const [filterType, setFilterType] = useState("all");
    const toast = useRef(null);
    const dt = useRef(null);
    const Optimes = [
        { name: 'Ngày hôm nay', code: '1' },
        { name: 'Tháng này', code: '2' },
        { name: 'Khoảng thời gian', code: '3' }
    ];

    const [selectedOptimes, setSelectedOptimes] = useState(Optimes[0]);
    const filterOptions = [
        { label: "Tất cả", value: "all" },
        { label: "Sai toạ độ hoặc thiếu xã", value: "invalid" },
        { label: "Không có dữ liệu mưa", value: "nodata" }
    ];
    const emptyStation = {
        stationId: "",
        stationName: "",
        lat: null,
        lon: null,
        luuvuc: "",
        description: "",
    };
    useEffect(() => {
        loadData(0, rows);
    }, [filterType]);

    const loadData = async (pageIndex = 0, pageSize = 10) => {
        setLoading(true);
        let url = "";
        let params = {
            page: pageIndex + 1,
            pageSize: pageSize,
            fromDate: fromTime?.toLocaleString("en-US"),
            toDate: toTime?.toLocaleString("en-US"),
        };

        if (filterType === "all") {
            url = "/api/admin/allstations/search";
        } else if (filterType === "invalid") {
            url = "/api/admin/invalid-stations";
        } else if (filterType === "nodata") {
            url = "/api/admin/GetStationsWithoutData";
        }

        try {
            const res = await axios.get(url, { params });
            setStations(res.data.data);
            setTotalRecords(res.data.total);
        } catch (err) {
            toast.current.show({
                severity: "error",
                summary: "Lỗi",
                detail: "Không thể tải dữ liệu"
            });
        }

        setLoading(false);
    };
    useEffect(() => {
        let from = null;
        let to = new Date();
        const now = new Date();

        if (selectedOptimes?.code === '1') {
            from = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0, 0);
            to = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours(), 0, 0);
        } else if (selectedOptimes?.code === '2') {
            from = new Date(now.getFullYear(), now.getMonth(), 1, 0, 0, 0);
            to = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours(), 0, 0);
        } else if (selectedOptimes?.code === '3') {
            from = new Date(fromTime);
            to = new Date(toTime);
        }
        if (from?.getTime() !== fromTime?.getTime()) {
            setFromTime(from);
        }
        if (to?.getTime() !== toTime?.getTime()) {
            setToTime(to);
        }
    }, [selectedOptimes]);
    const onPageChange = (e) => {
        setPage(e.page);
        setRows(e.rows);
        loadData(e.page, e.rows);
    };

    const onFilterChange = (e) => {
        setFilterType(e.value);
        setPage(0);
    };

    const openNew = () => {
        setStation(emptyStation);
        setStationDialog(true);
    };

    const hideDialog = () => {
        setStationDialog(false);
    };

    const hideDeleteDialog = () => {
        setDeleteDialog(false);
    };

    const saveStation = async () => {
        if (station.key) {
            // Update
            await axios.put(`/api/admin/updatestations/${station.key}`, station);
            toast.current.show({ severity: "success", summary: "Updated", detail: "Station updated" });
        } else {
            // Create
            await axios.post(`/api/admin/addstations`, station);
            toast.current.show({ severity: "success", summary: "Created", detail: "Station created" });
        }
        setStationDialog(false);
    };

    const editStation = (rowData) => {
        setStation({ ...rowData });
        setStationDialog(true);
    };

    const confirmDeleteStation = (rowData) => {
        setStation(rowData);
        setDeleteDialog(true);
    };

    const deleteStation = async () => {
        await axios.delete(`/api/admin/deletestations/${station.key}`);
        setDeleteDialog(false);
        toast.current.show({ severity: "success", summary: "Deleted", detail: "Station deleted" });
    };

    const onInputChange = (e, name) => {
        const val = (e.target && e.target.value) || "";
        setStation({ ...station, [name]: val });
    };

    const leftToolbar = () => (
        <div className="admin-table-toolbar">
            <div className="admin-table-toolbar-nag gap-2">
                <FloatLabel>
                <Dropdown
                    value={filterType}
                    options={filterOptions}
                    onChange={onFilterChange}
                    placeholder="Chọn bộ lọc"
                    className="mr-2 w-16rem"
                    inputId="dd-filter"
                />
                    <label htmlFor="dd-filter">Lọc theo</label>
                </FloatLabel>
                {filterType === 'nodata' && ( 
                    <FloatLabel>
                        <Dropdown inputId="dd-Optimes" value={selectedOptimes} onChange={(e) => setSelectedOptimes(e.value)} options={Optimes} optionLabel="name" />
                        <label htmlFor="dd-Optimes">Chọn thời gian</label>
                    </FloatLabel>
                )}

                {selectedOptimes?.code === '3' && (
                    <div className="d-flex gap-2">
                        <FloatLabel>
                            <Calendar value={fromTime} showTime dateFormat="dd/mm/yy" onChange={(e) => setFromTime(e.value)} placeholder="Từ ngày" maxDate={now} />
                            <label htmlFor="st_date">Thời gian bắt đầu</label>
                        </FloatLabel>
                        <FloatLabel>
                            <Calendar value={toTime} showTime dateFormat="dd/mm/yy" onChange={(e) => setToTime(e.value)} placeholder="Đến ngày" maxDate={now} />
                            <label htmlFor="et_date">Thời gian kết thúc</label>
                        </FloatLabel>
                    </div>
                )}
                <span className="ms-3">{totalRecords} trạm</span>
            </div>
            <div className="admin-table-toolbar-btn">
                <Button label="New Station" icon="pi pi-plus" className="p-button-success" onClick={openNew} />
            </div>

        </div>
    );

    return (
        <div className="p-4">
            <Toast ref={toast} />
            <div className="card">
                <DataTable
                    ref={dt}
                    value={stations}
                    paginator
                    first={page * rows}
                    rows={rows}
                    selectionMode="single"
                    header={leftToolbar}
                    selection={selectedStation}
                    totalRecords={totalRecords}
                    onSelectionChange={(e) => setSelectedStation(e.value)}
                    dataKey="stationId"
                    lazy
                    loading={loading}
                    onPage={onPageChange}
                    responsiveLayout="scroll"
                >
                    <Column field="stationId" header="Station ID" sortable />
                    <Column field="stationName" header="Tên trạm" />
                    <Column field="lat" header="Lat" />
                    <Column field="lon" header="Lon" />
                    <Column field="ten_xa" header="Xã" />
                    <Column field="ten_tinh" header="Tỉnh" />
                    <Column field="description" header="Mô tả" />
                    <Column
                        header="Actions"
                        body={(rowData) => (
                            <>
                                <Button icon="pi pi-pencil" className="p-button-rounded p-button-warning me-2" onClick={() => editStation(rowData)} />
                                <Button icon="pi pi-trash" className="p-button-rounded p-button-danger" onClick={() => confirmDeleteStation(rowData)} />
                            </>
                        )}
                    />
                </DataTable>
            </div>

            <Dialog visible={stationDialog} style={{ width: "450px" }} header="Station Details" modal className="p-fluid" onHide={hideDialog}>
                <div className="field">
                    <label htmlFor="stationId">Station ID</label>
                    <InputText id="stationId" value={station.stationId} onChange={(e) => onInputChange(e, "stationId")} required />
                </div>
                <div className="field">
                    <label htmlFor="stationName">Name</label>
                    <InputText id="stationName" value={station.stationName} onChange={(e) => onInputChange(e, "stationName")} />
                </div>
                <div className="field">
                    <label htmlFor="lat">Latitude</label>
                    <InputText id="lat" value={station.lat || ""} onChange={(e) => onInputChange(e, "lat")} />
                </div>
                <div className="field">
                    <label htmlFor="lon">Longitude</label>
                    <InputText id="lon" value={station.lon || ""} onChange={(e) => onInputChange(e, "lon")} />
                </div>
                <div className="field">
                    <label htmlFor="luuvuc">Lưu vực</label>
                    <InputText id="luuvuc" value={station.luuvuc} onChange={(e) => onInputChange(e, "luuvuc")} />
                </div>
                <div className="field">
                    <label htmlFor="description">Mô tả</label>
                    <InputText id="description" value={station.description} onChange={(e) => onInputChange(e, "description")} />
                </div>

                <div className="flex justify-content-end mt-3">
                    <Button label="Cancel" icon="pi pi-times" className="p-button-text" onClick={hideDialog} />
                    <Button label="Save" icon="pi pi-check" className="p-button-text" onClick={saveStation} />
                </div>
            </Dialog>

            <Dialog visible={deleteDialog} style={{ width: "350px" }} header="Xác nhận xóa" modal onHide={hideDeleteDialog}>
                <div className="confirmation-content">
                    <i className="pi pi-exclamation-triangle mr-3" style={{ fontSize: "2rem" }} />
                    {station && <span>Bạn có chắc muốn xóa trạm <strong>{station.stationName}</strong>?</span>}
                </div>
                <div className="flex justify-content-end mt-3">
                    <Button label="Không" icon="pi pi-times" className="p-button-text" onClick={hideDeleteDialog} />
                    <Button label="Xóa" icon="pi pi-check" className="p-button-danger" onClick={deleteStation} />
                </div>
            </Dialog>
        </div>
    );
};

export default AdminStationPage;
