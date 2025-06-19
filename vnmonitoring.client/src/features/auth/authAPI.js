// src/features/auth/authAPI.js
import axios from 'axios';
export const loginUser = async ({ username, password }) => {
    const response = await axios.post("/api/Auth/login", {
        username,
        password
    });

    if (response.status !== 200) {
        throw new Error('Login failed');
    }

    return response.data;
};
