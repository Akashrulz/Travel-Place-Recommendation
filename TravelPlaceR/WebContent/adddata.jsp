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

if(request.getParameter("added")!=null){
	out.println("<script>alert('Location added successsfully.')</script>");
}
if(request.getParameter("failed")!=null){
	out.println("<script>alert('Failed to add location.')</script>");
}%>
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
      </div>
      <form action="AddData" method="post">
       <table cellpadding="5	" cellspacing="5" border="0" width="600" >
				<tr>
					<td colspan="3" bgcolor="1D810E"><span style="color: #FFFFFF;font-weight: bold;">
					Add New Location into database </span></td>
				</tr>
				<tr>
					<td><strong><font color="black">Location</font></strong></td>
					<td><strong><font color="black">:</font></strong></td>
					<td><input type="text" name="location" id="pac-input" style="width:400px" required/>
					
					</td>
				</tr>
				<tr>					
				<td><strong><font color="black">Category</font></strong></td>
					<td><strong><font color="black">:</font></strong></td>
					<td><select name="category" id="category" required>
					<option value="">----- Select -----</option>
					<option value="Devotional">Devotional</option>
					<option value="Historic">Historic</option>
					<option value="Natural">Natural</option>
					<option value="Entertainment">Entertainment</option>
					<option value="Adventours">Adventours </option>
					<option value="Other">Other </option>
					</select></td>
				</tr>
				
				<tr>
 				<td><strong><font color="black">Season to visit</font></strong></td>
 				<td><strong><font color="black">:</font></strong></td>
				<td><select name="season" id="season" required>
				<option value="">----- Select -----</option>
					<option value="All time">All time</option>
					<option value="Rainy">Rainy</option>
					<option value="Summber">Summer</option>
					<option value="Winter">Winter</option>
					
					</select></td>
       								
									
				</td>
				</tr>
				
				<tr>
				
				
				<tr>
		<%DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();            
		String Addeddate=dateFormat.format(date);
 %>			
					<td><strong><font color="black">Date</font></strong></td>
					<td><strong><font color="black">:</font></strong></td>
					<td><input type="text" name="regDate" value="<%= Addeddate %>" disabled="disabled" />
					<input type="hidden" name="regDate" value="<%= Addeddate %>" />
					<%-- <input type="hidden" name="userid" value="<%= UserId %>" /> --%>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="right"><div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Add" name="submit" />
					<input type= "reset"/></div></td>
				</tr>
			</table>
      </form>
<style type="text/css">
#map {
	width: 500px;
	height: 400px;
	margin-top: 10px;
}
</style>
         <div id="map" style="margin-left:auto;margin-right:auto"></div>

      
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
          center: {lat: 20.5937, lng: 78.9629},
          zoom: 8
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
    <script src="https://maps.googleapis.com/maps/api/js?key=" async defer></script>

</body>
</html>
