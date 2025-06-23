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
import { MultiSelect } from 'primereact/multiselect';
const AdminUserPage = () => {

    const [UserList, setUserList] = useState([]);
    const [RoleList, setRoleList] = useState([]);
    const [CoquanList, setCoquanList] = useState([]);
    const [loading, setLoading] = useState(true);
    const [visible, setVisible] = useState(false);
    const [selectedUser, setSelectedUser] = useState({
        memId: null,
        memUsername: '',
        memEmail: '',
        memHoten: '',
        memPassword: '',
        memPasswordConfirm: '',
        memCqId: null,
        memActive: true,
        roleIds: []
    });
    const [isEdit, setIsEdit] = useState(false);
    const toast = React.useRef(null);

    useEffect(() => {
        loadData();
        loadDatauser();
    }, []);

    const loadData = async () => {
        setLoading(true);
        const [resRoles, resCoquan] = await Promise.all([
            api.get('/api/Admin/shortallroles'),
            api.get('/api/Admin/shortallcoquan')
        ]);
        setRoleList(resRoles.data);
        setCoquanList(resCoquan.data);
        setLoading(false);
    };
    const loadDatauser = async () => {
        setLoading(true);
        try {
            const res = await api.get('/api/Admin/all-user');
            setUserList(res.data);
        } catch (error) {
            console.error("Lỗi khi load danh sách người dùng:", error);
        } finally {
            setLoading(false);
        }
    };

    const openNew = () => {
        setSelectedUser({
            memId: null,
            memUsername: '',
            memEmail: '',
            memHoten: '',
            memPassword: '',
            memPasswordConfirm: '',
            memCqId: null,
            memActive: true,
            roleIds: []
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
        const url = isEdit
            ? `/api/Admin/update-user/${selectedUser.memId}`
            : '/api/Admin/create-user';
        if (selectedUser.memPassword != selectedUser.memPasswordConfirm && isEdit == false) {
            toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Mật khẩu ko trùng' });
            return;
        }
        const payload = {
            memUsername: selectedUser.memUsername,
            memPassword: isEdit ? "" : selectedUser.memPassword ,
            memHoten: selectedUser.memHoten,
            memEmail: selectedUser.memEmail,
            memCqId: selectedUser.memCqId?.cqId || null, 
            memActive: selectedUser.memActive,
            roleIds: selectedUser.roleIds ? selectedUser.roleIds.map(r => r.roleId) : "",
        };
        if (isEdit) {
            payload.memId = selectedUser.memId;
        }
        try {
            if (isEdit) {
                await api.put(url, payload);
            } else {
                await api.post(url, payload);
            }
            toast.current.show({ severity: 'success', summary: 'Thành công', detail: isEdit ? "Đã chỉnh sửa người dùng" : 'Đã lưu người dùng' });
            setVisible(false);
            loadDatauser();
        } catch (err) {
            toast.current.show({ severity: 'error', summary: 'Lỗi', detail: 'Không thể lưu' });
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
        api.delete(`/api/Admin/delete-user/${user.memId}`)
            .then(() => {
                toast.current.show({ severity: 'success', summary: 'Xóa thành công', detail: '', life: 3000 });
                loadDatauser();
            })
            .catch((err) => {
                const errorMessage = err.response?.data?.message || 'Không thể xóa người dùng';
                toast.current.show({ severity: 'error', summary: 'Lỗi', detail: errorMessage, life: 3000 });
            });
    };

    const activeTemplate = (rowData) => (
        rowData.memActive ? <i className="pi pi-check text-success" /> : <i className="pi pi-times text-danger" />
    );
    const timedeleteTemplate = (rowData) => (
        rowData.memDeleteAt ? <span>{rowData.memDeleteAt}</span> : <span>Chưa xóa</span>
    );
    const timeupdateTemplate = (rowData) => (
        rowData.memUpdateAt ? <span>{rowData.memUpdateAt}</span> : <span>Chưa sửa</span>
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

          <DataTable className="admin-user-table" scrollable value={UserList} loading={loading} paginator rows={10} stripedRows responsiveLayout="scroll">
              <Column field="memUsername" header="Tên tài khoản" />
              <Column field="memHoten" header="Tên đầy đủ" />
              <Column field="memCreateAt" header="Tạo lúc" />
              <Column header="Chỉnh sửa cuối lúc" body={timeupdateTemplate} />
              <Column field="memUpdateBy" header="Sửa bởi" />
              <Column field="memLastloginAt" header="Lần đăng nhập cuối lúc" />
              <Column header="Xóa lúc" body={timedeleteTemplate} />
              <Column field="memDeleteBy" header="Xóa bởi" />
              <Column field="memEmail" header="Email" />
              <Column header="Kích hoạt" body={activeTemplate} />
              <Column frozen alignFrozen="right" header="Thao tác" body={actionBodyTemplate}  />
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
              {!isEdit && (
                  <>
                      <div className="field mb-3">
                          <label htmlFor="mempassword" className="form-label">Mật khẩu mới</label>
                          <InputText id="mempassword" className="form-control"
                              type="password"
                              value={selectedUser.memPassword || ''}
                              onChange={(e) => setSelectedUser({ ...selectedUser, memPassword: e.target.value })}
                          />
                      </div>
                      <div className="field mb-3">
                          <label htmlFor="mempasswordcofirm" className="form-label">Nhập mật khẩu mới</label>
                          <InputText id="mempasswordcofirm" className="form-control"
                              type="password"
                              value={selectedUser.memPasswordConfirm || ''}
                              onChange={(e) => setSelectedUser({ ...selectedUser, memPasswordConfirm: e.target.value })}
                          />
                      </div>
                  </>
              )}


              <div className="field mb-3">
                  <label htmlFor="memEmail" className="form-label">Nhập email</label>
                  <InputText id="memEmail" className="form-control"
                      type="email"
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
                  <label htmlFor="dd-memroleid">Chọn quyền</label>
                  <br></br>

                    <MultiSelect value={selectedUser.roleIds}
                      onChange={(e) => setSelectedUser({ ...selectedUser, roleIds: e.value })}
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