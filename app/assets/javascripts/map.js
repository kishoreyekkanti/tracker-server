$(function () {
    Map.tracker_details();
});


var Map = {
    tracker_details: function () {
        this.map = new L.Map('map');
        this.markers = new L.MarkerClusterGroup();

        var hull = new L.LatLng(13.8, 77);
        var osmUrl = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
        var osmAttrib = 'Map data © openstreetmap contributors';
        var osm = new L.TileLayer(osmUrl, {minZoom: 1, maxZoom: 18, attribution: osmAttrib});

        this.map.setView(hull, 8);
        this.map.addLayer(osm);
        this.map.addLayer(this.markers);

        $.getJSON(tracker_index_url, function (result) {
            $.each(result, function (i, item) {
                track_length = item.tracks.length;
                if(track_length > 0)
                    Map.mark_it(item.tracks[track_length - 1].latitude, item.tracks[track_length - 1].longitude, item.driver_name, item.mobile_number, item.tracks[track_length - 1].updated_at)
            });
        });
    },

    mark_it: function (lat, lng, driver_name, mobile_number, last_located_at) {
        var marker = new L.Marker(new L.LatLng(lat, lng), { title: "Tracker", singleMarkerMode: false });
        var popupContent = "<p>Driver Name : "+driver_name+" </p>" + "<p>Mobile Number : "+mobile_number+" </p>" + "<p>Last Located Time : "+last_located_at+"</p>";
        console.log(popupContent);
        marker.bindPopup(popupContent);
        this.markers.addLayer(marker);
    }
}