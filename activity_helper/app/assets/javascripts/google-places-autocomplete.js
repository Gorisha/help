$(document).ready(function(){
	checkAddressField()
});

function initialize_autocomplete() {
	var mapOptions = {
       types: ['geocode']
	};

	input = document.getElementsByClassName('add-location')[0]
	
	var autocomplete = new google.maps.places.Autocomplete(input, mapOptions);

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();

		if (place.geometry) {
			$(document).find('#llat').val(place.geometry.location.lat());
			$(document).find('#llng').val(place.geometry.location.lng());
		}
	});

}

function checkAddressField()
{
	if($('.add-location').length)
	{
		initialize_autocomplete();
	}
}
// <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
// <script type="text/javascript">
//   var lat = <%= @activities.latitude %>, 
//       lon = <%= @.longitude %>,
//       map;
//   function initialize() {
//     var myOptions = {
//       center: new google.maps.LatLng(lat, lon)
//     };
//     map = new google.maps.Map(document.getElementById('map_canvas'),
//         myOptions);
//   }

//   google.maps.event.addDomListener(window, 'load', initialize);
// </script>
// <div id="map_canvas"></div>