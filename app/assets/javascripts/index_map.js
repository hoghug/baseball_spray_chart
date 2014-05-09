var maps_styles_array = [{"stylers":[{"saturation":-100}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#0099dd"}]},{"elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#aadd55"}]},{"featureType":"road.highway","elementType":"labels","stylers":[{"visibility":"on"}]},{"featureType":"road.arterial","elementType":"labels.text","stylers":[{"visibility":"on"}]},{"featureType":"road.local","elementType":"labels.text","stylers":[{"visibility":"on"}]},{}];
var infowindow = null;
var markers = [];

function initializeMap() {
  var mapOptions = {
    panControl: false,
    mapTypeControl: false,
    scaleControl: false,
    streetViewControl: false,
    overviewMapControl: false,
    styles: maps_styles_array,
    zoom: 4,
    center: new google.maps.LatLng(39.50,-98.35)

  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  setMarkers(map, locations);

}


function setMarkers(map, locations) {
  var infowindow = new google.maps.InfoWindow({
    content: "holding..."
  });

  for (var i = 0; i < locations.length; i++) {
    var location = locations[i];

    var latLng = new google.maps.LatLng(location[1], location[2]);
    var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        title: location[0]
    });

    google.maps.event.addListener(marker, 'click', function () {
      infowindow.setContent(this.title);
      infowindow.open(map, this);
      map.setCenter(marker.getPosition());
      map.setZoom(10);
    });

  }
}
