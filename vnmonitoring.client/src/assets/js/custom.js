const Custom = {
    addVietnamIslandsMarkers: function (map) {
        map.loadImage(
            '/vietnam.png',
            (error, image) => {
                if (error) throw error;
                if (!image) return;

                if (!map.hasImage('vn-logo')) {
                    map.addImage('vn-logo', image);
                }

                map.addSource('vn-islands', {
                    type: 'geojson',
                    data: {
                        type: 'FeatureCollection',
                        features: [
                            {
                                type: 'Feature',
                                geometry: {
                                    type: 'Point',
                                    coordinates: [112.60, 17.5333], 
                                },
                                properties: {
                                    title: 'QĐ. Hoàng Sa',
                                },
                            },
                            {
                                type: 'Feature',
                                geometry: {
                                    type: 'Point',
                                    coordinates: [115.13, 11],
                                },
                                properties: {
                                    title: 'QĐ. Trường Sa',
                                },
                            },
                        ],
                    },
                });

                map.addLayer({
                    id: 'vn-islands-layer',
                    type: 'symbol',
                    source: 'vn-islands',
                    layout: {
                        'icon-image': 'vn-logo',
                        'icon-size': 0.5,
                        'icon-allow-overlap': true,
                        'text-field': ['get', 'title'],
                        'text-offset': [0, 1],
                        'text-anchor': 'top',
                        'text-font': ['Open Sans Bold', 'Arial Unicode MS Bold'],
                        'text-size': 11,
                    },
                    paint: {
                        'text-color': '#d32f2f',
                    },
                });
            }
        );
    },
};

export default Custom;
