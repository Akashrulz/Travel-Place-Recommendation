
<%@page import="com.dbcon.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: green;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
    
    
}

.dropdown:hover .dropdown-content {
    display: block;
}

/* .img {
    border-radius: 50%;
} */
</style>


<style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 400px;
        width: 500px;
        border: 3px solid #000;
      }
    </style>
    
    <script type="text/javascript" src=""></script>
<script type="text/javascript">
if (navigator.geolocation) {
	
    navigator.geolocation.getCurrentPosition(function (p) {
        
		initMap(p.coords.latitude,p.coords.longitude);   
      
    });    
    
} else {
    alert('Geo Location feature is not supported in this browser.');
}
</script>

    <script>
     

      var map;
      var infowindow;
      var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      var labelIndex = 0;

    
      
      function initMap(la,lo) {
   
        var pyrmont = {lat: la, lng: lo};

        map = new google.maps.Map(document.getElementById('map'), {
          center: pyrmont,
          zoom: 15
        });

        infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
          location: pyrmont,
          radius: 500,
       	 type: ['<%=session.getAttribute("type")%>']
        }, callback);
      }

      function callback(results, status) {
    	  
        if (status === google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
          }
        }
      
     
      }



      function createMarker(place) {
        var placeLoc = place.geometry.location;
       // json.push(place.name+"/"+placeLoc+"-");
        
       // json.push(placeLoc);
       
        //alert(placeLoc);
        //alert(place.name);
      
        var marker = new google.maps.Marker({
        	
//         	label: labels[labelIndex++ % labels.length],

          map: map,
          position: place.geometry.location
          
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          //infowindow.setContent(place);
          infowindow.open(map, this);
         
        });
        
      }
      
     
    </script>



</head>
<body>

<%-- <%@include file="snow.jsp" %>
<%@include file="popup.jsp" %> --%>




<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <div class="clr"></div>
      </div>
      
      <div class="clr"></div>
      <div class="logo">
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
        
       
      <div id="map"></div>
      
      
      
      <div style="margin-left: 510px; margin-top: -390px;">
<h4>Your Nearby Places.</h4><br>
    <form action="visit" method="post" > 
								
<strong>Select: </strong><select name="category" id="category">
									<option value="">---Select---</option>
		<%
		
		Connection con = ConnectionProvider.getConn();
		PreparedStatement ps = con.prepareStatement("select * from marker_temp");
		ResultSet rs= ps.executeQuery();
		while(rs.next()){
		
		
		%>
		<option value="<%=rs.getString("name") %>"><%=rs.getString("name") %></option>

									
		<%} %>						

									</select>&nbsp;&nbsp;&nbsp;&nbsp;<a href="near1.jsp">Refresh</a><br><br> 
   <input type="submit" value="Submit" class="button"> 
<!--    <input type="button" value="Submit" class="button" onclick="btn()"> -->
   
</form>
</div>


<br><br><br><br><br><br><br><br><br><br>  
    <script src= defer></script>
      
  
        </div>
     
      </div>
 
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
       <!--  <h2>About</h2>
        <img src="images/white.jpg" width="66" height="66" alt="" />
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. llorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum. <a href="#">Learn more...</a></p>
      -->
       </div>
      <div class="col c2">
       <!--  <h2>Lorem Ipsum</h2>
        <ul class="sb_menu">
          <li><a href="#">consequat molestie</a></li>
          <li><a href="#">sem justo</a></li>
          <li><a href="#">semper</a></li>
          <li><a href="#">magna sed purus</a></li>
          <li><a href="#">tincidunt</a></li>
        </ul> -->
      </div>
      <div class="col c3">
       <!--  <h2>Contact</h2>
        <p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat.</p>
        <p><strong>Phone:</strong> +1234567<br />
          <strong>Address:</strong> 123 TemplateAccess Rd<br />
          <strong>E-mail:</strong> <a href="#">info@example.com</a></p> -->
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
  </div>
</div>
</body>
</html>
