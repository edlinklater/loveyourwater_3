(function($) {

    var location = $('#eventLocationMap').data('geometry');
    location = location.replace(/\'/g, '"');
    var geojsonFeature = JSON.parse(location);

    var map = L.map('eventLocationMap').setView([-40.866119, 174.143780], 5);

    L.tileLayer('//{s}.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}.png', {
        attribution: 'ESRI, OpenStreetMap',
        subdomains: [
            'server',
            'services'
        ],
        maxZoom: 18
    }).addTo(map);

    var layer = L.geoJson(geojsonFeature).addTo(map);
    var bounds = layer.getBounds();
    map.fitBounds(bounds, {padding: [20, 20]});

}(jQuery));