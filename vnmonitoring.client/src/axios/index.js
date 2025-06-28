import axios from "axios";

const tokenString = localStorage.getItem('token');
const url = import.meta.env.VITE_API_URL;
const api = axios.create({
    baseURL: url,
    headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${tokenString}`,
    },
});

export default api;