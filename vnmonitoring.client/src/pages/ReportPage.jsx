import React, { useEffect, useRef, useState } from 'react';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import useFetchList from '../hooks/useFetchList';
import { Toast } from 'primereact/toast';
import { Button } from 'primereact/button';
import { MultiSelect } from 'primereact/multiselect';
import { InputText } from "primereact/inputtext";
import { useOutletContext } from 'react-router-dom';
import { Dialog } from 'primereact/dialog';
import { FloatLabel } from 'primereact/floatlabel';
import { Calendar } from 'primereact/calendar';
import { Dropdown } from 'primereact/dropdown';
import api from '../axios/index';
import 'primereact/resources/themes/lara-light-blue/theme.css';
import 'primereact/resources/primereact.min.css';
const ReportPage = () => {
    const now = new Date();
    const Optimes = [
        { name: 'Ngày hôm nay', code: '1' },
        { name: 'Tháng này', code: '2' },
        { name: 'Khoảng thời gian', code: '3' }
    ];
    const viewModes = [
        { name: '1 Giờ', code: '1' },
        { name: '3 Giờ', code: '3' },
        { name: '6 Giờ', code: '6' },
        { name: '12 Giờ', code: '12' },
        { name: '1 Ngày', code: '24' }
    ];
    const toast = useRef(null);
    const [valueemail, setvalueemail] = useState('');
    const [selectedViewMode, setSelectedViewMode] = useState(viewModes[0]);
    const [visibledata, setVisibledata] = useState(false);
    const [selectedOptimes, setSelectedOptimes] = useState(Optimes[0]);
    const [selectedStations, setSelectedStations] = useState(null);
    const [fromTime, setFromTime] = useState(null);
    const [toTime, setToTime] = useState(null);
    const { province } = useOutletContext();
    const [typedata, settypedata] = useState("RAIN");
    const [datareport, setdatareport] = useState();

    const [query] = useState({ type: typedata, tinh_id: province.gid });
    const { data: datatablerain } = useFetchList('api/Home/get-all-station-province', query, '');
     const fetchData = async () => {
        try {
            const response = await api.get(`api/Home/get-getreportxlsx-province/search?type=${typedata}&tinh_id=${province.gid}`);
            setdatareport(response.data);
        } catch (error) {
            console.error("Lỗi khi tải dữ liệu:", error);
        }
    };
    useEffect(() => {
        fetchData();
    }, []);
    const handleSubmit = async () => {
        if (selectedStations == null) {
            toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Hãy chọn ít nhất 1 trạm !', life: 3000 });
            return;
        }
        var a = JSON.parse(localStorage.getItem("user"));
        function toLocalISOString(date) {
            const pad = (n) => String(n).padStart(2, '0');
            return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}T${pad(date.getHours())}:${pad(date.getMinutes())}:${pad(date.getSeconds())}`;
        }
        const payload = {
            name_file: `Báo cáo lượng mưa từ ${fromTime.toLocaleString("vi-VN")} đến ${toTime.toLocaleString("vi-VN")} tỉnh ${province.tenTinh}.xlsx`,
            request_time: toLocalISOString(now),
            ngaybatdau: toLocalISOString(fromTime),
            ngayketthuc: toLocalISOString(toTime),
            tansuat: selectedViewMode.code + 'h',
            email: valueemail, 
            trangthai: 1,
            rp_type : "RAIN",
            cq_id: province.gid,
            created_by: a.id,
            is_public: true,
            stations: selectedStations.map(st => ({
                provine_id: province.gid,
                station_id: st.stationId
            }))
        };

        try {
            await api.post('/api/Admin/add-report', payload);
            toast.current.show({ severity: 'success', summary: 'Success', detail: 'Yêu cầu thành công !', life: 3000 });
            fetchData();
            closedialog();

        } catch (err) {
            toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Lỗi chưa xác định !', life: 3000 });
            console.log(err);
        }
    };
    const popupdialog = () => {
        if (localStorage.getItem("user") == null) {
            toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Vui lòng đăng nhập tài khoản !', life: 3000 });
            return;
        } else {
            setVisibledata(true); 
        }
    };
    const closedialog = () => {
        setvalueemail('');
        setSelectedViewMode(viewModes[0]);
        setSelectedOptimes(Optimes[0])
        setSelectedStations(null);
        setVisibledata(false); 
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
    const downloadfileexcel = async (id) => {
        try {
            const response = await api.get(`/api/Home/download-report/${id}`, {
                responseType: 'blob'
            });

            const url = window.URL.createObjectURL(new Blob([response.data]));
            const link = document.createElement('a');
            link.href = url;

            // Nếu server có header tên file thì lấy, không thì fallback
            const contentDisposition = response.headers['content-disposition'];
            let fileName = `default.xlsx`;
            if (contentDisposition && contentDisposition.includes('filename=')) {
                fileName = contentDisposition.split('filename=')[1].replace(/['"]/g, '');
            }

            link.setAttribute('download', fileName);
            document.body.appendChild(link);
            link.click();
            link.remove();
        } catch (error) {
            console.error("Lỗi tải file:", error);
        }
    };

    const statusBodyTemplate = (report) => {
        switch (report.trangthai) {
            case 1:
                return <div className="report-pending">Đang xử lý</div>;
            case 2:
                return <button className="download_report" onClick={() => downloadfileexcel(report.id)}>Tải báo cáo</button>;
            case 3:
                return <div className="report-error">Lỗi xử lý</div>;
            default:
                return null;
        }
    };
    const frequencyBodyTemplate = (report) => {
        switch (report.tansuat) {
            case "1h":
                return <span>1 giờ</span>;

            case "3h":
                return <span>3 giờ</span>;

            case "6h":
                return <span>6 giờ</span>;

            case "12h":
                return <span>12 giờ</span>;

            case "24h":
                return <span>1 ngày</span>;
            default:
                return null;
        }
    };
    const resettable = () => {
        fetchData();
    };
    return (
        <div className="container-report-page">
            <Toast ref={toast} />
            <div className="btn-group-request">
                <Button className="btn-group-request-reset" onClick={() => { resettable(); }} label="Cập nhật" />
                <Button className="btn-group-request-request" onClick={() => { popupdialog(); }} label="Yêu cầu" />
              </div>
              <div className="card">
                  <DataTable value={datareport} tableStyle={{ minWidth: '50rem' }}>
                      <Column field="requestTime" header="Yêu cầu lúc"></Column>
                      <Column field="ngaybatdau" header="Ngày bắt đầu"></Column>
                      <Column field="ngayketthuc" header="Ngày kết thúc"></Column>
                      <Column body={frequencyBodyTemplate} header="Tần suất"></Column>
                      <Column field="email" header="email"></Column>
                      <Column body={statusBodyTemplate} header="Trạng thái"></Column>
                  </DataTable>
              </div>
            <Dialog className="dialog-data-rain-report" maximizable header={`Dữ liệu các trạm đo mưa tại tỉnh ${province == null ? "" : province.tenTinh}`} visible={visibledata} onHide={() => { if (!visibledata) return; setVisibledata(false); }}>
                <div className="email-dialog">
                    <FloatLabel>
                        <InputText id="useremail" value={valueemail} type="email" onChange={(e) => setvalueemail(e.target.value)} />
                        <label htmlFor="useremail">Email nhận báo cáo</label>
                    </FloatLabel>
                </div>
                  <div className="time-bar-dialog">
                      <div className="">
                          <FloatLabel>
                                <MultiSelect value={selectedStations}
                                onChange={(e) => setSelectedStations(e.value)}
                                options={datatablerain}
                                name="stations"
                                inputId="dd-datatablerain"
                                maxSelectedLabels={3} 
                                optionLabel="stationName"
                                selectedItemsLabel="Đã chọn {0} trạm"
                                placeholder="Chọn trạm đo mưa"
                                filter />
                              <label htmlFor="dd-datatablerain">Chọn trạm đo</label>
                          </FloatLabel>
                      </div>
                      <div className="">
                          <FloatLabel>
                              <Dropdown inputId="dd-Optimes" value={selectedOptimes} onChange={(e) => setSelectedOptimes(e.value)} options={Optimes} optionLabel="name" />
                              <label htmlFor="dd-Optimes">Chọn thời gian</label>
                          </FloatLabel>
                      </div>
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
                      <div className="">
                          <FloatLabel>
                              <Dropdown
                                  inputId="dd-ViewMode"
                                  value={selectedViewMode}
                                  onChange={(e) => setSelectedViewMode(e.value)}
                                  options={viewModes}
                                  optionLabel="name"
                              />
                              <label htmlFor="dd-ViewMode">Tần suất</label>
                          </FloatLabel>
                      </div>
                      <Button id="btn-submit" onClick={handleSubmit} label="Xác nhận" />
                  </div>
              </Dialog>
          </div>
      );
}

export default ReportPage;