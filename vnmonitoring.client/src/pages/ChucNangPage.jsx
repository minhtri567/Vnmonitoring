import React, { useEffect, useState } from 'react';
import api from '../axios/index';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Button } from 'primereact/button';
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext';
import { InputSwitch } from 'primereact/inputswitch';
import { Toast } from 'primereact/toast';
import { ConfirmDialog, confirmDialog } from 'primereact/confirmdialog';
import { Message } from 'primereact/message';

export default function ChucNangPage() {
    const [chucNangList, setChucNangList] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const [visible, setVisible] = useState(false);
    const [selectedFunc, setSelectedFunc] = useState({ fnId: 0, fnTen: '', fnMota: '' });
    const [isEdit, setIsEdit] = useState(false);
    const toast = React.useRef(null);

    const token = localStorage.getItem('token');

    useEffect(() => {
        loadData();
    }, []);

    const loadData = async () => {
        setLoading(true);
        const res = await api.get('/api/Admin/allchucnang')
        if (res.data) {
            setChucNangList(res.data);
            setLoading(false);
        }
    };

    const openNew = () => {
        setSelectedFunc({
            fnId: 0,
            fnTen: '',
            fnMa: '',
            fnUrl: '',
            fnMota: '',
            fnActive: true,
        });
        setIsEdit(false);
        setVisible(true);
    };

    const openEdit = (func) => {
        setSelectedFunc(func);
        setIsEdit(true);
        setVisible(true);
    };

    const hideDialog = () => {
        setVisible(false);
    };

    const saveFunc = () => {
        const method = isEdit ? 'PUT' : 'POST';
        const url = isEdit ? `/api/Admin/updatechucnang/${selectedFunc.fnId}` : '/api/Admin/addchucnang';

        fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(selectedFunc)
        })
            .then(res => {
                if (!res.ok) throw new Error("Lỗi khi lưu chức năng");
                return res.json();
            })
            .then(() => {
                toast.current.show({ severity: 'success', summary: 'Thành công', detail: 'Đã lưu', life: 3000 });
                setVisible(false);
                loadData();
            })
            .catch(() => toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể lưu', life: 3000 }));
    };

    const confirmDelete = (func) => {
        confirmDialog({
            message: 'Bạn có chắc muốn xóa chức năng này?',
            header: 'Xác nhận',
            icon: 'pi pi-exclamation-triangle',
            accept: () => deleteFunc(func),
        });
    };

    const deleteFunc = (func) => {
        fetch(`/api/Admin/deletechucnang/${func.fnId}`, {
            method: 'DELETE',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        })
            .then(res => {
                if (!res.ok) throw new Error("Lỗi khi xóa");
                toast.current.show({ severity: 'success', summary: 'Xóa thành công', detail: '', life: 3000 });
                loadData();
            })
            .catch(() => toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể xóa', life: 3000 }));
    };

    const activeTemplate = (rowData) => (
        rowData.fnActive ? <i className="pi pi-check text-success" /> : <i className="pi pi-times text-danger" />
    );

    const actionBodyTemplate = (rowData) => {
        return (
            <>
                <Button icon="pi pi-pencil" className="p-button-rounded p-button-text" onClick={() => openEdit(rowData)} />
                <Button icon="pi pi-trash" className="p-button-rounded p-button-danger p-button-text" onClick={() => confirmDelete(rowData)} />
            </>
        );
    };

    return (
        <div className="container mt-4">
            <Toast ref={toast} />
            <ConfirmDialog />

            <div className="d-flex justify-content-between mb-3">
                <h2>Danh sách chức năng</h2>
                <Button label="Thêm mới" icon="pi pi-plus" className="p-button-success" onClick={openNew} />
            </div>

            {error && <Message severity="error" text={error} />}
            <DataTable value={chucNangList} loading={loading} paginator rows={10} stripedRows responsiveLayout="scroll">
                <Column field="fnId" header="ID" />
                <Column field="fnTen" header="Tên chức năng" />
                <Column field="fnMa" header="Mã chức năng" />
                <Column field="fnUrl" header="Đường dẫn" />
                <Column field="fnMota" header="Ghi chú" />
                <Column header="Kích hoạt" body={activeTemplate} />
                <Column header="Thao tác" body={actionBodyTemplate} style={{ width: '150px' }} />
            </DataTable>

            <Dialog header={isEdit ? "Sửa chức năng" : "Thêm chức năng"} visible={visible} style={{ width: '400px' }} modal onHide={hideDialog}>
                <div className="field mb-3">
                    <label htmlFor="fnTen" className="form-label">Tên chức năng</label>
                    <InputText id="fnTen" className="form-control"
                        value={selectedFunc.fnTen}
                        onChange={(e) => setSelectedFunc({ ...selectedFunc, fnTen: e.target.value })}
                        autoFocus
                    />
                </div>
                <div className="field mb-3">
                    <label htmlFor="fnMa" className="form-label">Mã chức năng</label>
                    <InputText id="fnMa" className="form-control"
                        value={selectedFunc.fnMa}
                        onChange={(e) => setSelectedFunc({ ...selectedFunc, fnMa: e.target.value })}
                    />
                </div>
                <div className="field mb-3">
                    <label htmlFor="fnUrl" className="form-label">Đường dẫn</label>
                    <InputText id="fnUrl" className="form-control"
                        value={selectedFunc.fnUrl}
                        onChange={(e) => setSelectedFunc({ ...selectedFunc, fnUrl: e.target.value })}
                    />
                </div>
                <div className="field mb-3">
                    <label htmlFor="fnActive" className="form-label">Kích hoạt</label><br />
                    <InputSwitch
                        id="fnActive"
                        checked={selectedFunc.fnActive}
                        onChange={(e) => setSelectedFunc({ ...selectedFunc, fnActive: e.value })}
                    />
                </div>

                <div className="field mb-3">
                    <label htmlFor="fnMota" className="form-label">Ghi chú</label>
                    <InputText id="fnMota" className="form-control"
                        value={selectedFunc.fnMota}
                        onChange={(e) => setSelectedFunc({ ...selectedFunc, fnMota: e.target.value })}
                    />
                </div>

                <div className="d-flex justify-content-end">
                    <Button label="Hủy" icon="pi pi-times" className="p-button-text me-2" onClick={hideDialog} />
                    <Button label="Lưu" icon="pi pi-check" className="p-button-primary" onClick={saveFunc} />
                </div>
            </Dialog>
        </div>
    );
}
