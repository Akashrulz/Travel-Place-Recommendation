

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
<!-- <script src="http://maps.google.com/maps/api/js?sensor=true"></script> -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<style type="text/css">
#map {
	width: 500px;
	height: 400px;
	margin-top: 10px;
}
</style>
<style>
    
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
<%

String Source = request.getParameter("from");
String Destination = request.getParameter("to");

%>

<body>

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



				<div style="width:45%; height:100px;margin-left: auto;margin-right: auto; display:none ">
				<form id="calculate-route" name="calculate-route" action="#" method="get">
					<table cellpadding="10" cellspacing="10" border="1">
						<tr>

							<td><label for="from">From:</label></td>
							<td><input type="text" id="origin-input" name="from" required="required" value="<%= Source %>"/> <a
								id="from-link" href="#">Get my position</a></td>
						</tr>

						<tr>
							<td><label for="from">To:</label></td>
							<td><input type="text" id="destination-input" name="to" required="required"
								 value="<%= Destination %>"/> <a id="to-link"
								href="#">Get my position</a></td>

						</tr>
						<tr>
							<td colspan="2"><input type="submit"  onclick="initMap();"/> <input type="reset" />
							</td> 
						</tr>

					</table>

				</form>
				</div>
				<div id="travel_data"></div>
			
				<div style="width:100%">
				<div id="map" style="float:left"></div>
				<div id="right-panel" style="float:left"></div>
				</div>
			<p id="error"></p>
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
    	  var polylineOptionsActual = new google.maps.Polyline({
    		    strokeColor: '#FF0000',
    		    strokeOpacity: 1.0,
    		    strokeWeight: 10
    		    });
        var directionsDisplay = new google.maps.DirectionsRenderer({polylineOptions: polylineOptionsActual});
        var directionsService = new google.maps.DirectionsService;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 18.5203, lng: 73.8567}
        });
        directionsDisplay.setMap(map);
        calculateAndDisplayRoute(directionsService, directionsDisplay);
        directionsDisplay.setPanel(document.getElementById('right-panel'));


      
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        var start = document.getElementById('origin-input').value;
        var end = document.getElementById('destination-input').value;
        directionsService.route({
          origin: start,
          destination: end,
          travelMode: google.maps.TravelMode.DRIVING
        }, function(response, status) {
          if (status === google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
//       	 window.location.href = "http://localhost:8080/TravelManage_validation/searchRoute.jsp?from="+Source+"&to="+Destination;

          }
        });
      }
    </script>

    <script src="https://maps.googleapis.com/maps/a" async defer></script>

   
	
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<script src="script.js"></script>
</body>
</html>
