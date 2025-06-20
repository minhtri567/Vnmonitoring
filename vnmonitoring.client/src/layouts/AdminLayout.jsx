import React, { useEffect, useState } from 'react';
import api from '../axios/index';
import { Outlet, useNavigate } from 'react-router-dom';
import AdminMenu from '../components/AdminMenu';
import 'bootstrap/dist/css/bootstrap.min.css';

export default function AdminLayout() {
    const [menuData, setMenuData] = useState([]);
    const [showSidebar, setShowSidebar] = useState(false);

    const navigate = useNavigate();

    const handleLogout = () => {
        localStorage.removeItem('user');
        navigate('/login');
    };

    const toggleSidebar = () => {
        setShowSidebar(!showSidebar);
    };
    function isJwtExpired(token) {
        if (!token) return true;
        const payload = JSON.parse(atob(token.split('.')[1]));
        const exp = payload.exp;
        const now = Math.floor(Date.now() / 1000);
        return exp < now;
    }
    useEffect(() => {
        var token = localStorage.getItem("token");
        if (isJwtExpired(token)) {
            localStorage.removeItem('token');
            localStorage.removeItem('user');
            navigate('/login');
        }
    }, [navigate]);

    useEffect(() => {
        const fetchdata = async () => {
            const res = await api.get('/api/admin/menu');
            if (res.data) {
                setMenuData(res.data);
            }
        };
        fetchdata();
    }, []);

    const handleHomeRedirect = () => {
        navigate('/');
    };
    const handleadminRedirect = () => {
        navigate('/admin');
    };
    return (
        <div>
            <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
                <div className="container-fluid">
                    <button className="btn btn-dark me-2" onClick={toggleSidebar}>
                        <i className="fas fa-bars"></i> {/* Font Awesome icon */}
                    </button>
                    <span className="navbar-brand" onClick={() => handleadminRedirect() }>Admin Dashboard</span>
                    <div className="d-flex align-items-center ms-auto">
                        <button
                            className="btn btn-outline-secondary me-2"
                            title="Trang chủ"
                            onClick={handleHomeRedirect}
                        >
                            <i className="fas fa-home"></i>
                        </button>
                        <span className="me-3 text-white fw-bold">
                            {JSON.parse(localStorage.getItem('user'))?.username}
                        </span>
                        <button className="btn btn-outline-light" onClick={handleLogout}>
                            Đăng xuất
                        </button>
                    </div>
                </div>
            </nav>
            <div
                className={`offcanvas offcanvas-start ${showSidebar ? 'show' : ''}`}
                style={{
                    visibility: showSidebar ? 'visible' : 'hidden',
                    transition: 'transform 0.3s ease-in-out',
                    transform: showSidebar ? 'translateX(0)' : 'translateX(-100%)'
                }}
                tabIndex="-1"
            >
                <div className="offcanvas-header">
                    <h5 className="offcanvas-title">Menu quản trị</h5>
                    <button type="button" className="btn-close text-reset" onClick={toggleSidebar}></button>
                </div>
                <div className="offcanvas-body">
                    <AdminMenu menuData={menuData} onMenuSelect={() => setShowSidebar(false)} />
                </div>
            </div>

            <div className="container mt-3">
                <Outlet />
            </div>
        </div>
    );
}
