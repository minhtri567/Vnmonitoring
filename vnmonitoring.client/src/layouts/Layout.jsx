import React, { useEffect, useState } from 'react';
import { Outlet, useNavigate } from 'react-router-dom';
import { useParams } from 'react-router-dom';
import useFetchList from '../hooks/useFetchList';
import { ProgressSpinner } from 'primereact/progressspinner';
import '@fortawesome/fontawesome-free/css/all.min.css';
import '../assets/css/user.css'
const Layout = () => {
    const navigate = useNavigate();
    const { tinh_seo } = useParams();
    const user = localStorage.getItem('user');
    const [query] = useState({tinh_seo: tinh_seo });
    const [province, setProvince] = useState(null);
    const { data: dataname } = useFetchList('api/Home/get-name-province', query, '');
    useEffect(() => {
        if (dataname.length != 0) {
            setProvince(dataname)
        }
    }, [dataname]);

    const handleLogout = () => {
        localStorage.removeItem('user');
        navigate('/login');
    };

    const handleAdminRedirect = () => {
        navigate('/admin');
    };
    const handleHomeRedirect = () => {
        navigate('/');
    };
    const tabs = [
        { label: 'Tổng quan', path: `/overview/${dataname.tinhSeo}` },
        { label: 'Chi tiết', path: `/detail/${dataname.tinhSeo}` },
        { label: 'Báo cáo', path: `/report/${dataname.tinhSeo}` }
    ];
    return (
        <div>
            {/* Navbar */}
            <nav className="navbar navbar-expand-lg nav-layout">
                <div className="container-fluid">
                    <span className="navbar-brand" onClick={() => handleHomeRedirect() }>Vnmonitoring</span>
                    {province != null && (
                        <span className="name-province">{province.tenTinh}</span>
                    )}
                    <div className="link-vnrain">
                        {tabs.map(tab => (
                            <button
                                key={tab.path}
                                className={location.pathname.startsWith(tab.path) ? 'active' : ''}
                                onClick={() => navigate(tab.path)}
                            >
                                {tab.label}
                            </button>
                        ))}
                    </div>
                    <div className="d-flex align-items-center ms-auto">
                        {/* Nếu user có ít nhất 1 role */}
                        {user && user.role && user.role == true && (
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
                            <button className="btn btn-primary" onClick={handleLogout}>
                                Đăng nhập
                            </button>
                        )}
                        
                    </div>
                </div>
            </nav>

            <div>
                {province ? (
                    <Outlet context={{ province }} />
                ) : (
                    <div className="d-flex center-item justify-content-between">
                        <ProgressSpinner />
                    </div>
                )}
            </div>
        </div>
    );
};

export default Layout;
