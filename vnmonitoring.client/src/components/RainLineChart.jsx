import React, { useEffect, useRef } from 'react';
import * as echarts from 'echarts';

const RainLineChart = ({ rainData, stationId }) => {
    const chartRef = useRef(null);

    useEffect(() => {
        if (!rainData || !rainData.data || rainData.data.length === 0 || !chartRef.current) return;

        const chart = echarts.init(chartRef.current);

        let xData = rainData.listTime;
        let seriesData = [];
        if (stationId === 'all') {
            seriesData = rainData.data.map((station) => ({
                type: 'bar',
                name: station.stationName,
                data: station.values,
                large: true,
            }));
        } else {
            const selectedStation = rainData.data.find(s => s.stationId === stationId);
            if (selectedStation) {
                const cumulativeValues = selectedStation.values.reduce((acc, val, idx) => {
                    const prev = idx > 0 ? acc[idx - 1] : 0;
                    acc.push(prev + val);
                    return acc;
                }, []);
                seriesData = [
                    {
                    type: 'bar',
                    name: selectedStation.stationName,
                    data: selectedStation.values,
                    large: true,
                    },
                    {
                        type: 'line',
                        name: 'Mưa tích lũy trạm ' + selectedStation.stationName,
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
