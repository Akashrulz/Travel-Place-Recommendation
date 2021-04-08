<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbcon.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travel Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-marketingscript.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>

 <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      #target {
        width: 345px;
      }
    </style>

</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="adminhome.jsp"><span>Home Page</span></a></li>
          <li><a href="viewusers.jsp"><span>Users</span></a></li>
          <li><a href="adddata.jsp"><span>Database</span></a></li>
          <li><a href="viewDb.jsp"><span>View DB</span></a></li>
          <li><a href="admin.jsp?logoutSuccess"><span>Logout</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo">
        <h1><a href="#"><span>Traveller's Guide</span> <small>A Personalize Recommendation System for Tourists</small></a></h1>
      </div>
      <div class="clr"></div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
      <div align="center" class="article">
      <br></br>
      <h3 style="font: normal;">
      </h3>
      <%
String locationId = request.getParameter("locationId");
System.out.println("locationId : "+ locationId);
Connection con = ConnectionProvider.getConn();
PreparedStatement ps = con.prepareStatement("select * from location where id ='"+locationId+"'");

ResultSet rs = ps.executeQuery();
int sr = 1;
String location = "";
String category = "";
String season = "";
while(rs.next()){

location = rs.getString("location");
	category = rs.getString("category");
	season = rs.getString("season");
	

	
}
%>
            <form action="UpdateData" method="post">
       <table cellpadding="5	" cellspacing="5" border="0" width="600" >
				<tr>
					<td colspan="3" bgcolor="1D810E"><span style="color: #FFFFFF;font-weight: bold;">
					Update Location details </span></td>
				</tr>
				<tr>
					<td><strong><font color="black">Location</font></strong></td>
					<td><strong><font color="black">:</font></strong></td>
					<td><input type="text" name="location" value="<%=location %>" id="pac-input1" style="width:400px" disabled="disabled" required/>
					<td><input type="hidden" name="location" value="<%=location %>" id="pac-input1" style="width:400px" required/>
					<td><input type="hidden" name="locationId" value="<%=locationId %>" style="width:400px" required/>
					</td>
				</tr>
				<tr>					
				<td><strong><font color="black">Category</font></strong></td>
					<td><strong><font color="black">:</font></strong></td>
					<td><input type="text" name="location" value="<%=category %>" id="pac-input" style="width:400px" disabled="disabled"/></td>
				</tr>
				
				<tr>
 				<td><strong><font color="black">Season to visit</font></strong></td>
 				<td><strong><font color="black">:</font></strong></td>
					<td><input type="text" name="location" value="<%=season %>" id="pac-input" style="width:400px" disabled="disabled"/></td>

				</tr>
				
				
			
			</table>
      </form><br></br>
         <div align="left">
         <h2 style="font-size: 18px">
         <a href="addPlaces.jsp?locationId=<%=locationId %>">Add Places</a> |
         <a href="addPlaces.jsp?locationId=<%=locationId %>">Atms</a> |
         <a href="addPlaces.jsp?locationId=<%=locationId %>"> Beach</a> |
         <a href="addPlaces.jsp?locationId=<%=locationId %>"> Hospital</a> |
         <a href="addPlaces.jsp?locationId=<%=locationId %>"> Hotel</a> |
         <a href="addPlaces.jsp?locationId=<%=locationId %>"> Restaraunts</a> |
         <a href="addPlaces.jsp?locationId=<%=locationId %>"> Other</a> 
           
         </h2>
         </div>
         <br></br>
      </div>
     </div>
      <div class="clr"></div>
      
          <input id="pac-input" class="controls" type="text" placeholder="Search Box">
    <div id="map"></div>
      <script>
      // This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13,
          mapTypeId: 'roadmap'
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api"
         async defer></script>
      
      
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright <a href="#">Traveller's Guide</a>.</p>
      <p class="rf"><a href="#">Traveller's Guide</a></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>
