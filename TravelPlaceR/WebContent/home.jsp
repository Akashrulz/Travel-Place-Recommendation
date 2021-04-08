<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ASDC</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="company template, free website templates, green color bar, CSS, HTML" />
<meta name="description" content="Company Template (Green) is a free website template provided by templatemo.com" />

<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/s3slider.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>



<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
 <script>
	function calculateRoute(from, to) {
		// Center initialized to Naples, Italy
		var myOptions = {
			zoom : 10,
			center : new google.maps.LatLng(40.84, 14.25),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		// Draw the map
		var mapObject = new google.maps.Map(document.getElementById("map"),
				myOptions);

		var directionsService = new google.maps.DirectionsService();
		
		var directionsRequest = {
			origin : from,
			destination : to,
			travelMode : google.maps.TravelMode.DRIVING,
			unitSystem : google.maps.UnitSystem.METRIC,
			provideRouteAlternatives: true,
			
		};
		directionsService.route(directionsRequest, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				for (var i = 0, len = response.routes.length; i < len; i++) {
					var point = response.routes[ 0 ].legs[ 0 ];
					
					//$( '#travel_data' ).html( 'Estimated travel time: ' + point.duration.text + ' (' + point.distance.text + ')' );
					$('#travel_data').append("<span style='background-color:#384A6B;'>Estimated travel time: " + point.duration.text + " (" + point.distance.text + ")</spn><br>");
				new google.maps.DirectionsRenderer({
					map : mapObject,
					directions : response,
					routeIndex: i
				});
				}
			} else
				$("#error").append("Unable to retrieve your route<br />");
		});
	}

	$(document)
			.ready(
					function() {
						// If the browser supports the Geolocation API
						if (typeof navigator.geolocation == "undefined") {
							$("#error")
									.text(
											"Your browser doesn't support the Geolocation API");
							return;
						}

						$("#from-link, #to-link")
								.click(
										function(event) {
											event.preventDefault();
											var addressId = this.id.substring(
													0, this.id.indexOf("-"));

											navigator.geolocation
													.getCurrentPosition(
															function(position) {
																var geocoder = new google.maps.Geocoder();
																geocoder
																		.geocode(
																				{
																					"location" : new google.maps.LatLng(
																							position.coords.latitude,
																							position.coords.longitude)
																				},
																				function(
																						results,
																						status) {
																					if (status == google.maps.GeocoderStatus.OK)
																						$(
																								"#"
																										+ addressId)
																								.val(
																										results[0].formatted_address);
																					else
																						$(
																								"#error")
																								.append(
																										"Unable to retrieve your address<br />");
																				});
															},
															function(
																	positionError) {
																$("#error")
																		.append(
																				"Error: "
																						+ positionError.message
																						+ "<br />");
															},
															{
																enableHighAccuracy : true,
																timeout : 10 * 1000
															// 10 seconds
															});
										});

						$("#calculate-route").submit(function(event) {
							event.preventDefault();
							calculateRoute($("#from").val(), $("#to").val());
						});
					});
</script>






<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>
<script src="https://maps.googleapis.com/maps/api/jsvv=3.exp&sensor=false&libraries=places"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 3000
        });
    });
</script>
 <style type="text/css">
#map {
	width: 500px;
	height: 400px;
	margin-top: 10px;
}
</style>





<script type="text/javascript">
    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 3000
        });
    });
</script>
<script type="text/javascript">
function validate()
{
    
    if(document.getElementById("username").value=="")
   	{
   		alert("username should not be blank");
   		document.getElementById("username").focus();
   		return false;
   	}
    if(document.getElementById("password").value=="")
   	{
   		alert("password should not be blank");
   		document.getElementById("password").focus();
   		return false;
   	}
}
</script>
<script>
function myFunction() {
    location.reload();
}
</script>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<script type="text/javascript">
var source, destination;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
google.maps.event.addDomListener(window, 'load', function () {
    new google.maps.places.SearchBox(document.getElementById('from'));
    new google.maps.places.SearchBox(document.getElementById('to'));
    directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
});
 
function GetRoute() {
    var mumbai = new google.maps.LatLng(18.9750, 72.8258);
    var mapOptions = {
        zoom: 7,
        center: mumbai
    };
    map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('dvPanel'));
 
    //*********DIRECTIONS AND ROUTE**********************//
    source = document.getElementById("from").value;
    destination = document.getElementById("to").value;
 
    var request = {
        origin: source,
        destination: destination,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
 
    //*********DISTANCE AND DURATION**********************//
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
        origins: [source],
        destinations: [destination],
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
    }, function (response, status) {
        if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
            var distance = response.rows[0].elements[0].distance.text;
            var duration = response.rows[0].elements[0].duration.text;
            var dvDistance = document.getElementById("dvDistance");
           dvDistance.innerHTML = "";
            dvDistance.innerHTML += "Distance: " + distance + "<br />";
            dvDistance.innerHTML += "Duration:" + duration;
 
        } else {
            alert("Unable to find the distance via road.");
        }
    });
}
</script>
</head>
<body>

<div id="templatemo_site_title_bar_wrapper">

    <div id="templatemo_site_title_bar">
        <div id="site_title">
            <h1>
            <a href="http://www.templatemo.com" target="_parent">Approximate Shortest Distance Computing
            <span>A Query Dependent Local Landmark Scheme</span></a>
            </h1>
        </div>
        
        
    
    </div> <!-- end of site title bar -->
</div> <!-- end of site title bar wrapper -->

<div id="templatemo_banner_wrapper">

	<div id="templatemo_banner">
    
          <div id="slider">
                    <ul id="sliderContent">
                        <li class="sliderImage">
                            <a href=" " target="_blank"><img src="gallery/01.jpg" alt="1" /></a>
                            <span class="bottom"><strong> </strong><br /> </span>
                        </li>
                        <li class="sliderImage">
                            <a href=" " target="_blank"><img src="gallery/02.jpg" alt="2" /></a>
                            <span class="bottom"><strong>  </strong><br /> </span>
                        </li>
                        <li class="sliderImage">
                            <a href=" " target="_blank"><img src="gallery/03.jpg" alt="3" /></a>
                            <span class="bottom"><strong>  </strong><br /> </span>
                        </li>
                        <li class="sliderImage">
                            <a href=" " target="_blank"><img src="gallery/04.jpg" alt="4" /></a>
                            <span class="bottom"><strong>  </strong><br /> </span>
                        </li>
                    </ul>
                    <div class="clear sliderImage"></div>
                </div>
   
    	
        <div id="banner_content">
            <h2>A Query-Dependent Local Landmark Scheme</h2>
            <p>we propose a novel framework, called local landmark scheme, for estimating the shortest distance with a small number of query-dependent local landmarks.</p>
            <a href="abstract.jsp" target="_parent">Read more</a>
         </div>

	</div> <!-- end of banner-->

</div> <!-- end of banner wrapper -->

<div id="templatemo_menu_wrapper">

	<div id="templatemo_menu">
    
   		<ul>
            <li><a href="home.jsp" class="current fast">Home</a></li>
            <li><a href="Logout" target="_parent">Logout</a></li>
            <li><a href="abstract.jsp" target="_parent">About us</a></li>
            <li><a href="index.jsp" target="_parent">User</a></li>
             
        </ul>
    
    </div> <!-- end of menu -->

</div> <!-- end of menu wrapper -->

<!-- <div id="templatemo_content"> -->
<div>

 <div id="main_column">
            
                <div class="section_w560">
                    <h2>Search Route</h2>
                	<form id="calculate-route" name="calculate-route" action="#"
					method="get">
					<table  >
						<tr>

							<td><label for="from">From:</label></td>
							<td><input type="text" id="from" name="from"
								required="required" placeholder="An address" size="30" /> <a
								id="from-link" href="#"> </a></td>
						</tr>

						<tr>
							<td><label for="from">To:</label></td>
							<td><input type="text" id="to" name="to" required="required"
								placeholder="Another address" size="30" /> <a id="to-link"
								href="#"> </a></td>

						</tr>
						<tr>
						 
							<td colspan="2">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="Search"/> <button onclick="myFunction()">Refresh</button>
<input type="button" value="Shortest Route" onclick="GetRoute()" />
							</td>
						</tr>
						

					</table>

				</form>
			 
				<div id="travel_data"></div>
				<div id="map" style="margin-left:auto;margin-right:auto"></div>
			<p id="error"></p>
			</div>
                    <table>
                    <tr>
    <td >
        <div id="dvDistance">
        </div>
    </td>
</tr>
<tr>
    <td>
        <div id="dvMap" style="width: 500px; height: 500px">
        </div>
    </td>
    <td >
        <div id="dvPanel" style="background-color:white; width: 500px; height: 2000px ">
        </div>
    </td>
</tr>
</div>  
<div align=center><a href=''></a></div>
</body>
</html>