import { useState } from 'react';

export default function useToken() {
    const getToken = () => {
        const tokenString = localStorage.getItem('token');
        return tokenString;
    };

    const [token, setTokenState] = useState(getToken());

    const saveToken = (userToken) => {
        localStorage.setItem('token', userToken);
        setTokenState(userToken);
    };

    const removeToken = () => {
        localStorage.removeItem('token');
        setTokenState(null);
    };

    return {
        token,
        setToken: saveToken,
        removeToken
    };
}
