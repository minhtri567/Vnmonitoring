import { useEffect, useState } from "react";
import api from "../axios/index";

const useFetchList = (path, query = {}, config = {}) => {
    const [data, setData] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchAPI = async () => {
            try {
                setLoading(true);
                setError(null);
                const queryString = new URLSearchParams(query).toString();
                const res = await api.get(`${path}${queryString ? `/search?${queryString}` : ''}`, config);
                setData(res.data);
            } catch (err) {
                    setError(err);
                    setData([]);
            } finally {
                setLoading(false);
            }
        };
        fetchAPI();

    }, [path, query, config]);

    return { data, loading, error };
};
export default useFetchList;