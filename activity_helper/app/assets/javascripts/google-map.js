$(document).ready(function(){
    var length = $(".map-canvas").length;
    var l = 1;
    while(l <= length)
    {
        initialize(l);
        l = l + 1;
    }
});


function initialize(i) {
    var llat = $(document.getElementsByClassName("map-canvas")[i-1]).parent().find("#llat").val();
    var llng = $(document.getElementsByClassName("map-canvas")[i-1]).parent().find("#llng").val();
    if (llat && llng){}
    else{
        llat = -34.397;
        llng = 150.644;
    }
     var mapOptions = {
           zoom: 8,
           center: new google.maps.LatLng(llat,llng)
           // center: new google.maps.LatLng(Activity.latitude , Activity.longitude)
     };

    var map = new google.maps.Map(document.getElementsByClassName("map-canvas")[i-1],mapOptions)
     // var map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
}