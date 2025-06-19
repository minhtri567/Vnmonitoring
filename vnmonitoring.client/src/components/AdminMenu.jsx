import React, { useEffect, useState } from 'react';
import { Tree } from 'primereact/tree';
import 'primereact/resources/themes/lara-light-blue/theme.css';
import 'primereact/resources/primereact.min.css';
import 'primeicons/primeicons.css';
import '../assets/css/admin.css';
import { useNavigate } from 'react-router-dom';
const AdminMenu = ({ menuData, onMenuSelect }) => {
    const [nodes, setNodes] = useState([]);
    const navigate = useNavigate();
    useEffect(() => {
        if (menuData && menuData.length > 0) {
            const buildTree = (list, parentId = null) => {
                return list
                    .filter(item => item.dmPid === parentId)
                    .sort((a, b) => a.dmStt - b.dmStt)
                    .map(item => ({
                        key: item.dmId.toString(),
                        label: item.dmTen,
                        icon: item.dmIconUrl || 'pi pi-folder',
                        data: item.fnUrl,
                        children: buildTree(list, item.dmId)
                    }));
            };

            const tree = buildTree(menuData);
            setNodes(tree);
        }
    }, [menuData]);

    const onNodeSelect = (e) => {
        const url = e.node.data;
        if (url) {
            if (onMenuSelect) onMenuSelect();
            navigate(url);
        }
    };

    return (
        <Tree filter filterMode="lenient" filterPlaceholder="Tìm kiếm" value={nodes} selectionMode="single" onSelect={onNodeSelect} />
    );
};

export default AdminMenu;
