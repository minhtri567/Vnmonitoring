import React, { lazy, Suspense } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

import 'bootstrap/dist/css/bootstrap.min.css';
import AdminLayout from '../layouts/AdminLayout';
import Layout from '../layouts/Layout';
const LoginPage = lazy(() => import('../pages/LoginPage'));
const HomePage = lazy(() => import('../pages/HomePage'));
const OverviewPage = lazy(() => import('../pages/OverviewPage'));
const DetailPage = lazy(() => import('../pages/DetailPage'));
const ReportPage = lazy(() => import('../pages/ReportPage'));
const AdminPage = lazy(() => import('../pages/AdminPage'));
const AdminMonitoringDataPage = lazy(() => import('../pages/AdminMonitoringDataPage'));
const NotFoundPage = lazy(() => import('../pages/NotFoundPage'));
import PrivateRoute from './PrivateRoute';
import AdminRouter from './AdminRouter'
export default function AppRouter() {
    return (
        <BrowserRouter>
            <Suspense fallback={<div className="text-center mt-5">Đang tải...</div>}>
                <Routes>
                    <Route path="/" element={<HomePage />} />
                    <Route path="/login" element={<LoginPage />} />
                    <Route element={<Layout />}>
                        <Route path="/overview/:tinh_seo" element={<OverviewPage />} />
                        <Route path="/detail/:tinh_seo" element={<DetailPage />} />
                        <Route path="/report/:tinh_seo" element={<ReportPage />} />
                    </Route>
                    <Route element={<AdminLayout />}>
                        <Route path="/admin" element={
                            <PrivateRoute>
                                <AdminPage />
                            </PrivateRoute>
                        } />
                        <Route path="*" element={<AdminRouter />} />
                    </Route>

                </Routes>
            </Suspense>
        </BrowserRouter>
    );
}
