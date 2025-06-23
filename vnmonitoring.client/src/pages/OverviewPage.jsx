// pages/ProvinceDetailPage.jsx
import React, { useEffect, useRef, useState } from 'react';
import Helmet from '../components/Helmet';
import Custom from '../assets/js/custom';
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import useFetchList from '../hooks/useFetchList';
import { DataView } from "primereact/dataview";
import { IconField } from "primereact/iconfield";
import { InputIcon } from "primereact/inputicon";
import { Button } from 'primereact/button';
import { InputText } from "primereact/inputtext";
import { useOutletContext } from 'react-router-dom';
import { Dialog } from 'primereact/dialog';
import { FloatLabel } from 'primereact/floatlabel';
import { Calendar } from 'primereact/calendar';
import { Dropdown } from 'primereact/dropdown';
import RainTable from '../components/RainTable'
import RainLineChart from '../components/RainLineChart'
import 'primereact/resources/themes/lara-light-blue/theme.css';
import 'primereact/resources/primereact.min.css';
const OverviewPage = () => {
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
    const [searchTerm, setSearchTerm] = useState('');
    const [filteredData, setFilteredData] = useState([]);
    const [showSearchInput, setShowSearchInput] = useState(false);
    const [selectedViewMode, setSelectedViewMode] = useState(viewModes[0]);
    const [hiddenchart, setHiddenchart] = useState(false);
    const [visibledata, setVisibledata] = useState(false);
    const [selectedOptimes, setSelectedOptimes] = useState(Optimes[0]);
    const [selectedStations, setSelectedStations] = useState(null);
    const [fromTime, setFromTime] = useState(null);
    const [toTime, setToTime] = useState(null);
    const mapRef = useRef();
    const mapContainerRef = useRef();
    const { province } = useOutletContext();
    const inputRef = useRef(null);
    const [query] = useState({ type: 'RAIN', tinh_seo: province.tinhSeo });
    const { data: datamonitoring } = useFetchList('api/Home/data-rain-station-newest', query, '');
    const { data: apiKeys, loading: loadingKeys} = useFetchList('api/Home/user-keymapbox', '', '');
    const { data: layers, loading: loadingLayers} = useFetchList('api/Home/user-maplayer', '', '');
    const { data: sources, loading: loadingSources} = useFetchList('api/Home/user-mapsource', '', '');

    const [querytime, setQuerytime] = useState({});
    const { data: datatablerain } = useFetchList('api/Home/data-rain-province-newest', querytime, '');

    const handleSubmit = () => {
        setQuerytime({
            type: 'RAIN',
            provinceId: province.gid,
            fromTime: fromTime.toLocaleString("en-US"),
            toTime: toTime.toLocaleString("en-US"),
            viewMode: selectedViewMode.code
        });
    };
    const handleSearchClick = () => {
        setShowSearchInput(true);
        setTimeout(() => {
            inputRef.current?.focus();
        }, 0);
    };
    const handleBlur = () => {
        setShowSearchInput(false);
    };
    const renderRainValue = (raintotal) => {
        const value = parseFloat(raintotal).toFixed(1) + "mm";

        if (raintotal === 0) {
            return <p className="text-norain">{value}</p>;
        }
        if (raintotal > 0 && raintotal <= 16) {
            return <p className="text-small">{value}</p>;
        }
        if (raintotal > 16 && raintotal <= 50) {
            return <p className="text-medium">{value}</p>;
        }
        if (raintotal > 50 && raintotal <= 99) {
            return <p className="text-heavy">{value}</p>;
        }
        if (raintotal > 99) {
            return <p className="text-heavier">{value}</p>;
        }
        return null;
    };
    const Typerain = (raintotal) => {
        if (raintotal === 0) {
            return (
                <div className="text-norain">
                    <img src="/vrain_marker_empty.png" alt="Không mưa" />
                    <p>Không mưa</p>
                </div>
            );
        }
        if (raintotal > 0 && raintotal <= 16) {
            return (
                <div className="text-small">
                    <img src="/vrain_marker_small.png" alt="Mưa nhỏ" />
                    <p>Mưa nhỏ</p>
                </div>
            );
        }
        if (raintotal > 16 && raintotal <= 50) {
            return (
                <div className="text-medium">
                    <img src="/vrain_marker_medium.png" alt="Mưa vừa" />
                    <p>Mưa vừa</p>
                </div>
            );
        }
        if (raintotal > 50 && raintotal <= 99) {
            return (
                <div className="text-heavy">
                    <img src="/vrain_marker_heavy.png" alt="Mưa to" />
                    <p>Mưa to</p>
                </div>
            );
        }
        if (raintotal > 99) {
            return (
                <div className="text-heavier">
                    <img src="/vrain_marker_heavier.png" alt="Mưa rất to" />
                    <p>Mưa rất to</p>
                </div>
            );
        }
        return null;
    };
    const itemsmonitoringTemplate = (item) => (
        <div className="item-data-monitoring" onClick={() => handleStationClick( item.lat , item.lon) }>
            <div className="d-flex justify-content-between item-line-1">
                <p>{item.station_name}</p>
                {renderRainValue(item.total)}
            </div>
            <div className="d-flex justify-content-between item-line-2">
                <p>tại {item.xa}</p>
                {Typerain(item.total)}
            </div>
        </div>
    );
    function flattenTree(tree) {
        const flat = [];

        function traverse(node, parentId = null) {
            const { children, ...rest } = node;
            flat.push({ ...rest, parentId });

            if (children && children.length > 0) {
                children.forEach(child => traverse(child, node.key));
            }
        }

        tree.forEach(root => traverse(root));
        return flat;
    }

    const viewllstation = (lat, lon) => {
        if (mapRef.current) {
            mapRef.current.flyTo({
                center: [lon, lat],
                zoom: 12,
                essential: true
            });
        }
    };
    const highlightBlinking = (map, lng, lat) => {
        const createCustomMarker = () => {
            const markerElement = document.createElement('div');
            markerElement.style.backgroundSize = 'cover';
            markerElement.style.width = '30px';
            markerElement.style.height = '30px';
            markerElement.style.borderRadius = '50%';
            markerElement.style.opacity = '0.2'; // Độ mờ khởi tạo là 20%
            markerElement.style.transition = 'opacity 1s ease'; // Thêm transition cho hiệu ứng mờ
            return markerElement;
        };

        const markerElement = createCustomMarker();

        const marker = new mapboxgl.Marker(markerElement)
            .setLngLat([lng, lat])
            .addTo(map);

        const interval = setInterval(() => {
            markerElement.style.backgroundColor = '#FF0000'; // Đặt màu đỏ
        }, 200);

        setTimeout(() => {
            clearInterval(interval);
            markerElement.style.opacity = '0';
            setTimeout(() => {
                marker.remove();
            }, 1000);
        }, 2000);
    };

    const handleStationClick = (lat, lon) => {
        viewllstation(lat, lon);
        highlightBlinking(mapRef.current, lon, lat);
    };
    const apimapbox = apiKeys.keyValue;
    useEffect(() => {
        if (!apimapbox || datamonitoring.length === 0 || layers.length === 0 || loadingKeys || loadingLayers || loadingSources) return;
        mapboxgl.accessToken = apimapbox;
        mapRef.current = new mapboxgl.Map({
            container: mapContainerRef.current,
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [107.5, 16.5],
            zoom: 4.5
        });

        class FitBoundsControl {
            onAdd(map) {
                this._map = map;
                this._container = document.createElement('div');
                this._container.className = 'mapboxgl-ctrl mapboxgl-ctrl-group';
                this._button = document.createElement('button');
                this._button.className = 'mapboxgl-ctrl-icon';
                this._button.type = 'button';
                this._button.title = '';
                this._button.innerHTML = '<span class="fa-solid fa-location-arrow" style="font-size: 21px;align-items: center;display: grid;"></span>';
                this._button.onclick = () => this.fitBounds();
                this._container.appendChild(this._button);
                return this._container;
            }

            onRemove() {
                this._container.parentNode.removeChild(this._container);
                this._map = undefined;
            }

            fitBounds() {
                const bounds = new mapboxgl.LngLatBounds();
                datamonitoring.forEach(station => {
                    bounds.extend([station.lon, station.lat]);
                });
                this._map.fitBounds(bounds, { padding: 40, essential: true });
            }
        }
        mapRef.current.addControl(new mapboxgl.FullscreenControl(), 'top-right');
        mapRef.current.addControl(new FitBoundsControl(), 'top-right');
        mapRef.current.addControl(new mapboxgl.GeolocateControl(), 'top-right');
        mapRef.current.on('style.load', () => {
            // Ẩn tên biển
            mapRef.current.setLayoutProperty('water-line-label', 'visibility', 'none');
        });

        mapRef.current.on('load', () => {
            const icons = [
                { id: 'small-marker', url: '/marker_small.png' },
                { id: 'medium-marker', url: '/marker_medium.png' },
                { id: 'heavy-marker', url: '/marker_heavy.png' },
                { id: 'heavier-marker', url: '/marker_heavier.png' },
                { id: 'empty-marker', url: '/marker_empty.png' },
            ];
            Custom.addVietnamIslandsMarkers(mapRef.current);
            icons.forEach(({ id, url }) => {
                mapRef.current.loadImage(url, (error, image) => {
                    if (error) {
                        console.error(`Lỗi khi load icon ${id}:`, error);
                        return;
                    }
                    if (!mapRef.current.hasImage(id)) {
                        mapRef.current.addImage(id, image);
                    }
                });
            });
            sources.map(s => {
                mapRef.current.addSource(`source-${s.id}`, {
                    type: 'vector',
                    tiles: [s.sourceUrl],
                    bounds: JSON.parse(s.bounds),
                    scheme: s.Scheme || 'tms'
                });
            });
            mapRef.current.addSource('stations', {
                type: 'geojson',
                data: {
                    type: 'FeatureCollection',
                    features: datamonitoring.map(station => ({
                        type: 'Feature',
                        geometry: {
                            type: 'Point',
                            coordinates: [station.lon, station.lat]
                        },
                        properties: {
                            sid: station.station_id,
                            name: station.station_name,
                            ngaydo: station.daterain,
                            tongluongmua: station.total,
                            time: station.data_thoigian,
                            tinh: station.tinh,
                        }
                    }))
                }
            });
            const flatDataLayer = flattenTree(layers);
            flatDataLayer.forEach(layer => {
                if (layer.isGroup) {
                    return;
                }
                try {
                    mapRef.current.addLayer({
                        id: `layer-${layer.key}`,
                        type: layer.layerType,
                        source: `source-${layer.sourceId}`,
                        'source-layer': layer.sourceLayer,
                        minzoom: layer.minZoom || 0,
                        maxzoom: layer.maxZoom || 14,
                        layout: {
                            ...(layer.layout ? JSON.parse(layer.layout) : {}),
                            visibility: layer.visibleByDefault ? 'visible' : 'none'
                        },
                        paint: layer.paint ? JSON.parse(layer.paint) : {},
                        filter: layer.filter ? JSON.parse(layer.filter) : ['all'],
                    });
                } catch (err) {
                    console.error(`Lỗi khi thêm layer ${layer.name}:`, err);
                }
            });
            mapRef.current.addLayer({
                id: 'norain-layer',
                type: 'symbol',
                source: 'stations',
                filter: ['all',
                    ['==', ['get', 'tongluongmua'], 0],  // Lượng mưa = 0
                ],
                layout: {
                    'icon-image': 'empty-marker',
                    'icon-allow-overlap': true
                }
            });
            mapRef.current.addLayer({
                id: 'smallrain-layer',
                type: 'symbol',
                source: 'stations',
                filter: ['all',
                    ['>', ['get', 'tongluongmua'], 0],  // Lượng mưa > 0
                    ['<=', ['get', 'tongluongmua'], 16] // Lượng mưa <= 16
                ],
                layout: {
                    'icon-image': 'small-marker',
                    'icon-allow-overlap': true

                }
            });
            mapRef.current.addLayer({
                id: 'mediumrain-layer',
                type: 'symbol',
                source: 'stations',
                filter: ['all',
                    ['>', ['get', 'tongluongmua'], 16],
                    ['<=', ['get', 'tongluongmua'], 50]
                ],
                layout: {
                    'icon-image': 'medium-marker',
                    'icon-allow-overlap': true
                }
            });
            mapRef.current.addLayer({
                id: 'heavyrain-layer',
                type: 'symbol',
                source: 'stations',
                filter: ['all',
                    ['>', ['get', 'tongluongmua'], 50],
                    ['<=', ['get', 'tongluongmua'], 99]
                ],
                layout: {
                    'icon-image': 'heavy-marker',
                    'icon-allow-overlap': true

                }
            });
            mapRef.current.addLayer({
                id: 'heavierrain-layer',
                type: 'symbol',
                source: 'stations',
                filter: ['>', ['get', 'tongluongmua'], 99],
                layout: {
                    'icon-image': 'heavier-marker',
                    'icon-allow-overlap': true

                }
            });

            const popup = new mapboxgl.Popup({
                closeButton: true,
                closeOnClick: true
            });
            var hoverTimeout;
            const layershover = [
                { id: 'norain-layer', className: 'norain', formatValue: (v) => v },
                { id: 'smallrain-layer', className: 'smallrain', formatValue: (v) => parseFloat(v).toFixed(2) },
                { id: 'mediumrain-layer', className: 'mediumrain', formatValue: (v) => parseFloat(v).toFixed(2) },
                { id: 'heavyrain-layer', className: 'heavyrain', formatValue: (v) => parseFloat(v).toFixed(2) },
                { id: 'heavierrain-layer', className: 'heavierrain', formatValue: (v) => parseFloat(v).toFixed(2) },
            ];

            layershover.forEach(({ id, className, formatValue }) => {
                mapRef.current.on('mouseenter', id, function (e) {
                    mapRef.current.getCanvas().style.cursor = 'pointer';
                    hoverTimeout = setTimeout(function () {
                        const coordinates = e.features[0].geometry.coordinates.slice();
                        const infor = e.features[0].properties;
                        const tongluongmua = formatValue(infor.tongluongmua);
                        const time = infor.time;
                        popup.setLngLat(coordinates)
                            .setHTML(
                                `<table class='popup-table ${className}'>
                                    <tr><th colspan='2'>Trạm đo : <strong>${infor.name}</strong></th></tr>
                                    <tr><td><i class='fa-solid fa-circle'></i> ${tongluongmua} mm</td></tr>
                                    <tr><td>Từ: ${time} đến hiện tại</td></tr>
                                </table>`
                            )
                            .addTo(mapRef.current);
                    }, 800);
                });

                mapRef.current.on('mouseleave', id, function () {
                    mapRef.current.getCanvas().style.cursor = '';
                    clearTimeout(hoverTimeout);
                });
            });

            const handleClickRainLayer = (e) => {
                const infor = e.features[0].properties;
                setVisibledata(true);
                setSelectedStations(infor.sid);

                setQuerytime({
                    type: 'RAIN',
                    provinceId: province.gid,
                    fromTime: fromTime.toLocaleString("en-US"),
                    toTime: toTime.toLocaleString("en-US"),
                    viewMode: selectedViewMode.code
                });
            };

            ["norain-layer", "smallrain-layer", "mediumrain-layer", "heavyrain-layer", "heavierrain-layer"]
                .forEach(layerId => {
                    mapRef.current.on('click', layerId, handleClickRainLayer);
                });


            const bounds = new mapboxgl.LngLatBounds();
            datamonitoring.forEach(station => {
                bounds.extend([station.lon, station.lat]);
            });
            mapRef.current.fitBounds(bounds, {
                padding: 40,
                duration: 1000,
                essential: true
            });
        });

        return () => {
            mapRef.current.remove();
        };

    }, [apimapbox, datamonitoring, layers, loadingKeys, loadingLayers, loadingSources, sources]);
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
        if (datatablerain.data != undefined && datatablerain && selectedStations != null) {
            const filtered = datatablerain.data.find(s => s.stationId == selectedStations);
            if (filtered != undefined) {
                const { stationId, stationName } = filtered;
                setSelectedStations({ stationId, stationName });
            }
        }
    }, [datatablerain, selectedStations]);

    const removeDiacritics = (str) => {
        return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
    };
    useEffect(() => {
        if (!searchTerm) {
            setFilteredData(datamonitoring);
        } else {
            const term = removeDiacritics(searchTerm);
            const filtered = datamonitoring.filter(item =>
                removeDiacritics(item.station_name || '').includes(term) ||
                removeDiacritics(item.xa || '').includes(term)
            );
            setFilteredData(filtered);
        }
    }, [searchTerm, datamonitoring]);

    return (
        <div>
            <Helmet
                title={`Mưa khu vực ${province.tenTinh}`}
                description={`Trang hiển thị bản đồ mưa của khu vực ${province.tenTinh} trong hệ thống Vnmonitoring`}
                keywords={`Mưa, trạm đo mưa , bản đồ mưa, mưa tích lũy, tỉnh ${province.tenTinh}`}
            />
            <Dialog className="dialog-data-rain" maximizable header={`Dữ liệu các trạm đo mưa tại tỉnh ${province == null ? "" : province.tenTinh}`} visible={visibledata} onHide={() => { if (!visibledata) return; setVisibledata(false); }}>
                    <div className="time-bar-dialog">
                        <div className="">
                            <FloatLabel>
                                <Dropdown value={selectedStations}
                                    onChange={(e) => setSelectedStations(e.value)}
                                    options={[
                                        { stationName: 'Tất cả trạm', stationId: 'all'},
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
                </Dialog>
            <div className="detail-container-page">
                <div className="container-data-monitoring detail-page">
                    <div className="liststation click-view-provine">
                        <div className="seach-provine">
                            <div className="search-header">
                                <div className="search-buttom">
                                    <div style={{ display: showSearchInput ? 'none' : 'flex', alignItems: 'center' }}>
                                        <h5 style={{ margin: 0 }}>
                                            Lưu lượng mưa từ {datamonitoring[0]?.data_thoigian} đến hiện tại
                                        </h5>
                                        <Button icon="pi pi-search" onClick={handleSearchClick} />
                                    </div>

                                    <div style={{ display: showSearchInput ? 'flex' : 'none' }}>
                                        <IconField className="search-feild" iconPosition="left">
                                            <InputIcon className="pi pi-search" />
                                            <InputText
                                                placeholder="Tìm theo tên trạm,xã"
                                                ref={inputRef}
                                                onBlur={handleBlur}
                                                value={searchTerm}
                                                onChange={(e) => setSearchTerm(e.target.value)}
                                            />
                                        </IconField>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="list-item-monitoring">
                        <DataView value={filteredData} itemTemplate={itemsmonitoringTemplate} />
                    </div>
                </div>
                <div className="map-container-detail">
                    <div id='map-container' ref={mapContainerRef} className="" />
                </div>
            </div>
        </div>
    );
};

export default OverviewPage;
