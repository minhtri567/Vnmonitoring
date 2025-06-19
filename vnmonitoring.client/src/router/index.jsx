import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

import 'bootstrap/dist/css/bootstrap.min.css';
import AdminLayout from '../layouts/AdminLayout';
import Layout from '../layouts/Layout';
import LoginPage from '../pages/LoginPage';
import HomePage from '../pages/HomePage';
import AdminPage from '../pages/AdminPage';
import OverviewPage from '../pages/OverviewPage';
import DetailPage from '../pages/DetailPage';
import ReportPage from '../pages/ReportPage';
import PrivateRoute from './PrivateRoute';

export default function AppRouter() {

    return (
        <BrowserRouter>
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
                </Route>
            </Routes>
        </BrowserRouter>
    );
}