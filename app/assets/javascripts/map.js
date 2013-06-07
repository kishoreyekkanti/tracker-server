$(function () {
if($('#index').length > 0){
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
	                console.log(item)
	                if(item.tracks.length > 0)
	                    Map.mark_it(item.tracks[0].latitude, item.tracks[0].longitude, item.driver_name, item.mobile_number, item.tracks[0].updated_at, item.imei)
	            });
	        });
	    },

	    mark_it: function (lat, lng, driver_name, mobile_number, last_located_at, imei) {
	        var marker = new L.Marker(new L.LatLng(lat, lng), { title: "Tracker", singleMarkerMode: false });
	        var popupContent = "<p>Driver Name : "+driver_name+" </p>" + "<p>Mobile Number : "+mobile_number+" </p>" + "<p>Last Located Time : "+last_located_at+"</p>"
			popupContent = popupContent + "<a href=/home/route/" + imei + ">Details,...</a>";
	        console.log(popupContent);
	        this.markers.bindPopup(popupContent);
	        this.markers.addLayer(marker);
	    }
	}	
    Map.tracker_details();
}else{
	var Map = {
	    route_details: function () {
	        this.map = new L.Map('map');
	        this.markers = new L.MarkerClusterGroup();

	        var hull = new L.LatLng(12.9, 80.2);
	        var osmUrl = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
	        var osmAttrib = 'Map data © openstreetmap contributors';
	        var osm = new L.TileLayer(osmUrl, {minZoom: 1, maxZoom: 18, attribution: osmAttrib});

	        this.map.setView(hull, 11);
	        this.map.addLayer(osm);
	        var _this = this;
			
			$.getJSON(gps_tracker_url, function (result) {
				var coordinates = [];
			    $.each(result, function (i, item) {
			        console.log(item)
					coordinates.push(new L.LatLng(item['latitude'], item['longitude']));
				});
				var polyLine = L.polyline(coordinates, {color : 'red'}).addTo(_this.map);            
			});
	    }
	}
	
    Map.route_details();	
}
});



