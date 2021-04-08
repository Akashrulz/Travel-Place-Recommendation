<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbcon.ConnectionProvider"%>
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
<script src="./js/CalendarControl.js"  language="javascript"></script>  

<link href="./css/CalendarControl.css" rel="stylesheet" type="text/css">

</head>
<body>
<%
if(request.getParameter("samepoints")!=null){
	out.println("<script>alert('source and destination should not be same')</script>");
}
%>
<div class="main">
  <div class="header">
    <div class="header_resize">
     
 <div class="menu_nav">
        <ul>
          <li class="active"><a href="userhome.jsp"><span>Home Page</span></a></li>
          <li><a href="profile.jsp"><span>Profile</span></a></li>
          <li><a href="tour.jsp"><span>Tour</span></a></li>
<!--           <li ><a href="searchRoute.jsp"><span>Search Route</span></a></li>
 -->          <li ><a href="userPlaces.jsp"><span>Search Places</span></a></li>
          <li><a href="user.jsp?logoutSuccess"><span>Logout</span></a></li>

        </ul>
      </div>      <div class="clr"></div>
      <div class="logo">
        <h1><a href="index.jsp"><span>Travel Place Recommendaion </span> <small>A Personalize Recommendation System for Tourists</small></a></h1>
      </div>
      <div class="clr"></div>
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
      </div>

<%
Connection con = ConnectionProvider.getConn();
PreparedStatement ps = con.prepareStatement("select * from location order by location");
ResultSet rs = ps.executeQuery();

%>      
      <form action="SearchTour" method="get">
      <table align="center">
      <tr>

      <td><font color="black">From</font> </td>
      <!-- <td><input type="text" required id="from-location" name="source"/></td> -->
		<td><select name="source" required style="width: 220px;">
		
		<%while(rs.next()){
			%>
		<option value=<%=rs.getString("city") %>><%=rs.getString("location") %></option>
			<%
		}%>
		
		</select></td>
		
      <td><font color="black">To</font> </td>
<!--       <td><input type="text" required id="to-location" name="destination"/></td> -->
		<td><select name="destination" required style="width: 220px;">
		
		<%
		ResultSet rs1 = ps.executeQuery();
		while(rs1.next()){
			%>
		<option value=<%=rs1.getString("city") %>><%=rs1.getString("location") %></option>
			<%
		}%>
		
		</select></td>

      </tr>
      <tr></tr>
<!-- <tr>
      <td>Number of People </td>
      <td><input type="number" name="noOfPeople" id="dob" value="1" placeholder ="Number of People"></input>
</td>
</tr>
 -->            <tr>      
      <td><font color="black">Journey </font></td>
      <td><input type="text" name="fromDate" style="width: 100px;" id="dob" placeholder ="From date" onfocus="showCalendarControl(this);"/>
<!--       </tr><tr> -->
</td><td><font color="black">Journey</font>  </td><td>
     <input type="text" name="toDate" id="dob" style="width: 100px;" placeholder ="To date" onfocus="showCalendarControl(this);"/></td>
      </tr>

<tr>	<td><font color="black">Interest</font></td>
					<td><select name="category" id="category" >
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
 				<td><font color="black">Visitors Type</font></td>
 				
				<td><select name="visitorType" id="visitorType" >
				<option value="">----- Select -----</option>
					<option value="all" selected="selected">All</option>
					<option value="kids">Kids</option>
					<option value="youngsters">Youngsters</option>
					<option value="oldage">Oldage</option>
					
					</select></td>
       								
				
				</tr>      
<!--       <tr>      

      <td>Budget</td>
      <td><input type="text" placeholder="enter your tour budget" required name="budget"/></td>
      </tr>
 -->     <!--  <tr> 
      <td>Intrest </td>
      <td><input type="text" required placeholder="enter your interest" name="interest1"/></td>
      <td></td>
      <td></td>
      <td><input type="text" required placeholder="enter your interest" name="interest2"/></td>
      </tr>
     <tr></tr> -->
     
      <tr><td></td>
      <td><input type="submit"></input>
      <input type="reset"/></td></tr>
      </table>
      </form>
      <br></br>
      <br />
<div align="center">

<%
if(request.getParameter("resultid")!=null){
	
	String resultId = request.getParameter("resultid");

	String ipCategory = (String)session.getAttribute("ipCategory");
	String ipVisitorType = (String)session.getAttribute("ipVisitorType");
	
	
//	Connection con = ConnectionProvider.getConn();
	


	PreparedStatement ps1 = con.prepareStatement("select * from location where id = '"+resultId+"'");
	ResultSet rs11 = ps1.executeQuery();
	
	String loc_category="";
	String loc_season = "";
	String city = "";
	String location = "";
	boolean alert = false;
	String alertMessage = "";
	while(rs11.next()){
		loc_category = rs11.getString("category");
		loc_season = rs11.getString("season");
		city = rs11.getString("city");
		location = rs11.getString("location");
		alert = rs11.getBoolean("alert");
		alertMessage = rs11.getString("alert_message");
	}
	
	System.out.println("cate === > "+loc_category+" seaa === >"+loc_season+" "+city+" "+location);
	
	String sql = "select * from location_details where location_id = '"+resultId+"'";
	
	if(ipCategory.equalsIgnoreCase("Devotional") || ipCategory.equalsIgnoreCase("Historic") || ipCategory.equalsIgnoreCase("Natural")
			|| ipCategory.equalsIgnoreCase("Entertainment") || ipCategory.equalsIgnoreCase("Adventours")  || ipCategory.equalsIgnoreCase("Other")){
	
		System.out.println("here");
		sql = sql + " AND location_type = '"+ipCategory+"' ";
	}
	System.out.println("not going inside");
	if(ipCategory.equalsIgnoreCase("kids") ||  ipCategory.equalsIgnoreCase("all")  || ipCategory.equalsIgnoreCase("yougsters")
			
			 || ipCategory.equalsIgnoreCase("oldage")){
		System.out.println("here2");
		sql = sql + " AND visitor_type ='"+ipVisitorType+"'";
	}
	
	System.out.println("len "+ipCategory.length()+" le1 "+ipVisitorType.length());
	
	sql=sql+"ORDER BY ratings DESC";
	
	System.out.println("SQL ===> "+sql);
	
	
	PreparedStatement ps2 = con.prepareStatement(sql);
	ResultSet rs2 = ps2.executeQuery();
	
	if (alert) {
		%>

		<h2 style="color: red;">
			<span>Alert :</span>
			<%=alertMessage%></h2>

		<%
			}
		%>
	
	
		<table border="1" cellpadding="10" cellspacing="6" align="center">
		<tr>
		<td><label><b>Sr .No</b>  </label></td>
		<td><label><b>Place Name</b>  </label></td>
		<td><label><b>Location Type </b> </label></td>
		<td><label><b>Visitor Type  </b></label></td>
		<td><label><b>Distance (KM) </b> </label></td>
		<td><label><b>Cost (10 Rs/KM)</b> </label></td>
		<td><label><b>Rating</b> </label></td>
		</tr>
	<%
	int sr =0;
	while(rs2.next()){
		%>
	
		<tr>
		<td><%=++sr %></td>
<!-- 		<td><label>Place Name : </label></td> -->

		<td><font color="blue"><%=rs2.getString("place_name") %></font></td>

		<!-- </tr>
		<tr>
		<td><label>Location type : </label></td>
		 -->
		 <td>		<font color="blue"><%=rs2.getString("location_type") %></font></td>
		<!-- </tr>

<tr>
<td><label>Visitor Type : </label></td>
 -->
 	<td><font color="blue"><%=rs2.getString("visitor_type") %></font></td>
 	
<!-- </tr>
<tr>
<td><label>Cost : </label></td>
 -->
 <td>	<font color="blue"><%=session.getAttribute("cost") %></font></td>
 <td>	<font color="blue"><%=Integer.parseInt(session.getAttribute("cost").toString())*10 %> </font></td>
 <td><font color="blue"><%=rs2.getString("ratings") %></font></td>
 	
</tr>
	
		
		
		<%
		
	}
}
%>
</table>
</div>
      <br></br>
      <br />
      </div>
      <style type="text/css">
#map {
	width: 500px;
	height: 400px;
	margin-top: 10px;
}
</style>
<!--          <div id="map" style="margin-left:auto;margin-right:auto"></div>
 -->
      
      <div class="sidebar">
        <div class="gadget">
        </div>
     </div>
      <div class="clr"></div>
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
