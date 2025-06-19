import React, { useEffect, useRef, useState } from 'react';
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import { useNavigate } from 'react-router-dom';
import useFetchList from '../hooks/useFetchList';
import { Sidebar } from 'primereact/sidebar';
import { Tree } from 'primereact/tree';
import { DataView } from "primereact/dataview";
import { IconField } from "primereact/iconfield";
import { InputIcon } from "primereact/inputicon";
import { Button } from 'primereact/button';
import { InputText } from "primereact/inputtext";
import { Dialog } from 'primereact/dialog';
import { Calendar } from 'primereact/calendar';
import { Dropdown } from 'primereact/dropdown';
import { FloatLabel } from 'primereact/floatlabel';
import RainTable from '../components/RainTable'
import RainLineChart from '../components/RainLineChart'
import 'primereact/resources/themes/lara-light-blue/theme.css';
import 'primereact/resources/primereact.min.css';

const HomePage = () => {
    const mapRef = useRef();
    const mapContainerRef = useRef();
    const navigate = useNavigate();
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

    const [selectedKeys, setSelectedKeys] = useState({});
    const [selectedViewMode, setSelectedViewMode] = useState(viewModes[0]);
    const [sidebarVisible, setSidebarVisible] = useState(false);
    const [hiddenchart, setHiddenchart] = useState(false);
    const [visibledata, setVisibledata] = useState(false);
    const [selectedOptimes, setSelectedOptimes] = useState(Optimes[0]);
    const [selectedStations, setSelectedStations] = useState(null);
    const [selectedProvince, setSelectedProvince] = useState(null);
    const [selectedProvinceName, setSelectedProvinceName] = useState(null);
    const [fromTime, setFromTime] = useState(null);
    const [toTime, setToTime] = useState(null);
    
    const [user] = useState(() => {
        const storedUser = localStorage.getItem('user');
        return storedUser ? JSON.parse(storedUser) : null;
    }); 
    const [showSearchInput, setShowSearchInput] = useState(false);
    const inputRef = useRef(null);
    const { data: apiKeys, loading: loadingKeys, error: errorKeys } = useFetchList('api/Home/user-keymapbox', '', '');
    const { data: layers, loading: loadingLayers, error: errorLayers } = useFetchList('api/Home/user-maplayer', '', '');
    const { data: sources, loading: loadingSources, error: errorSources } = useFetchList('api/Home/user-mapsource', '', '');
    const [query] = useState({ type: 'RAIN' });
    const { data: datamonitoring } = useFetchList('api/Home/data-rain-all-province-newest', query , '');
    const { data: datastationrain } = useFetchList('api/Home/data-rain-station-newest', query, '');
    const [querytime, setQuerytime] = useState({});

    const handleSubmit = () => {
        setQuerytime({
            type: 'RAIN',
            provinceId: selectedProvince,
            fromTime: fromTime.toLocaleString("en-US"),
            toTime: toTime.toLocaleString("en-US"),
            viewMode: selectedViewMode.code
        });
    };
    const { data: datatablerain } = useFetchList('api/Home/data-rain-province-newest', querytime, '');
    useEffect(() => {
        console.log(selectedProvince);
        if (selectedProvince != null) {
            setQuerytime({
                type: 'RAIN',
                provinceId: selectedProvince,
                fromTime: fromTime.toLocaleString("en-US"),
                toTime: toTime.toLocaleString("en-US"),
                viewMode: selectedViewMode.code
            });
        }
    }, [selectedProvince]);
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
    useEffect(() => {
        if (datatablerain.data != undefined && datatablerain && selectedStations != null) {
            const filtered = datatablerain.data.find(s => s.stationId == selectedStations);
            if (filtered != undefined) {
                const { stationId, stationName } = filtered;
                setSelectedStations({ stationId, stationName });
            }
        }
    }, [datatablerain, selectedStations]);
    const collectVisibleKeys = (nodes) => {
        const result = {};

        const traverse = (items) => {
            return items.map(node => {
                let isChecked = false;
                let hasCheckedChild = false;

                if (node.children && node.children.length > 0) {
                    const childKeys = traverse(node.children);
                    hasCheckedChild = childKeys.length > 0;

                    if (hasCheckedChild) {
                        result[node.key] = { partialChecked: true };
                    }
                }

                if (node.visibleByDefault === true) {
                    result[node.key] = { checked: true };
                    isChecked = true;
                }

                return (isChecked || hasCheckedChild) ? node.key : null;
            }).filter(k => k !== null);
        };

        traverse(nodes);
        return result;
    };

    useEffect(() => {
        if (layers && layers.length > 0) {
            const keys = collectVisibleKeys(layers);
            setSelectedKeys(keys);
        }
    }, [layers]);

    const apimapbox = apiKeys.keyValue;
    const handleLogout = () => {
        localStorage.removeItem('user');
        navigate('/login');
    };
    const handleLogin = () => {
        navigate('/login');
    };

    const handleAdminRedirect = () => {
        navigate('/admin');
    };

    const toggleLayer = React.useCallback((layerId, isChecked) => {
        try {
            const layerIdStr = `layer-${layerId}`;
            if (!mapRef.current) return;

            mapRef.current.setLayoutProperty(
                layerIdStr,
                'visibility',
                isChecked ? 'visible' : 'none'
            );
        } catch (err) {
            console.log(err)
        }
    }, []);
    const collectLeafNodes = (nodes) => {
        const result = [];

        const traverse = (items) => {
            items.forEach(node => {
                const isGroup = node.isGroup;
                if (!isGroup && (!node.children || node.children.length === 0)) {
                    result.push(node);
                }
                if (node.children && node.children.length > 0) {
                    traverse(node.children);
                }
            });
        };

        traverse(nodes);
        return result;
    };

    useEffect(() => {
        if (!apimapbox || datastationrain.length === 0 || layers.length === 0 || loadingKeys || loadingLayers || loadingSources) return;
        mapboxgl.accessToken = apimapbox;
        mapRef.current = new mapboxgl.Map({
            container: mapContainerRef.current,
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [105.84, 21.03],
            zoom: 5
        });

        mapRef.current.on('load', () => {
            const icons = [
                { id: 'small-marker', url: '/marker_small.png' },
                { id: 'medium-marker', url: '/marker_medium.png' },
                { id: 'heavy-marker', url: '/marker_heavy.png' },
                { id: 'heavier-marker', url: '/marker_heavier.png' },
                { id: 'empty-marker', url: '/marker_empty.png' },
            ];

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
                    features: datastationrain.map(station => ({
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
                            tinhid: station.tinhid
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
                console.log(infor)
                setVisibledata(true);
                setSelectedProvinceName(infor.tinh);
                setSelectedProvince(infor.tinhid);
                setSelectedStations(infor.sid);
            };

            ["norain-layer", "smallrain-layer", "mediumrain-layer", "heavyrain-layer", "heavierrain-layer"]
                .forEach(layerId => {
                    mapRef.current.on('click', layerId, handleClickRainLayer);
                });

        });
        
        return () => {
            mapRef.current.remove();
        };

    }, [apimapbox, datastationrain, layers, loadingKeys, loadingLayers, loadingSources, sources]);

    if (loadingKeys || loadingLayers) {
        return <div className="d-flex justify-content-center align-items-center vh-100">
            <div className="spinner-border text-primary" role="status">
                <span className="visually-hidden">Loading...</span>
            </div>
        </div>;
    }

    if (errorKeys || errorLayers || errorSources) {
        return <div className="alert alert-danger m-3">
            Có lỗi xảy ra khi tải dữ liệu: {errorKeys?.message || errorLayers?.message || errorSources?.message}
        </div>;
    }

    const handlenagativeprovince = (item) => {
        if (item) {
            navigate(`/overview/${item}`);
        }
    };

    const itemsmonitoringTemplate = (item) => (
        <div className="item-data-monitoring" onClick={() => handlenagativeprovince(item.tinhseo) }>
            <div className="d-flex justify-content-between item-line-1">
                <p>{item.tenTinh}</p>
                {renderRainValue(item.total)}
            </div>
            <div className="d-flex justify-content-between item-line-2">
                <p>tại {item.stationName}</p>
                {Typerain(item.total)}
            </div>
        </div>
    );
    

    const handleSearchClick = () => {
        setShowSearchInput(true);
        setTimeout(() => {
            inputRef.current?.focus();
        }, 0);
    };

    const handleBlur = () => {
        setShowSearchInput(false);
    };

    return (
        <div>
            <Dialog className="dialog-data-rain" maximizable header={`Dữ liệu các trạm đo mưa tại tỉnh ${selectedProvinceName}`} visible={visibledata} onHide={() => { if (!visibledata) return; setVisibledata(false); }}>
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
            <div className="container-data-monitoring">
                <div className="liststation click-view-provine">
                    <h3 style={{ margin: "0px", padding: "1rem", borderBottom: "1px solid rgba(255, 255, 255, .12)" }}>Danh sách các trạm theo tỉnh</h3>
                    <div className="seach-provine">
                        <div className="search-header">
                            <div className="search-buttom">
                                <div style={{ display: showSearchInput ? 'none' : 'flex', alignItems: 'center' }}>
                                    <h5 style={{ margin: 0 }}>
                                        Lưu lượng mưa từ {datamonitoring?.lasttimeday} đến hiện tại
                                    </h5>
                                    <Button icon="pi pi-search" onClick={handleSearchClick} />
                                </div>

                                <div style={{ display: showSearchInput ? 'flex' : 'none' }}>
                                    <IconField className="search-feild" iconPosition="left">
                                        <InputIcon className="pi pi-search" />
                                        <InputText
                                            placeholder="Search"
                                            ref={inputRef}
                                            onBlur={handleBlur}
                                        />
                                    </IconField>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="list-item-monitoring">
                    <DataView value={datamonitoring.data} itemTemplate={itemsmonitoringTemplate} />
                </div>
            </div>
            <nav className="navbar navbar-expand-lg map-navbar">
                <div className="container-fluid">
                    <div className="d-flex align-items-center ms-auto">
                        {user?.role && (
                            <button
                                className="btn btn-outline-secondary me-2"
                                title="Trang quản trị"
                                onClick={handleAdminRedirect}
                            >
                                <i className="fas fa-cog"></i>
                            </button>
                        )}
                        {user && (
                            <span className="me-3 fw-bold text-primary">
                                {user.username}
                            </span>
                        )}
                        {user && (
                            <button className="btn btn-outline-danger" onClick={handleLogout}>
                                Đăng xuất
                            </button>
                        )}
                        {!user && (
                            <button className="btn btn-outline-primary" onClick={handleLogin}>
                                Đăng nhập
                            </button>
                        )}
                    </div>
                </div>
            </nav>
            <div id='mapbox-container'>
                <div id='map-container' ref={mapContainerRef} className="" />
            </div>
            <button
                className="btn btn-primary position-absolute bottom-0 end-0 m-3 z-3"
                onClick={() => setSidebarVisible(true)}
            >
                <i className="pi pi-sliders-h"></i>
            </button>

            <Sidebar
                visible={sidebarVisible}
                position="right"
                onHide={() => setSidebarVisible(false)}
                style={{ width: '500px' }}
                header={<h5 className="mb-3">Quản lý lớp bản đồ</h5> }
            >
                
                <Tree
                    value={layers}
                    selectionMode="checkbox"
                    selectionKeys={selectedKeys}
                    onSelectionChange={(e) => {
                        const newSelected = e.value;
                        setSelectedKeys(newSelected);

                        const leafNodes = collectLeafNodes(layers);

                        leafNodes.forEach((node) => {
                            const isChecked = newSelected[node.key]?.checked === true;
                            toggleLayer(node.key, isChecked);
                        });
                    }}
                    className="w-full md:w-30rem"
                />
            </Sidebar>


        </div>
    );
};

export default HomePage;