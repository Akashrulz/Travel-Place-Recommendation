

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Towards Online Shortest Path Computation</title>

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
					//$('#travel_data').append("<span style='background-color:#384A6B;'>Estimated travel time: " + point.duration.text + " (" + point.distance.text + ")</spn><br>");
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
	width: 1500px;
	height: 600px;
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

<script type="text/javascript" src=""></script>
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




<!-- <script src="http://maps.google.com/maps/api/js?sensor=true"></script> -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<style type="text/css">
#map {
	width: 100%;
	height: 400px;
	margin-top: 10px;
}
</style>
<style>
    
    /*
	MAP DIRECTIONS
*/
.dir_start {
	font-weight: bold; padding: 5px; background: #E47D25; color: #fff;
}
.dir_end {
	font-weight: bold; padding: 5px; background: #C16417; color: #fff;
}
.dir_summary {
	padding: 5px;	
}
.dir_row{
	font-size: 14px;
	padding-right: 10px;	
}
.dir_sprite{
	width:	20px;
	height:	20px;
	display: block;
}
.turn-sharp-left{ background: url('images/maneuvers-new.png') 0px 0px ;	}
.turn-sharp-right{ background: url('images/maneuvers-new.png') 0px -20px ; }
.turn-left{	background: url('images/maneuvers-new.png') 0px -40px ;	}
.turn-right{ background: url('images/maneuvers-new.png') 0px -60px ; }
.turn-slight-left{ background: url('images/maneuvers-new.png') 0px -80px ; }
.turn-slight-right{	background: url('images/maneuvers-new.png') 0px -100px ; }
.ramp-left{	background: url('images/maneuvers-new.png') 0px -120px ; }
.ramp-right{ background: url('images/maneuvers-new.png') 0px -140px ; }
.fork-left{	background: url('images/maneuvers-new.png') 0px -160px ; }
.fork-right{ background: url('images/maneuvers-new.png') 0px -180px ; }
.straight{ background: url('images/maneuvers-new.png') 0px -200px ; }
.merge{ background: url('images/maneuvers-new.png') 0px -220px ; }
.roundabout-left{ background: url('images/maneuvers-new.png') 0px -240px ; }
.roundabout-right{ background: url('images/maneuvers-new.png') 0px -260px ; }
    
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #right-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
      }
      
      #floating-panel {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }
      .button {
    display: block;
    /*width: 115px;*/
    height: 25px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
}
     
    </style>
    <script>

    function getShortestPath() {

    	alert("see shortest path");
    	var Source = document.getElementById("from").value;
    	var Destination = document.getElementById("to").value;
    	 window.location.href = "http://localhost:8080/TravelManage_validation/getShortestPath.jsp?from="+Source+"&to="+Destination;
    	
    	
    }
    function refresh() {

    	//alert("call successfully");
    	//var Source = document.getElementById("from").value;
    	//var Destination = document.getElementById("to").value;
    	 window.location.href = "http://localhost:8080/TravelManage_validation/searchRoute.jsp";
    	
    	
    }
    
</script>
<!-- SET: FAVICON -->
<link rel="shortcut icon" href="images/applications.png" />
<!-- END: FAVICON -->


<!-- SET: STYLESHEET -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/jquery.backstretch.min.js"></script>


<!-- <script src="https://maps.googleapis.com/maps/api/jsvv=3.exp&sensor=false&libraries=places"></script> -->

<!-- END: STYLESHEET -->

<!-- SET: SCRIPTS -->


<script type="text/javascript"></script>
<!-- END: SCRIPTS -->

<meta name="description" content="Your description" />
<meta name="keywords" content="keyword1 keyword2" />

<!--[if lt IE 8]>
<style type="text/css">
	.header-container	{ padding-bottom:0;}
	.welcome	{ padding-top:12px;}
    .container	{ padding-bottom:0;}
    .footer-in	{ padding-bottom:0;}
</style>
<![endif]-->
<link rel="stylesheet" type="text/css" href="styles.css" />
</head>

<body>
<%
if(request.getParameter("output")!=null){
	String output = (String)session.getAttribute("output");
	//System.out.println(output);
	//String output = "HI";
	   out.println("<script>alert('"+ output +"');</script>"); 
	}


%>
	<!-- wrapper starts -->
	<div class="wrapper">

		<!-- Header Starts -->
		<div class="header">
		</div>
		<!-- Header ends -->

		<!-- Nav start -->
		<div class="nav">
			<div class="nav-in">
	
				<div class="clear"></div>
			</div>
		</div>
		<!-- Nav end -->

		<!-- maincontent Starts -->
		<div class="container">
			<div class="container-in">



				<div style="width:45%; height:100px;margin-left: auto;margin-right: auto; ">
				
				<form id="calculate-route" name="calculate-route" action="#" method="get">
					<table cellpadding="2" cellspacing="10" border="1" style="width:100%">
						<tr>

							<td><label for="from">From:</label></td>
							<td><input style="width:100%" type="text" id="from" name="from" required="required" placeholder="Source Address"/> <a
								id="from-link" href="#"  style="display:none">Get my position</a></td>
						</tr>

						<tr>
							<td><label for="from">To:</label></td>
							<td><input type="text"  style="width:100%" id="to" name="to" required="required"
								placeholder="Destination address" /> <a style="display:none" id="to-link"
								href="#">Get my position</a></td>

						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Search"/> <!-- <input type="button" value="Refresh" onclick="home.jsp"/> -->
							<input type="button" value="refresh" onclick="refresh();" />
							</td>
						</tr>

					</table>
</form>
				
				</div>
				<div style="width:100%">
				<div align="center" id="map"></div>
				</div>
				<div id="travel_data" align="center"></div>
				
				<div style="width:100%">
				
				<div id="right-panel" align="center"></div>
				</div>
			<p id="error"></p>
			
			<div id="travel_data">
				<input style="display:none" type="submit" value="View Shortest Path" />
				<a  id="travel_data" onclick="getShortestPath();" class="button" >View Shortest Path</a></input>
				</div>
			</div>


			




			<div class="clear"></div>
		</div>
	</div>
	<!-- aincontent ends -->

	<!-- footer starts -->
	<div class="footer">
		
	</div>
	<!-- footer ends -->

	</div>
	<!-- wrapper ends -->
<script>
    
  
    
    
     function initMap() {
    	 var first_array = new Array(); 
  var origin_place_id = null;
  var destination_place_id = null;
  var travel_mode = google.maps.TravelMode.WALKING;
  
  var myOptions = {
			zoom : 13,
			center : new google.maps.LatLng(18.5203, 73.8567),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
  
  var map = new google.maps.Map(document.getElementById('map'),myOptions);
  
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  directionsDisplay.setMap(map);
 

  var origin_input = document.getElementById('origin-input');
  var destination_input = document.getElementById('destination-input');

  
  var origin_autocomplete = new google.maps.places.Autocomplete(origin_input);
  origin_autocomplete.bindTo('bounds', map);
  var destination_autocomplete =  new google.maps.places.Autocomplete(destination_input);
  destination_autocomplete.bindTo('bounds', map);

  // Sets a listener on a radio button to change the filter type on Places
  // Autocomplete.
 
 
 
  origin_autocomplete.addListener('place_changed', function() {
    var place = origin_autocomplete.getPlace();
    if (!place.geometry) {
      window.alert("Autocomplete's returned place contains no geometry");
      return;
    }
    expandViewportToFitPlace(map, place);

    // If the place has a geometry, store its place ID and route if we have
    // the other place ID
    origin_place_id = place.place_id;
    route(origin_place_id, destination_place_id, travel_mode,
          directionsService, directionsDisplay);
  });

  destination_autocomplete.addListener('place_changed', function() {
    var place = destination_autocomplete.getPlace();
    if (!place.geometry) {
      window.alert("Autocomplete's returned place contains no geometry");
      return;
    }
    expandViewportToFitPlace(map, place);

    // If the place has a geometry, store its place ID and route if we have
    // the other place ID
    destination_place_id = place.place_id;
    route(origin_place_id, destination_place_id, travel_mode,
          directionsService, directionsDisplay);
  });
  
  function route(origin_place_id, destination_place_id, travel_mode,
                 directionsService, directionsDisplay) {
    if (!origin_place_id || !destination_place_id) {
      return;
    }
    directionsService.route({
      origin: {'placeId': origin_place_id},
      destination: {'placeId': destination_place_id},
      travelMode : google.maps.TravelMode.DRIVING,
		unitSystem : google.maps.UnitSystem.METRIC,
		provideRouteAlternatives: true,		
		optimizeWaypoints: true
     // travelMode: travel_mode
    }, function(response, status) {
    	
    	if (status == google.maps.DirectionsStatus.OK) {
    		
			for (var j = 0; len = response.routes.length;  j++) {
				var point = response.routes[ j ].legs[ 0 ];
				//myarray[j]=point.steps[i].instructions;
				
				
				var output = '';
				 var locationSteps = new Array(point.steps.length);
				 
				// Begin our HTML output of the directions
				output += '<div class="dir_start">'+ point.start_address +'</div>';
				output += '<form action="getTrafficDetails" method="post">';
				output += '<div class="dir_summary silver" style="color:#FF1024">Travel: '+ point.distance.text +' - about '+ point.duration.text +'</div>';
				 
				output += '<table>';
				for (var i=0; i<point.steps.length; i++){
					
					locationSteps[i]=point.steps[i].instructions;
				    output += '<tr style="border-bottom: 1px solid silver; color:#000">';
				    output += '<td class="dir_row"><span class="dir_sprite '+ point.steps[i].maneuver +'"></span></td>';
				    output += '<td class="dir_row">'+ (i+1) +'.</td>';
				    output += '<td class="dir_row"><input type="hidden" name="stepsInstruction"  value="'+ point.steps[i].instructions +'"</td>';
				    output += '<td class="dir_row">'+ point.steps[i].instructions +'</td>';
				    output += '<td class="dir_row" style="white-space:nowrap;">'+ point.steps[i].distance.text +'</td>';
				    output += '</tr>';
				}
				
				output += '</table>';
				 
				output += '<div class="dir_end">'+ point.end_address +'</div>';
				output += '<div class="dir_end"><input type="submit" value="Get Traffic Details"></div>';
				output += '<div style="background-color;#fff">&nbsp;</div>';
				output += '</form>';
				// Update the container with the new output				
				//dirpanel.innerHTML += output;
				
				
				document.getElementById("travel_data").innerHTML += output;
			
				
				//$('#travel_data').append("<span style='background-color:#384A6B;'> Estimated travel time: " + point.duration.text + " (" + point.distance.text + ")</spn><br>");
				
			new google.maps.DirectionsRenderer({
				map : map,
				directions : response,
				routeIndex: i
				
			});
			directionsDisplay.setDirections(response);
			 //alert(first_array[i]);
			}
			//directionsDisplay.setDirections(response);
			
		} else {
        window.alert('Directions request failed due to ' + status);
      }
    	
    	//alert(array);
    });
   </script>
</body>
</html>
