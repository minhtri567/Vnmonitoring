import React, { useEffect, useRef } from 'react';
import * as echarts from 'echarts';

const RainLineChart = ({ rainData, stationId }) => {
    const chartRef = useRef(null);

    useEffect(() => {
        if (!rainData || !chartRef.current) return;
        
        // Defensive checks for data structure
        if (!rainData.data || !Array.isArray(rainData.data) || rainData.data.length === 0) {
            console.warn('Invalid rainData:', rainData);
            return;
        }
        
        // Ensure listTime is valid array
        const xData = Array.isArray(rainData.listTime) ? rainData.listTime : [];
        if (xData.length === 0) {
            console.warn('No time data available');
            return;
        }

        const chart = echarts.init(chartRef.current);
        let seriesData = [];
        
        if (stationId === 'all') {
            seriesData = rainData.data
                .filter(station => station && Array.isArray(station.values) && station.values.length > 0)
                .map((station) => ({
                    type: 'bar',
                    name: station.stationName || 'Unknown Station',
                    data: station.values,
                    large: true,
                }));
        } else {
            const selectedStation = rainData.data.find(s => s && s.stationId === stationId);
            if (selectedStation && Array.isArray(selectedStation.values) && selectedStation.values.length > 0) {
                const cumulativeValues = selectedStation.values.reduce((acc, val, idx) => {
                    const prev = idx > 0 ? acc[idx - 1] : 0;
                    acc.push(prev + val);
                    return acc;
                }, []);
                seriesData = [
                    {
                        type: 'bar',
                        name: selectedStation.stationName || 'Unknown Station',
                        data: selectedStation.values,
                        large: true,
                    },
                    {
                        type: 'line',
                        name: 'Mưa tích lũy trạm ' + (selectedStation.stationName || 'Unknown'),
                        data: cumulativeValues,
                        smooth: true,
                        lineStyle: {
                            width: 2,
                            color: 'blue',
                        },
                        symbol: 'circle',
                        symbolSize: 6,
                    }
                ];
            }
        }
        
        if (seriesData.length === 0) {
            console.warn('No valid series data found');
            return;
        }
        
        const option = {
            tooltip: {
                valueFormatter: function (value) {
                    return value + ' ml';
                }
            },
            legend: {
                top: 0,
            },
            xAxis: {
                type: 'category',
                data: xData,
                axisLabel: { rotate: 45 },
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: '{value} ml'
                }
            },
            series: seriesData,
        };

        chart.setOption(option);

        return () => {
            chart.dispose();
        };
    }, [rainData, stationId]);

    return <div ref={chartRef} style={{ height: '500px', width: '100%' }} />;
};

export default RainLineChart;
