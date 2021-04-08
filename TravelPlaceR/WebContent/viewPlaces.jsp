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
					<td><input type="text" name="location" value="<%=location %>" id="pac-input" style="width:400px" disabled="disabled" required/>
					<td><input type="hidden" name="location" value="<%=location %>" id="pac-input" style="width:400px" required/>
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
         <a href="viewPlaces.jsp?place=Devotional&locationId=<%=locationId %>">Devotional</a> |
         <a href="viewPlaces.jsp?place=Historic&locationId=<%=locationId %>">Historic</a> |
         <a href="viewPlaces.jsp?place=Natural&locationId=<%=locationId %>">Natural</a> |
         <a href="viewPlaces.jsp?place=Entertainment&locationId=<%=locationId %>">Entertainment </a> |
         <a href="viewPlaces.jsp?place=Adventours&locationId=<%=locationId %>">Adventours</a> |
         <a href="viewPlaces.jsp?place=Other&locationId=<%=locationId %>">Other</a> 
           
         </h2>
         </div>
         <br></br>
         <% String place = request.getParameter("place"); 
         
         
         %>
         
          <table cellpadding="5	" cellspacing="5" border="1" width="600" >
          	<tr>
          	<td><font color="black">Sr No.</font></td>
					<td><strong><font color="black">Place Name</font></strong></td>
				<td><strong><font color="black">Location Type</font></strong></td>
					<td><strong><font color="black">Visitor Type</font></strong></td>
					
			</tr>
          
          <%
          PreparedStatement ps1 = con.prepareStatement("select * from location_details where location_type = '"+place+"' and location_id= '"+locationId+"'");
          ResultSet rs1 = ps1.executeQuery();
          int sr1 = 1;
          while(rs1.next()){
        	  %>
        	  <tr>
					<td><%=sr1++ %></td>
					<td><input type="text" value="<%=rs1.getString("place_name") %>"></input></td>
					<td><input type="text" value="<%=rs1.getString("location_type") %>"></input></td>
					<td><input type="text" value="<%=rs1.getString("visitor_type") %>"></input></td>
					
				</tr>
        	  
        	  <%
          }
          %>
							
			</table>
			<% if(sr1==0){
			%>
			<h6>No data found for location type <%=place %></h6>
			<%
			}
				%>
			
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
