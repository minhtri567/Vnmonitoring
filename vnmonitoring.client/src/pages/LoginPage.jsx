// src/pages/Login/LoginPage.jsx
import React from 'react';
import Login from '../features/auth/Login';
import { useNavigate } from 'react-router-dom';

const LoginPage = () => {
    const navigate = useNavigate();

    const handleLoginSuccess = (user) => {
        localStorage.setItem('token', user.token);
        navigate('/');
    };

    return <Login onLoginSuccess={handleLoginSuccess} />;
};

export default LoginPage;
