import React, { useEffect, useState, useRef } from 'react';
import { Button } from 'primereact/button';
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext';
import { Toast } from 'primereact/toast';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Dropdown } from 'primereact/dropdown';
import useToken from '../hooks/useToken';

export default function MenuPage() {
    const { token } = useToken();
    const [danhmuc, setDanhmuc] = useState([]);
    const [phanloai, setPhanloai] = useState([]);
    const [chucnang, setchucnang] = useState([]);
    const [selected, setSelected] = useState({});
    const [visible, setVisible] = useState(false);
    const [isEdit, setIsEdit] = useState(false);

    const [selectedPhanloai, setSelectedPhanloai] = useState({});
    const [visiblePhanloai, setVisiblePhanloai] = useState(false);
    const [isEditPhanloai, setIsEditPhanloai] = useState(false);

    const toast = useRef(null);

    useEffect(() => {
    }, [selected]);

    useEffect(() => {
        fetchDanhmuc();
        fetchPhanloai();
        fetchChucnang();
    }, []);

    const fetchDanhmuc = () => {
        fetch('/api/admin/alldanhmuc', {
            headers: { 'Authorization': `Bearer ${token}` }
        })
            .then(res => res.json())
            .then(data => setDanhmuc(data));
    };

    const fetchPhanloai = () => {
        fetch('/api/admin/allphanloai', {
            headers: { 'Authorization': `Bearer ${token}` }
        })
            .then(res => res.json())
            .then(data => setPhanloai(data));
    };
    const fetchChucnang = () => {
        fetch('/api/Admin/allchucnang', {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        })
            .then(res => res.json())
            .then(data => {
                setchucnang(data);
            });
    };

    const openNew = () => {
        setSelected({ dmId: 0, dmTen: '', dmMa: '', dmMota: '', dmStt: 1, dmLdmId : null});
        setIsEdit(false);
        setVisible(true);
    };

    const openEdit = (row) => {
        setSelected({ ...row });
        setIsEdit(true);
        setVisible(true);
    };

    const saveDanhmuc = () => {
        const method = isEdit ? 'PUT' : 'POST';
        const url = isEdit ? `/api/admin/updatedanhmuc/${selected.dmId}` : '/api/admin/adddanhmuc';

        fetch(url, {
            method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(selected)
        })
            .then(res => res.json())
            .then(() => {
                toast.current.show({ severity: 'success', summary: 'Thành công', detail: 'Đã lưu danh mục' });
                setVisible(false);
                fetchDanhmuc();
            });
    };

    const deleteDanhmuc = (id) => {
        fetch(`/api/admin/deletedanhmuc/${id}`, {
            method: 'DELETE',
            headers: { 'Authorization': `Bearer ${token}` }
        })
            .then(() => {
                toast.current.show({ severity: 'success', summary: 'Đã xóa', detail: 'Danh mục đã được xóa' });
                fetchDanhmuc();
            });
    };

    const openNewPhanloai = () => {
        setSelectedPhanloai({ ldmId: 0, ldmTen: '', ldmMa: '', ldmMota: '', ldmPid: null, ldmStt: 1, ldmUrl: '' });
        setIsEditPhanloai(false);
        setVisiblePhanloai(true);
    };

    const openEditPhanloai = (row) => {
        setSelectedPhanloai({ ...row });
        setIsEditPhanloai(true);
        setVisiblePhanloai(true);
    };

    const savePhanloai = () => {
        const method = isEditPhanloai ? 'PUT' : 'POST';
        const url = isEditPhanloai ? `/api/admin/updatephanloai/${selectedPhanloai.ldmId}` : '/api/admin/addphanloai';

        fetch(url, {
            method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(selectedPhanloai)
        })
        .then(() => {
            toast.current.show({ severity: 'success', summary: 'Thành công', detail: 'Đã lưu phân loại' });
            setVisiblePhanloai(false);
            fetchPhanloai();
        });
    };

    const deletePhanloai = (id) => {
        fetch(`/api/admin/deletephanloai/${id}`, {
            method: 'DELETE',
            headers: { 'Authorization': `Bearer ${token}` }
        })
            .then(() => {
                toast.current.show({ severity: 'success', summary: 'Đã xóa', detail: 'Phân loại đã được xóa' });
                fetchPhanloai();
            });
    };

    const actionBody = (rowData) => (
        <div className="d-flex gap-2">
            <Button icon="pi pi-pencil" className="p-button-sm p-button-text" onClick={() => openEdit(rowData)} />
            <Button icon="pi pi-trash" className="p-button-sm p-button-danger p-button-text" onClick={() => deleteDanhmuc(rowData.dmId)} />
        </div>
    );

    const actionBodyphanloai = (rowData) => (
        <div className="d-flex gap-2">
            <Button icon="pi pi-pencil" className="p-button-sm p-button-text" onClick={() => openEditPhanloai(rowData)} />
            <Button icon="pi pi-trash" className="p-button-sm p-button-danger p-button-text" onClick={() => deletePhanloai(rowData.ldmId)} />
        </div>
    );
    const headerdanhmuc = (
        <div className="d-flex justify-content-between mb-2">
            <h5>Danh sách danh mục</h5>
            <Button label="Thêm mới" icon="pi pi-plus" size="small" onClick={openNew} />
        </div>
    );
    const headerphanloai = (
        <div className="d-flex justify-content-between mb-2">
            <h5>Danh sách loại danh mục</h5>
            <Button label="Thêm mới" icon="pi pi-plus" size="small" onClick={openNewPhanloai} />
        </div>
    );
    return (
        <div className="container mt-4">
            <Toast ref={toast} />

            
            <div className="d-flex gap-4">
                
                <DataTable value={danhmuc} stripedRows header={headerdanhmuc} paginator rows={10} className="mb-4 admin-two-table" >
                    <Column field="dmStt" header="STT" />
                    <Column field="dmTen" header="Tên" />
                    <Column field="dmMa" header="Mã" />
                    <Column field="dmMota" header="Mô tả" />
                    <Column body={actionBody} header="Thao tác" />
                </DataTable>

                <DataTable value={phanloai} stripedRows header={headerphanloai} paginator rows={10} className="mb-4 admin-two-table">
                    <Column field="ldmStt" header="STT" />
                    <Column field="ldmTen" header="Tên" />
                    <Column field="ldmMa" header="Mã" />
                    <Column field="ldmMota" header="Mô tả" />
                    <Column body={actionBodyphanloai} header="Thao tác" />
                </DataTable>
            </div>
            <Dialog header={isEdit ? 'Sửa danh mục' : 'Thêm danh mục'} visible={visible} style={{ width: '400px' }} modal onHide={() => setVisible(false)}>
                <div className="mb-3">
                    <label>Tên</label>
                    <InputText className="form-control" value={selected.dmTen} onChange={e => setSelected({ ...selected, dmTen: e.target.value })} />
                </div>
                <div className="mb-3">
                    <label>Danh mục cha</label>
                    <Dropdown
                        className="w-100"
                        value={selected.dmLdmId || null}
                        options={phanloai}
                        optionLabel="ldmTen"
                        optionValue="ldmId"
                        onChange={(e) => setSelected({ ...selected, dmLdmId: e.value })}
                        placeholder="Chọn danh mục cha"
                    />
                </div>
                <div className="mb-3">
                    <label>Hàm liên kết</label>
                    <Dropdown
                        className="w-100"
                        value={selected.functionid || null}
                        options={chucnang}
                        optionLabel="fnTen"
                        optionValue="fnId"
                        onChange={(e) => setSelected({ ...selected, functionid: e.value })}
                        placeholder="Chọn danh mục cha"
                    />
                </div>
                <div className="mb-3">
                    <label>Mã</label>
                    <InputText className="form-control" value={selected.dmMa} onChange={e => setSelected({ ...selected, dmMa: e.target.value })} />
                </div>
                <div className="mb-3">
                    <label>Mô tả</label>
                    <InputText className="form-control" value={selected.dmMota} onChange={e => setSelected({ ...selected, dmMota: e.target.value })} />
                </div>
                <div className="mb-3">
                    <label>STT</label>
                    <InputText className="form-control" value={selected.dmStt} onChange={e => setSelected({ ...selected, dmStt: parseInt(e.target.value) || 1 })} />
                </div>
                <div className="d-flex justify-content-end">
                    <Button label="Hủy" icon="pi pi-times" className="p-button-text me-2" onClick={() => setVisible(false)} />
                    <Button label="Lưu" icon="pi pi-check" className="p-button-primary" onClick={saveDanhmuc} />
                </div>
            </Dialog>

            <Dialog header={isEditPhanloai ? 'Sửa phân loại' : 'Thêm phân loại'} visible={visiblePhanloai} style={{ width: '400px' }} modal onHide={() => setVisiblePhanloai(false)}>
                <div className="mb-3">
                    <label>Tên</label>
                    <InputText className="form-control" value={selectedPhanloai.ldmTen} onChange={e => setSelectedPhanloai({ ...selectedPhanloai, ldmTen: e.target.value })} />
                </div>
                <div className="mb-3">
                    <label>Mã</label>
                    <InputText className="form-control" value={selectedPhanloai.ldmMa} onChange={e => setSelectedPhanloai({ ...selectedPhanloai, ldmMa: e.target.value })} />
                </div>
                <div className="mb-3">
                    <label>Mô tả</label>
                    <InputText className="form-control" value={selectedPhanloai.ldmMota} onChange={e => setSelectedPhanloai({ ...selectedPhanloai, ldmMota: e.target.value })} />
                </div>
                <div className="mb-3">
                    <label>Parent ID</label>
                    <InputText className="form-control" value={selectedPhanloai.ldmPid || ''} onChange={e => setSelectedPhanloai({ ...selectedPhanloai, ldmPid: parseInt(e.target.value) || null })} />
                </div>
                <div className="mb-3">
                    <label>STT</label>
                    <InputText className="form-control" value={selectedPhanloai.ldmStt || ''} onChange={e => setSelectedPhanloai({ ...selectedPhanloai, ldmStt: parseInt(e.target.value) || 1 })} />
                </div>
                <div className="mb-3">
                    <label>URL</label>
                    <InputText className="form-control" value={selectedPhanloai.ldmUrl} onChange={e => setSelectedPhanloai({ ...selectedPhanloai, ldmUrl: e.target.value })} />
                </div>
                <div className="d-flex justify-content-end">
                    <Button label="Hủy" icon="pi pi-times" className="p-button-text me-2" onClick={() => setVisiblePhanloai(false)} />
                    <Button label="Lưu" icon="pi pi-check" className="p-button-primary" onClick={savePhanloai} />
                </div>
            </Dialog>
        </div>
    );
}
