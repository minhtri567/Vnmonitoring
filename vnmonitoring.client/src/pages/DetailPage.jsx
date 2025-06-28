import React, { useEffect, useState } from 'react';
import Helmet from '../components/Helmet';
import useFetchList from '../hooks/useFetchList';
import { Button } from 'primereact/button';
import { useOutletContext } from 'react-router-dom';
import { FloatLabel } from 'primereact/floatlabel';
import { Calendar } from 'primereact/calendar';
import { Dropdown } from 'primereact/dropdown';
import RainTable from '../components/RainTable'
import RainLineChart from '../components/RainLineChart';
import * as XLSX from 'xlsx';
import 'primereact/resources/themes/lara-light-blue/theme.css';
import 'primereact/resources/primereact.min.css';
const DetailPage = () => {
    const now = new Date();
    const Optimes = [
        { name: 'Ngày hôm nay', code: '1' },
        { name: 'Tháng này', code: '2' },
        { name: 'Khoảng thời gian', code: '3' }
    ];
    const viewModes = [
        { name: 'Giờ', code: 'hour' },
        { name: 'Ngày', code: 'day' },
        { name: 'Tháng', code: 'month' }
    ];
    const [selectedViewMode, setSelectedViewMode] = useState(viewModes[0]);
    const [hiddenchart, setHiddenchart] = useState(false);
    const [selectedOptimes, setSelectedOptimes] = useState(Optimes[0]);
    const [selectedStations, setSelectedStations] = useState(null);
    const [fromTime, setFromTime] = useState(null);
    const [toTime, setToTime] = useState(null);
    const { province } = useOutletContext();
    const [querytime, setQuerytime] = useState({});
    const { data: datatablerain} = useFetchList('api/Home/data-rain-province-newest', querytime, '');

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
    
    useEffect(() => {
        if (datatablerain?.data?.length && selectedStations == null) {
            const firstStation = {
                stationName: 'Tất cả trạm',
                stationId: 'all'
            };
            setSelectedStations(firstStation);
        }
    }, [datatablerain]);
    const handleSubmit = () => {
        setQuerytime({
            type: 'RAIN',
            provinceId: province.gid,
            fromTime: fromTime.toLocaleString("en-US"),
            toTime: toTime.toLocaleString("en-US"),
            viewMode: selectedViewMode.code
        });
    };
    useEffect(() => {
        let from = null;
        let to = new Date();
        const now = new Date();
        from = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 0, 0, 0);
        to = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours(), 0, 0);
        setQuerytime({
            type: 'RAIN',
            provinceId: province.gid,
            fromTime: from.toLocaleString("en-US"),
            toTime: to.toLocaleString("en-US"),
            viewMode: selectedViewMode.code
        });
    }, []);
    const exportToExcel = () => {
        const table = document.querySelector('.data-rain-table table');
        if (!table) {
            console.error('Không tìm thấy bảng đo mưa');
            return;
        }
        var namexlsx;
        if (selectedStations.stationId == "all") {
            namexlsx = `Mưa từ ${fromTime.toLocaleString("vi-VN")} đến ${toTime.toLocaleString("vi-VN")} tất cả trạm tỉnh ${province.tenTinh}.xlsx`;
        } else {
            namexlsx = `Mưa từ ${fromTime.toLocaleString("vi-VN")} đến ${toTime.toLocaleString("vi-VN")} tại trạm ${selectedStations.stationName} của tỉnh ${province.tenTinh}.xlsx`;
        }

        const wb = XLSX.utils.table_to_book(table, { sheet: 'Sheet1' });
        XLSX.writeFile(wb, namexlsx);
    };
  return (
      <div className="detail-data-rain">
          <Helmet
              title={`Chi tiết mưa khu vực ${province.tenTinh}`}
              description={`Chi tiết của khu vực ${province.tenTinh} trong hệ thống Vnmonitoring`}
              keywords={`Mưa, trạm đo mưa , chi tiết mưa, chi tiết mưa tích lũy , biểu đồ mưa mưa,bảng mưa tỉnh ${province.tenTinh}`}
          />
          <div className="time-bar-dialog">
              <div className="">
                  <FloatLabel>
                      <Dropdown value={selectedStations}
                          onChange={(e) => setSelectedStations(e.value)}
                          options={[
                              { stationName: 'Tất cả trạm', stationId: 'all' },
                              ...(datatablerain?.data ?? []).map(station => ({
                                  stationName: station.stationName,
                                  stationId: station.stationId
                              }))
                          ]}
                          inputId="dd-datatablerain"
                          optionLabel="stationName"
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
                      <label htmlFor="dd-ViewMode">Chế độ xem</label>
                  </FloatLabel>
              </div>
              <Button id="btn-submit" onClick={handleSubmit} label="Xem" />
              <Button label={hiddenchart ? 'Ẩn biều đồ' : 'Xem biểu đồ'} onClick={() => setHiddenchart(() => !hiddenchart)} />
              <Button label={"Tải file excel"} onClick={() => exportToExcel() } />
              
          </div>
          {!hiddenchart ? "" :
              <div className="data-rain-chart-view">
                  <RainLineChart
                      rainData={datatablerain}
                      stationId={selectedStations === null ? null : selectedStations.stationId}
                  />
              </div>
          }
        <div className="data-rain-view">
            <RainTable
                rainData={datatablerain}
                stationId={selectedStations === null ? null : selectedStations.stationId}
            />
        </div>
          
      </div>
  );
}

export default DetailPage;