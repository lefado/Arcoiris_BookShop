/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(28.65744, -17.90384),
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false,
        draggable: true,
        panControl: true,
        zoomControl: true,
        mapTypeControl: true,
        scaleControl: true,
        streetViewControl: true,
        overviewMapControl: true,
        rotateControl: true
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    //Add marker to the map
    var marker = new google.maps.Marker({
        position: {lat: 28.65744, lng: -17.90384},
        map: map      
    });

}
google.maps.event.addDomListener(window, 'load', initialize);
