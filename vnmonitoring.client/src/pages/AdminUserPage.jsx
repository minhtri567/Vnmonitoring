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
import { Dropdown } from 'primereact/dropdown';
import { MultiSelect } from 'primereact/multiSelect';
const AdminUserPage = () => {

    const [UserList, setUserList] = useState([]);
    const [RoleList, setRoleList] = useState([]);
    const [CoquanList, setCoquanList] = useState([]);
    const [loading, setLoading] = useState(true);
    const [visible, setVisible] = useState(false);
    const [selectedUser, setSelectedUser] = useState({ memId: 0, memUsername: '', memEmail: '', memHoten: '', mempassword: '', mempasswordcofirm: '', memCqId: '' , memroleid:'' , memActive:true  });
    const [isEdit, setIsEdit] = useState(false);
    const toast = React.useRef(null);

    useEffect(() => {
        loadData();
    }, []);

    const loadData = async () => {
        setLoading(true);
        const res = await api.get('/api/Admin/all-user');
        if (res.data) {
            console.log(res.data);
            setUserList(res.data);
            setLoading(false);
        }
        const datarole = await api.get('/api/Admin/shortallroles');
        if (datarole.data) {
            setRoleList(datarole.data);
            console.log(datarole.data);
            setLoading(false);
        }

        const datacq = await api.get('/api/Admin/shortallcoquan');
        if (datacq.data) {
            setCoquanList(datacq.data);
            console.log(datacq.data);
            setLoading(false);
        }
    };

    const openNew = () => {
        setSelectedUser({
            memId: 0,
            memUsername: '',
            memEmail: '',
            memHoten: '',
            memCqId: '',
            memActive: true,
        });
        setIsEdit(false);
        setVisible(true);
    };

    const openEdit = (data) => {
        setSelectedUser(data);
        setIsEdit(true);
        setVisible(true);
    };

    const hideDialog = () => {
        setVisible(false);
    };

    const saveFunc = async () => {
        const method = isEdit ? 'PUT' : 'POST';
        const url = isEdit ? `/api/Admin/update-user/${selectedUser.fnId}` : '/api/Admin/create-user';

        try {
            const response = await api({
                method,
                url,
                data: selectedUser,
            });
            console.log(response);
            toast.current.show({ severity: 'success', summary: 'Thành công', detail: 'Đã lưu', life: 3000 });
            setVisible(false);
            loadData();
        } catch (error) {
            toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể lưu', life: 3000 });
        }

    };

    const confirmDelete = (data) => {
        confirmDialog({
            message: 'Bạn có chắc muốn xóa người dùng này?',
            header: 'Xác nhận',
            icon: 'pi pi-exclamation-triangle',
            accept: () => deleteFunc(data),
        });
    };

    const deleteFunc = (user) => {
        api.delete(`/api/Admin/delete-user/${user.Id}`)
            .then(() => {
                toast.current.show({ severity: 'success', summary: 'Xóa thành công', detail: '', life: 3000 });
                loadData();
            })
            .catch(() => {
                toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể xóa', life: 3000 });
            });
    };

    const activeTemplate = (rowData) => (
        rowData.memActive ? <i className="pi pi-check text-success" /> : <i className="pi pi-times text-danger" />
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
              <h2>Danh sách người dùng</h2>
              <Button label="Thêm mới" icon="pi pi-plus" className="p-button-success" onClick={openNew} />
          </div>

          <DataTable value={UserList} loading={loading} paginator rows={10} stripedRows responsiveLayout="scroll">
              <Column field="memId" header="ID" />
              <Column field="memUsername" header="Tên tài khoản" />
              <Column field="memHoten" header="Tên đầy đủ" />
              <Column field="memEmail" header="Email" />
              <Column header="Kích hoạt" body={activeTemplate} />
              <Column header="Thao tác" body={actionBodyTemplate} style={{ width: '150px' }} />
          </DataTable>

          <Dialog header={isEdit ? "Sửa người dùng" : "Thêm người dùng"} visible={visible} style={{ width: '50%' }} modal onHide={hideDialog}>
              <div className="field mb-3">
                  <label htmlFor="memUsername" className="form-label">Tên người dùng</label>
                  <InputText id="memUsername" className="form-control"
                      value={selectedUser.memUsername}
                      onChange={(e) => setSelectedUser({ ...selectedUser, memUsername: e.target.value })}
                      autoFocus
                  />
              </div>
              <div className="field mb-3">
                  <label htmlFor="memHoten" className="form-label">Tên đầy đủ người dùng</label>
                  <InputText id="memHoten" className="form-control"
                      value={selectedUser.memHoten}
                      onChange={(e) => setSelectedUser({ ...selectedUser, memHoten: e.target.value })}
                  />
              </div>
              <div className="field mb-3">
                  <label htmlFor="mempassword" className="form-label">Mật khẩu mới</label>
                  <InputText id="mempassword" className="form-control"
                      value={selectedUser.mempassword}
                      onChange={(e) => setSelectedUser({ ...selectedUser, mempassword: e.target.value })}
                  />
              </div>
              <div className="field mb-3">
                  <label htmlFor="mempasswordcofirm" className="form-label">Nhập mật khẩu mới</label>
                  <InputText id="mempasswordcofirm" className="form-control"
                      value={selectedUser.mempasswordcofirm}
                      onChange={(e) => setSelectedUser({ ...selectedUser, mempasswordcofirm: e.target.value })}
                  />
              </div>

              <div className="field mb-3">
                  <label htmlFor="memEmail" className="form-label">Nhập email</label>
                  <InputText id="memEmail" className="form-control"
                      value={selectedUser.memEmail}
                      onChange={(e) => setSelectedUser({ ...selectedUser, memEmail: e.target.value })}
                  />
              </div>

              <div className="field mb-3">
                  <label htmlFor="memCqId" className="form-label">Thuộc cơ quan</label>
                  <br></br>
                  <Dropdown value={selectedUser.memCqId}
                      onChange={(e) => setSelectedUser({ ...selectedUser, memCqId: e.target.value })}
                      options={[
                          ...CoquanList.map(station => ({
                              cqTen: station.cqTen,
                              cqId: station.cqId
                          }))
                      ]}
                      style={{ width: '100%' }}
                      inputId="memCqId"
                      optionLabel="cqTen"
                      placeholder="Chọn trạm đo mưa"
                      filter />
              </div>
              <div className="field mb-3">
                  <label htmlFor="dd-memroleid">Chọn trạm đo</label>
                  <br></br>

                    <MultiSelect value={selectedUser.memroleid}
                        onChange={(e) => setSelectedUser({ ...selectedUser, memroleid: e.value })}
                        options={RoleList}
                        name="roleTen"
                        inputId="dd-memroleid"
                        maxSelectedLabels={3}
                        style={{ width: '100%' }}
                        optionLabel="roleTen"
                        selectedItemsLabel="Đã chọn {0} quyền"
                        placeholder="Chọn quyền"
                        filter />
              </div>
              <div className="field mb-3">
                  <label htmlFor="memActive" className="form-label">Kích hoạt</label><br />
                  <InputSwitch
                      id="memActive"
                      checked={selectedUser.memActive}
                      onChange={(e) => setSelectedUser({ ...selectedUser, memActive: e.value })}
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

export default AdminUserPage;