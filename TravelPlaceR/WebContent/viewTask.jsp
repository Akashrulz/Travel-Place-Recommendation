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
</head>
<body><%

if(request.getParameter("taskAdd")!=null){
	out.println("<script>alert('Task added successsfully.')</script>");
}
if(request.getParameter("taskFail")!=null){
	out.println("<script>alert('Something went wrong to add task.')</script>");
}
if(request.getParameter("failed")!=null){
	out.println("<script>alert('Failed to add location.')</script>");
}%>
<div class="main">
  <div class="header">
    <div class="header_resize">
      
      <div class="menu_nav">
       <ul>
          <li class="active"><a href="userhome.jsp"><span>Home Page</span></a></li>
          <li><a href="profile.jsp"><span>Profile</span></a></li>
          <li><a href="tour.jsp"><span>Tour</span></a></li>
          <li ><a href="searchRoute.jsp"><span>Search Route</span></a></li>
          <li ><a href="userPlaces.jsp"><span>Search Places</span></a></li>
	      <li ><a href="userTask.jsp"><span>Task</span></a></li>
          <li><a href="user.jsp?logoutSuccess"><span>Logout</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo">
        <h1><a href="#"><span>Traveller's Guide</span> <small>A Personalize Recommendation System for Tourists</small></a></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> 
        <a href="#"><img src="images/t8.jpg" width="960" height="360" alt="" /><span>
        <big></big><br /></span></a>
         <a href="#"><img src="images/t4.jpg" width="960" height="360" alt="" /><span><big></big><br />
          </span></a> <a href="#"><img src="images/t7.jpg" width="360" height="160" alt="" /><span><big></big><br />
          </span></a> </div>
        <div class="clr"></div>
      </div>
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
            <h2 style="font-size: 2em;"><a href="userTask.jsp">Add New Task</a></h2>
      </div>
<%
Connection con = ConnectionProvider.getConn();
String email = (String)session.getAttribute("username");
PreparedStatement ps2= con.prepareStatement("select * from user_task where user = '"+email+"'");
ResultSet rs2 = ps2.executeQuery();

%>

	<table border="1" cellpadding="5" cellspacing="5">
		<tr><td><b><font color="black">Sr no</font></b></td>
		<td><font color="black">Location</font></td>
		<td><font color="black">Reminder Text</font></td>
		</tr>
		
		<tr>
		<%
		int sr=1;
		while(rs2.next()){ %>
	<td><font color="black"><%=sr++ %></font></td>
	<td><font color="black"><%=rs2.getString("location") %></font></td>
	<td><font color="black"><%=rs2.getString("reminder_text") %></font></td>
	</tr>
		<%
		}

%>
</table>
      
         <br></br>
         <br></br>
      </div>
     </div>
      <div class="clr"></div>
    </div>
  </div><!-- 
  </div> -->
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright <a href="#">Traveller's Guide</a>.</p>
      <p class="rf"><a href="#">Traveller's Guide</a></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13
        });
        var input = /** @type {!HTMLInputElement} */(
            document.getElementById('pac-input'));

        //var types = document.getElementById('type-selector');
        //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        //map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            window.alert("Autocomplete's returned place contains no geometry");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
          }));
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

       // setupClickListener('changetype-all', []);
       // setupClickListener('changetype-address', ['address']);
       // setupClickListener('changetype-establishment', ['establishment']);
       // setupClickListener('changetype-geocode', ['geocode']);
      }
    </script>
</body>
</html>
