<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dbcon.ConnectionProvider"%>
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
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
     
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="userhome.jsp"><span>Home Page</span></a></li>
          <li><a href="profile.jsp"><span>Profile</span></a></li>
          <li><a href="tour.jsp"><span>Tour</span></a></li>
      <!--     <li ><a href="searchRoute.jsp"><span>Search Route</span></a></li>
       -->    <li ><a href="userPlaces.jsp"><span>Search Places</span></a></li>
          <li><a href="user.jsp?logoutSuccess"><span>Logout</span></a></li>

        </ul>
      </div> 
      <div class="clr"></div>
      <div class="logo">
        <h1><span>Traveller's Guide</span> <small>A Personalize Recommendation System for Tourists</small></h1>
      </div>
      <div class="clr"></div>
       <div class="slider">
        <div id="coin-slider"> 
        <a href="#"><img src="images/t1.jpg" width="960" height="360" alt="" /><span>
        <big></big><br /></span></a>
         <a href="#"><img src="images/t2.jpg" width="960" height="360" alt="" /><span><big></big><br />
          </span></a> <a href="#"><img src="images/t6.jpg" width="360" height="160" alt="" /><span><big></big><br />
          </span></a> </div>
        <div class="clr"></div>
      </div> 
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
      <div align="left" class="article">
      <br></br>
      <h3 style="font: normal;">
      </h3>
      <b style="font-size: 20px; color: black;">Home > profile</b>
      </div>

<table align="center" cellspacing="5" border="1" cellpadding="5">

<%
Connection con = ConnectionProvider.getConn();
PreparedStatement ps = con.prepareStatement("select * from user where email='"+session.getAttribute("username")+"'");

ResultSet rs = ps.executeQuery();

if(rs.next()){
	%>
	<tr  style="size: 20px; color: black;">
	<td>Name : </td><td><%=session.getAttribute("user") %></td>
	</tr>
	<tr  style="size: 15px; color: black;">
	<td>Email : </td><td><%=rs.getString("email") %></td>
	</tr>
	<tr style="size: 15px; color: black;">
	<td>Gender : </td><td><%=rs.getString("gender") %></td>
	</tr>
	<tr style="size: 15px; color: black;">
	<td>Date of Birth : </td><td><%=rs.getString("dob") %></td>
	</tr>
	<tr style="size: 15px; color: black;">
	<td>Mobile : </td><td><%=rs.getString("mobile") %></td>
	</tr>
	<tr style="size: 15px; color: black;">
	<td>Profession : </td><td><%=rs.getString("profession") %></td>
	</tr>
	
	<%
}
%>

</table>

      </div>

 <!--        <div class="gadget">
          <h2 class="star"><span>Our Team</span></h2>
          <div class="clr"></div>
          <ul class="ex_menu">
            <li><a href="#">Student Name 1</a><br />
              BE </li>
            <li><a href="#">Student Name 2</a><br />
             BE </li>
          </ul>
        </div>
  -->     </div>
      <div class="clr"></div>
    </div>
  </div><!-- 
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/t6.jpg" width="75" height="75" alt="" class="gal" /></a>
        <a href="#"><img src="images/t7.jpg" width="75" height="75" alt="" class="gal" /></a> 
        <a href="#"><img src="images/t8.jpg" width="75" height="75" alt="" class="gal" /></a> 
        <a href="#"><img src="images/t4.jpg" width="75" height="75" alt="" class="gal" /></a> 
        <a href="#"><img src="images/t5.jpg" width="75" height="75" alt="" class="gal" /></a> 
        <a href="#"><img src="images/t6.jpg" width="75" height="75" alt="" class="gal" /></a> 
        </div>
      <div class="col c2">
        <h2><span>Services</span> Overview</h2>
        <p>The main purpose of this project is to help the public in knowing their
         place details and getting their proper recommendation and project also aims to 
         develop application which will help the user during Travel. To make tourist travelling 
         plan more scheduled and convenient for them, so they can enjoy their trips without any
          hesitation. The whole preplanned things as per the tourist budget and available days 
          for the trip.</p>
        <ul class="fbg_ul">
        </ul>
      </div>
      <div class="col c3">
        <h2><span>Contact</span> Us</h2>
        <p></p>
        <p class="contact_info"> <span>Address:</span> 1458 TemplateAccess, USA<br />
          <span>Telephone:</span> +123-1234-5678<br />
          <span>FAX:</span> +458-4578<br />
          <span>Others:</span> +301 - 0125 - 01258<br />
          <span>E-mail:</span> <a href="#">mail@yoursitename.com</a> </p>
      </div>
      <div class="clr"></div>
    </div>
  </div> -->
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
