import React, { useEffect, useState, useRef } from "react";
import axios from "../axios/index";
import { DataTable } from "primereact/datatable";
import { Column } from "primereact/column";
import { Toast } from "primereact/toast";
import { Calendar } from "primereact/calendar";
import { Dropdown } from "primereact/dropdown";
import { FloatLabel } from "primereact/floatlabel";
import { InputText } from "primereact/inputtext";
import { Button } from 'primereact/button';
import { Dialog } from 'primereact/dialog';

const AdminMonitoringDataPage = () => {
    const now = new Date();
    const toast = useRef(null);
    const [data, setData] = useState([]);
    const [loading, setLoading] = useState(false);
    const [page, setPage] = useState(0);
    const [rows, setRows] = useState(10);
    const [totalRecords, setTotalRecords] = useState(0);
    const [fromTime, setFromTime] = useState(null);
    const [toTime, setToTime] = useState(null);
    const [selectedType, setSelectedType] = useState(null);
    const [dataType, setDataType] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [editingRow, setEditingRow] = useState(null);
    const [showDialog, setShowDialog] = useState(false);
    const [formData, setFormData] = useState({
        dataId: null,
        stationId: "",
        stationName: "",
        dataGiatriSothuc: "",
        dataThoigian: new Date(),
        tsktId: "",
        dataMaloaithongso: "",
    });
    const Optimes = [
        { name: "Hôm nay", code: "1" },
        { name: "Tháng này", code: "2" },
        { name: "Khoảng thời gian", code: "3" }
    ];
    const [selectedOptimes, setSelectedOptimes] = useState(Optimes[0]);

    useEffect(() => {
        let from = null;
        let to = new Date();
        const now = new Date();

        if (selectedOptimes?.code === "1") {
            from = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0, 0);
            to = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 23, 59, 59);
        } else if (selectedOptimes?.code === "2") {
            from = new Date(now.getFullYear(), now.getMonth(), 1, 0, 0, 0);
        } else if (selectedOptimes?.code === "3") {
            from = new Date(fromTime);
            to = new Date(toTime);
        }

        if (from?.getTime() !== fromTime?.getTime()) setFromTime(from);
        if (to?.getTime() !== toTime?.getTime()) setToTime(to);
    }, [selectedOptimes]);

    useEffect(() => {
        getdatatype();
    }, []);

    const getdatatype = async (pageIndex = 0, pageSize = 10) => {
        var from = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0, 0);
        var to = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 23, 59, 59);
        try{
            const res = await axios.get("/api/admin/getalltypedata");
            setDataType(res.data);
            setSelectedType(res.data[0].value);

            const resdata = await axios.get("/api/admin/getmonitoringdata/search", {
                params: {
                    page: pageIndex + 1,
                    pageSize,
                    fromDate: from.toLocaleString("en-US"),
                    toDate: to.toLocaleString("en-US"),
                    type: res.data[0].value,
                    keyword: searchTerm
                }
            });
            setData(resdata.data.data);
            setTotalRecords(resdata.data.total);
        }catch(err) {
            toast.current.show({
                severity: "error",
                summary: "Lỗi",
                detail: "Không thể tải dữ liệu kiểu quan trắc"
            });
        }
    };

    const loadData = async (pageIndex = 0, pageSize = 10) => {
        setLoading(true);
        try {
            const res = await axios.get("/api/admin/getmonitoringdata/search", {
                params: {
                    page: pageIndex + 1,
                    pageSize,
                    fromDate: fromTime?.toLocaleString("en-US"),
                    toDate: toTime?.toLocaleString("en-US"),
                    type: selectedType.value,
                    keyword: searchTerm
                }
            });
            setData(res.data.data);
            setTotalRecords(res.data.total);
        } catch (err) {
            toast.current.show({
                severity: "error",
                summary: "Lỗi",
                detail: "Không thể tải dữ liệu quan trắc"
            });
        }
        setLoading(false);
    };
    const openAdd = () => {
        setFormData({
            dataId: null,
            stationId: "",
            stationName: "",
            dataGiatriSothuc: "",
            dataThoigian: new Date(),
            tsktId: "",
            dataMaloaithongso: "",
        });
        setShowDialog(true);
    };

    const openEdit = (rowData) => {
        setFormData({ ...rowData });
        setShowDialog(true);
    };

    const handleSave = async () => {
        try {
            if (formData.dataId) {
                await axios.put("/api/admin/putmonitoringdata/" + formData.dataId, formData);
                toast.current.show({ severity: "success", summary: "Cập nhật thành công" });
            } else {
                await axios.post("/api/admin/postmonitoringdata", formData);
                toast.current.show({ severity: "success", summary: "Thêm mới thành công" });
            }
            setShowDialog(false);
            loadData(page, rows);
        } catch (err) {
            toast.current.show({ severity: "error", summary: "Lỗi", detail: "Không thể lưu dữ liệu" });
        }
    };
    const handleDelete = async (rowData) => {
        try {
            await axios.delete(`/api/admin/deletemonitoringdata/${rowData.dataId}`);
            toast.current.show({ severity: "success", summary: "Đã xóa" });
            loadData(page, rows);
        } catch (err) {
            toast.current.show({ severity: "error", summary: "Lỗi", detail: "Không thể xóa dữ liệu" });
        }
    };

    const onPageChange = (e) => {
        setPage(e.page);
        setRows(e.rows);
        loadData(e.page, e.rows);
    };
    const handleSubmit = () => {
        loadData(page, rows);
    };
    return (
        <div className="p-4">
            <Toast ref={toast} />
            <div className="card">
                <div className="d-flex gap-3 mb-3 mt-4 mxa-3 align-items-center">
                    <FloatLabel>
                        <Dropdown inputId="dd-Optimes" value={selectedOptimes} onChange={(e) => setSelectedOptimes(e.value)} options={Optimes} optionLabel="name" />
                        <label htmlFor="dd-Optimes">Chọn thời gian</label>
                    </FloatLabel>

                    {selectedOptimes?.code === "3" && (
                        <>
                            <FloatLabel>
                                <Calendar value={fromTime} onChange={(e) => setFromTime(e.value)} showTime dateFormat="dd/mm/yy" maxDate={now} />
                                <label htmlFor="st_date">Từ ngày</label>
                            </FloatLabel>
                            <FloatLabel>
                                <Calendar value={toTime} onChange={(e) => setToTime(e.value)} showTime dateFormat="dd/mm/yy" maxDate={now} />
                                <label htmlFor="et_date">Đến ngày</label>
                            </FloatLabel>
                        </>
                    )}
                    <FloatLabel>
                        <Dropdown
                            inputId="type-filter"
                            value={selectedType}
                            options={dataType}
                            onChange={(e) => setSelectedType(e.value)}
                        />
                        <label htmlFor="type-filter">Loại dữ liệu</label>
                    </FloatLabel>
                    <FloatLabel>
                        <InputText id="search" value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} />
                        <label htmlFor="search">Tìm theo tên/mã trạm</label>
                    </FloatLabel>
                    <Button id="btn-submit" onClick={handleSubmit} label="Xem" />
                    <span>{totalRecords} bản ghi</span>
                </div>

                <DataTable
                    value={data}
                    lazy
                    paginator
                    first={page * rows}
                    rows={rows}
                    header={<Button icon="pi pi-plus" label="Thêm mới" className="mb-3" onClick={openAdd} />}
                    totalRecords={totalRecords}
                    onPage={onPageChange}
                    loading={loading}
                    responsiveLayout="scroll"
                >
                    <Column field="dataId" header="ID" sortable />
                    <Column field="tsktTen" header="Thông số" />
                    <Column field="stationId" header="Mã trạm" />
                    <Column field="stationName" header="Tên trạm" />
                    <Column field="dataThoigian" header="Thời gian" body={(rowData) => new Date(rowData.dataThoigian).toLocaleString()} />
                    <Column field="dataGiatriSothuc" header="Giá trị" />
                    <Column field="dataMaloaithongso" header="Loại" />
                    <Column
                        header="Thao tác"
                        body={(rowData) => (
                            <>
                                <Button icon="pi pi-pencil" className="p-button-text" onClick={() => openEdit(rowData)} />
                                <Button icon="pi pi-trash" className="p-button-text text-red-500" onClick={() => handleDelete(rowData)} />
                            </>
                        )}
                    />
                </DataTable>
                <Dialog header={formData.dataId ? "Sửa dữ liệu" : "Thêm dữ liệu"} visible={showDialog} onHide={() => setShowDialog(false)} modal style={{ width: "50%" }}>
                    <div className="p-fluid formgrid grid">
                        {
                            formData.dataId ? (
                                <>
                                    <div className="w-100 col-12">
                                        <label htmlFor="stationId">Mã trạm</label>
                                        <InputText value={formData.stationId} onChange={(e) => setFormData({ ...formData, stationId: e.target.value })} disabled />
                                    </div>
                                    <div className="w-100 col-12">
                                        <label htmlFor="stationName">Tên trạm</label>
                                        <InputText value={formData.stationName} onChange={(e) => setFormData({ ...formData, stationName: e.target.value })} disabled />
                                    </div>
                                </>
                            ) : (
                                <>
                                    <div className="w-100 col-12">
                                        <label htmlFor="stationId">Mã trạm</label>
                                        <InputText value={formData.stationId} onChange={(e) => setFormData({ ...formData, stationId: e.target.value })} />
                                    </div>
                                </>
                            )
                        }
                        <div className="w-100 col-6">
                            <label htmlFor="dataGiatriSothuc">Giá trị</label>
                            <InputText value={formData.dataGiatriSothuc} onChange={(e) => setFormData({ ...formData, dataGiatriSothuc: e.target.value })} />
                        </div>
                        <div className="w-100 col-6">
                            <label htmlFor="dataThoigian">Thời gian</label>
                            <Calendar value={new Date(formData.dataThoigian)} onChange={(e) => setFormData({ ...formData, dataThoigian: e.value })} showTime />
                        </div>
                    </div>
                    <div className="d-flex justify-content-end gap-2 mt-2">
                        <Button label="Lưu" onClick={handleSave} />
                        <Button label="Hủy" severity="secondary" onClick={() => setShowDialog(false)} />
                    </div>
                </Dialog>

            </div>
        </div>
    );
};

export default AdminMonitoringDataPage;
