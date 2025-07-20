import React, { useEffect, useState } from 'react';
import { Routes, Route } from 'react-router-dom';
import { Suspense } from 'react';
import api from '../axios/index';
const AdminRouter = () => {
    const [routes, setRoutes] = useState([]);

    useEffect(() => {
        const fetchdata = async () => {
            const res = await api.get('/api/Admin/chucnang');
            if (res.data) {
                setRoutes(res.data);
            }
        };
        fetchdata();
    }, []);

    const componentMap = {
        ChucNangPage: React.lazy(() => import('../pages/ChucNangPage')),
        menupage: React.lazy(() => import('../pages/MenuPage')),
        BanDoPage: React.lazy(() => import('../pages/BanDoPage')),
        AdminUserPage: React.lazy(() => import('../pages/AdminUserPage')),
        AdminStationPage: React.lazy(() => import('../pages/AdminStationPage')),
        AdminMonitoringDataPage: React.lazy(() => import('../pages/AdminMonitoringDataPage')),
    };

    return (
        <Suspense fallback={<div>Đang tải trang admin...</div>}>
            <Routes>
                {routes.map((route, idx) => {
                    const Component = componentMap[route.fnMa];
                    if (!Component) return null;
                    return (
                        <Route key={idx} path={route.fnUrl} element={<Component />} />
                    );
                })}
            </Routes>
        </Suspense>
    );
};

export default AdminRouter;
