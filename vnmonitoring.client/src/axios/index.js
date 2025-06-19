import axios from "axios";

const tokenString = localStorage.getItem('token');

const api = axios.create({
    baseURL: "https://localhost:7101/",
    headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${tokenString}`,
    },
});

export default api;