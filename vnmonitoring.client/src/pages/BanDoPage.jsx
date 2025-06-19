// BanDoPage.jsx
import React, { useEffect, useState, useRef } from 'react';
import axios from '../axios/index';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Button } from 'primereact/button';
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext';
import { Checkbox } from 'primereact/checkbox';
import { Dropdown } from 'primereact/dropdown';
import { InputTextarea } from 'primereact/inputtextarea';
import { InputNumber } from 'primereact/inputnumber';
import { Toast } from 'primereact/toast';
import { Tree } from 'primereact/tree';
import { TreeSelect } from 'primereact/treeselect';
const BanDoPage = () => {
    const toast = useRef(null);

    const [apikeys, setApikeys] = useState([]);
    const [mapLayers, setMapLayers] = useState([]);
    const [mapSources, setMapSources] = useState([]);

    const [apikeyDialog, setApikeyDialog] = useState(false);
    const [layerDialog, setLayerDialog] = useState(false);
    const [sourceDialog, setSourceDialog] = useState(false);

    const [SelectedApikey, setSelectedApikey] = useState(false);
    //const [Selectedlayer, setSelectedLayer] = useState(false);
    const [Selectedsource, setSelectedSource] = useState(false);

    const initialFormApikey = { id: null, keyValue: '', description: '', active: false };
    const initialFormLayer = { key: null, label: '', description: '', sourceLayer: '', filter: [], layout: {}, visibleByDefault: false, isPublic: false, paint: {}, layerType: '', sortOrder: 0, isGroup: true,minZoom: 0,maxZoom: 0, parentId : null ,sourceId: null};
    const initialFormSource = {
        id: null,
        name: '',
        description: '',
        sourceUrl: '',
        filter: '',
        bounds: [],
        scheme: '',
        sourceType: '',
        active: false,
        apiKeyid: null,
};

    const [apikeyForm, setApikeyForm] = useState(initialFormApikey);
    const [layerForm, setLayerForm] = useState(initialFormLayer);
    const [sourceForm, setSourceForm] = useState(initialFormSource);

    useEffect(() => {
        fetchApikeys();
        fetchMapLayers();
        fetchMapSource();
    }, []);

    const fetchApikeys = async () => {
        const res = await axios.get('/api/admin/all-apikeys');
        setApikeys(res.data);
    };

    const fetchMapLayers = async () => {
        const res = await axios.get('/api/admin/all-maplayers');
        setMapLayers(res.data);
    };

    const fetchMapSource = async () => {
        const res = await axios.get('/api/admin/all-mapsource');
        setMapSources(res.data);
    };

    const editApikey = (row) => {
        setApikeyForm(row);
        setApikeyDialog(true);
    };
    const editSource = (row) => {

        setSourceForm(row);
        setSourceDialog(true);
    };
    const editLayer = (row) => {
        setLayerForm(row);
        setLayerDialog(true);
    };

    const saveApikey = async () => {
        try {
            const payload = { ...apikeyForm };
            delete payload.id;
            if (apikeyForm.id) {
                await axios.put(`/api/admin/update-apikey/${apikeyForm.id}`, payload);
                toast.current.show({
                    severity: 'success',
                    summary: 'Thành công',
                    detail: 'Cập nhật key bản đồ thành công'
                });
            } else {
                await axios.post('/api/admin/add-apikey', payload);
                toast.current.show({
                    severity: 'success',
                    summary: 'Thành công',
                    detail: 'Thêm key bản đồ thành công'
                });
            }
            setApikeyDialog(false);
            fetchApikeys();
        } catch(error) {
            console.log(error);
            toast.current.show({
                severity: 'error',
                summary: 'Lỗi',
                detail: error.response?.data?.message || 'Có lỗi xảy ra khi lưu dữ liệu'
            });
        }
    };

    const saveMapSource = async () => {
        try {
            const payload = { ...sourceForm };
            delete payload.id;
            if (sourceForm.id) {
                await axios.put(`/api/admin/update-mapsource/${sourceForm.id}`, payload);
                toast.current.show({
                    severity: 'success',
                    summary: 'Thành công',
                    detail: 'Cập nhật nguồn bản đồ thành công'
                });
            } else {
                await axios.post('/api/admin/add-mapsource', payload);
                toast.current.show({
                    severity: 'success',
                    summary: 'Thành công',
                    detail: 'Thêm nguồn bản đồ thành công'
                });
            }

            setSourceDialog(false);
            fetchMapSource();

        } catch (error) {
            console.error('Lỗi khi lưu nguồn bản đồ:', error);
            toast.current.show({
                severity: 'error',
                summary: 'Lỗi',
                detail: error.response?.data?.message || 'Có lỗi xảy ra khi lưu dữ liệu'
            });
        }
    };

    const saveMapLayer = async () => {
        try {
            const payload = { ...layerForm, name: layerForm.label };
            delete payload.key;
            if (layerForm.isGroup == true) {
                delete payload.sourceLayer;
                delete payload.filter;
                delete payload.layout;
                delete payload.visibleByDefault;
                delete payload.paint;
                delete payload.layerType;
                delete payload.bound;
                delete payload.sourceId;
            }
            if (layerForm.key) {
                await axios.put(`/api/admin/update-maplayer/${layerForm.key}`, payload);
                toast.current.show({
                    severity: 'success',
                    summary: 'Thành công',
                    detail: 'Cập nhật lớp bản đồ thành công'
                });
            } else {
                await axios.post('/api/admin/add-maplayer', payload);
                toast.current.show({
                    severity: 'success',
                    summary: 'Thành công',
                    detail: 'Thêm lớp bản đồ thành công'
                });
            }
            setLayerDialog(false);
            fetchMapLayers();
        } catch (error) {
            console.log(error);
            toast.current.show({
                severity: 'error',
                summary: 'Lỗi',
                detail: error.response?.data?.message || 'Có lỗi xảy ra khi lưu dữ liệu'
            });
            
        }
    };

    const deleteApikey = async (id) => {
        try {
            await axios.delete(`/api/admin/delete-apikey/${id}`);

            toast.current.show({
                severity: 'success',
                summary: 'Thành công',
                detail: 'Xóa key bản đồ thành công'
            });

            fetchApikeys();
        } catch (error) {
            console.log(error);
            toast.current.show({
                severity: 'error',
                summary: 'Lỗi',
                detail: error.response?.data?.message || 'Có lỗi xảy ra khi xóa dữ liệu'
            });
        }
        
    };

    const deleteMapSource = async (id) => {
        try {
            await axios.delete(`/api/admin/delete-mapsource/${id}`);

            toast.current.show({
                severity: 'success',
                summary: 'Thành công',
                detail: 'Xóa nguồn bản đồ thành công'
            });

            fetchMapSource();

        } catch (error) {
            console.log(error);
            toast.current.show({
                severity: 'error',
                summary: 'Lỗi',
                detail: error.response?.data?.message || 'Có lỗi xảy ra khi xóa dữ liệu'
            });
        }
    };

    const deleteMapLayer = async (id) => {
        try {
            await axios.delete(`/api/admin/delete-maplayer/${id}`);

            toast.current.show({
                severity: 'success',
                summary: 'Thành công',
                detail: 'Xóa lớp bản đồ thành công'
            });

            fetchMapLayers();

        } catch (error) {
            console.log(error);
            toast.current.show({
                severity: 'error',
                summary: 'Lỗi',
                detail: error.response?.data?.message || 'Có lỗi xảy ra khi xóa dữ liệu'
            });
        }
    };
    return (
        <div className="d-grid p-4 gap-4">
            <Toast ref={toast} />
            <div className="col-12 md:col-6">
                <div className="d-flex justify-content-between items-center mb-2">
                    <h2 className="text-xl font-bold">Mapbox API Keys</h2>
                    <Button label="Thêm" onClick={() => {
                        setApikeyForm(initialFormApikey);
                        setApikeyDialog(true);
                    }} />
                </div>
                <DataTable value={apikeys} stripedRows selectionMode="single" onSelectionChange={e => setSelectedApikey(e.value)}>
                    <Column field="id" header="ID" />
                    <Column field="keyValue" header="Key" />
                    <Column field="description" header="Mô tả" />
                    <Column field="active" header="Kích hoạt" body={row => row.active ? '✔️' : '❌'} />
                    <Column body={(row) => (
                        <div className='action-container-table'>
                            <Button icon="pi pi-pencil" className="p-button-sm mr-2" onClick={() => editApikey(row)} />     
                            <Button icon="pi pi-trash" className="p-button-danger" onClick={() => deleteApikey(row.id)} />
                        </div>
                    )} />
                </DataTable>
            </div>

            <div className="col-12 md:col-6">
                <div className="d-flex justify-content-between items-center mb-2">
                    <h2 className="text-xl font-bold">Map Source</h2>
                    <Button label="Thêm" onClick={() => { setSourceForm(initialFormLayer), setSourceDialog(true); }} />
                </div>
                <DataTable value={mapSources} stripedRows selectionMode="single" onSelectionChange={e => setSelectedSource(e.value)}>
                    <Column field="id" header="ID" />
                    <Column field="name" header="Tên lớp" />
                    <Column field="sourceUrl" header="Nguồn" />
                    <Column field="active" header="Công khai" body={row => row.active ? '✔️' : '❌'} />
                    <Column body={(row) => (
                        <div className='action-container-table'>
                            <Button icon="pi pi-pencil" className="p-button-sm mr-2" onClick={() => editSource(row)} />
                            <Button icon="pi pi-trash" className="p-button-danger" onClick={() => deleteMapSource(row.id)} />
                        </div>
                    )} />
                </DataTable>
            </div>

            <div className="col-12 md:col-6">
                <div className="d-flex justify-content-between align-items-center mb-2">
                    <h2 className="text-xl font-bold">Map Layers</h2>
                    <Button label="Thêm" onClick={() => { setLayerForm(initialFormLayer); setLayerDialog(true); }} />
                </div>

                <Tree
                    value={mapLayers}
                    selectionMode="single"
                    nodeTemplate={(node) => (
                        <div className="d-flex justify-content-between align-items-center w-full">
                            <div>
                                {node.label} {node.isPublic ? '✔️' : '❌'}
                            </div>
                            <div>
                                <Button icon="pi pi-pencil" className="p-button-sm mr-2" onClick={() => editLayer(node)} />
                                <Button icon="pi pi-trash" className="p-button-danger p-button-sm" onClick={() => deleteMapLayer(node.key)} />
                            </div>
                        </div>
                    )}
                />

            </div>


            <Dialog header="API Key" visible={apikeyDialog} style={{ width: '50vw' }} onHide={() => setApikeyDialog(false)}>
                <div className="p-fluid">
                    <label>Key</label>
                    <InputText value={apikeyForm.keyValue} onChange={e => setApikeyForm({ ...apikeyForm, keyValue: e.target.value })} />
                    <label>Mô tả</label>
                    <InputText value={apikeyForm.description} onChange={e => setApikeyForm({ ...apikeyForm, description: e.target.value })} />
                    <label>Kích hoạt</label>
                    <Checkbox checked={apikeyForm.active} onChange={e => setApikeyForm({ ...apikeyForm, active: e.checked })} />
                    <Button label="Lưu" onClick={saveApikey} className="mt-2" />
                </div>
            </Dialog>

            <Dialog header="Map source" visible={sourceDialog} style={{ width: '50vw' }} onHide={() => setSourceDialog(false)}>
                <div className="p-fluid">
                    <label>Tên</label>
                    <InputText value={sourceForm.name} onChange={e => setSourceForm({ ...sourceForm, name: e.target.value })} />
                    <label>Mô tả</label>
                    <InputText value={sourceForm.description} onChange={e => setSourceForm({ ...sourceForm, description: e.target.value })} />
                    <label>Source url</label>
                    <InputText value={sourceForm.sourceUrl} onChange={e => setSourceForm({ ...sourceForm, sourceUrl: e.target.value })} />
                    <label>Bounds</label>
                    <InputText value={sourceForm.bounds} onChange={e => setSourceForm({ ...sourceForm, bounds: e.target.value })} />
                    <label>Scheme</label>
                    <InputText value={sourceForm.scheme} onChange={e => setSourceForm({ ...sourceForm, scheme: e.target.value })} />
                    <label>Source type</label>
                    <InputText value={sourceForm.sourceType} onChange={e => setSourceForm({ ...sourceForm, sourceType: e.target.value })} />
                    <label>API Key mapbox</label>
                    <Dropdown
                        value={sourceForm.apikeyId}
                        options={apikeys.map(a => ({ label: a.keyValue, value: a.id }))}
                        onChange={e => setSourceForm({ ...sourceForm, apikeyId: e.value })}
                        placeholder="Chọn API Key mapbox"
                    />
                    <label className='me-2'>Kích hoạt</label>
                    <Checkbox checked={sourceForm.active} onChange={e => setSourceForm({ ...sourceForm, active: e.checked })} />
                    <Button label="Lưu" onClick={saveMapSource} className="mt-2" />
                </div>
            </Dialog>

            <Dialog header="Map Layer" visible={layerDialog} style={{ width: '50vw' }} onHide={() => setLayerDialog(false)}>
                <div className="p-fluid">
                    <label>Tên lớp</label>
                    <InputText value={layerForm.label} onChange={e => setLayerForm({ ...layerForm, label: e.target.value })} />

                    <label>Mô tả</label>
                    <InputTextarea value={layerForm.description} onChange={e => setLayerForm({ ...layerForm, description: e.target.value })} rows={3} />

                    <label>Lớp cha</label>
                    <TreeSelect 
                        value={layerForm.parentId}
                        options={mapLayers}
                        onChange={e => setLayerForm({ ...layerForm, parentId: e.value })}
                        placeholder="Chọn lớp bản đồ cha"
                    ></TreeSelect>
                    <label>Thứ tự</label>
                    <InputNumber value={layerForm.sortOrder} onChange={e => setLayerForm({ ...layerForm, sortOrder: e.value })} />
                    <div className="field flex align-items-center">
                        <Checkbox inputId="isGroup" checked={layerForm.isGroup} onChange={e => setLayerForm({ ...layerForm, isGroup: e.checked })} />
                        <label htmlFor="isGroup" className="ml-2">Lớp cha</label>
                    </div>

                    <div className="field flex align-items-center">
                        <Checkbox inputId="isPublic" checked={layerForm.isPublic} onChange={e => setLayerForm({ ...layerForm, isPublic: e.checked })} />
                        <label htmlFor="isPublic" className="ml-2">Công khai</label>
                    </div>

                    {!layerForm.isGroup && (
                        <>
                            <label>Lớp nguồn (source-layer)</label>
                            <InputText value={layerForm.sourceLayer} onChange={e => setLayerForm({ ...layerForm, sourceLayer: e.target.value })} />

                            <label>Lọc (filter)</label>
                            <InputText value={layerForm.filter} onChange={e => setLayerForm({ ...layerForm, filter: e.target.value })} />

                            <label>Layout (Layout)</label>
                            <InputText value={layerForm.layout} onChange={e => setLayerForm({ ...layerForm, layout: e.target.value })} />

                            <label>Paint (Paint)</label>
                            <InputText value={layerForm.paint} onChange={e => setLayerForm({ ...layerForm, paint: e.target.value })} />

                            <label>Min zoom</label>
                            <InputNumber value={layerForm.minZoom} onChange={e => setLayerForm({ ...layerForm, minZoom: e.value })} />
                            <label>Max zoom</label>
                            <InputNumber value={layerForm.maxZoom} onChange={e => setLayerForm({ ...layerForm, maxZoom: e.value })} />

                            <label>Lớp thuộc kiểu (layer type)</label>
                            <InputText value={layerForm.layerType} onChange={e => setLayerForm({ ...layerForm, layerType: e.target.value })} />

                            <label>Bản đồ nguồn cho lớp bản đồ</label>
                            <Dropdown
                                value={layerForm.sourceId}
                                options={mapSources.map(a => ({ label: a.name, value: a.id }))}
                                onChange={e => setLayerForm({ ...layerForm, sourceId: e.value })}
                                placeholder="Chọn nguồn bản đồ"
                            />

                            <div className="field flex align-items-center">
                                <Checkbox inputId="visibleDefault" checked={layerForm.visibleByDefault} onChange={e => setLayerForm({ ...layerForm, visibleByDefault: e.checked })} />
                                <label htmlFor="visibleDefault" className="ml-2">Hiện mặc định</label>
                            </div>
                        </>
                    )}
                </div>

                <div className="flex justify-content-end mt-3">
                    <Button label="Hủy" icon="pi pi-times" onClick={() => setLayerDialog(false)} className="p-button-text" />
                    <Button label="Lưu" icon="pi pi-check" onClick={saveMapLayer} className="ml-2" />
                </div>
            </Dialog>
        </div>
    );
};

export default BanDoPage;
