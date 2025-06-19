// RainTable.jsx
import React, { useState, useEffect } from 'react';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';

const RainTable = ({ rainData, stationId }) => {
    const [isLoading, setIsLoading] = useState(false);
    const [rows, setRows] = useState([]);

    useEffect(() => {
        if (!rainData || !Array.isArray(rainData.data) || rainData.data.length === 0 || stationId == undefined) {
            setRows([]);
            return;
        }

        setIsLoading(true);

        const filteredData = !stationId || stationId === 'all'
            ? rainData.data
            : rainData.data.filter(station => station.stationId === stationId);

        const newRows = filteredData.map((station) => {
            const row = {
                stationId: station.stationId,
                stationName: station.stationName,
                rainSum: station.rainSum + ' ml',
            };
            station.values.forEach((val, idx) => {
                row[`h${idx}`] = val + ' ml';
            });
            return row;
        });

        setTimeout(() => {
            setRows(newRows);
            setIsLoading(false);
        }, 300);
    }, [rainData, stationId]);

    if (!rainData || !rainData.listTime) return null;

    const columns = [
        { field: 'stationName', header: 'Trạm đo'},
        { field: 'rainSum', header: 'Tổng mưa' },
        ...rainData.listTime.map((time, index) => ({
            field: `h${index}`,
            header: time
        }))
    ];
    return (
        <div className="data-rain-table-container">
            <DataTable
                className="data-rain-table"
                value={rows}
                scrollable
                responsiveLayout="scroll"
                stripedRows
                scrollHeight="46vh"
                style={{ minWidth: '90%' }}
                loading={isLoading}
            >
                {columns.map((col) => (
                    <Column key={col.field} field={col.field} header={col.header} frozen={col.field === 'stationName'} />
                ))}
            </DataTable>
        </div>
    );
};

export default RainTable;
