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
       								
				
				</tr>
				
				
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
					<td colspan="3" align="right">
					<div style="margin-right:20px">&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="submit" value="Update" name="submit" />
					<input type= "reset"/>
					</div></td>
				</tr>
			</table>
      </form>

      

         
         <div align="left">
         <h2 style="font-size: 18px">
         <a href="addLocationInformation.jsp?locationId=<%=locationId %>"><font color="blue">Add Location Information</font></a> |
         <a href="viewPlaces.jsp?locationId=<%=locationId %>"><font color="blue">View Places</font></a> |
          <a href="editLocation.jsp?locationId=<%=locationId%>&alert=true"><font color="blue">Alert Message</font></a>
         
         </h2>
         </div>
      </div>
     </div>
     
     	<br>
	<br>
	<div align="center">
		<%
			if (request.getParameter("alert") != null) {
		%>
		<form action="UpdateAlert" method="post">
			<table cellpadding="5	" cellspacing="5" border="0" width="600">
				<tr>
					<td colspan="3" bgcolor="1D810E"><span
						style="color: #FFFFFF; font-weight: bold;"> Alert Location
					</span></td>
				</tr>
				<tr>
					<td><strong><font color="black">Alert</font></strong></td>
					<td><strong><font color="black">:</font></strong></td>
					<td><select name="alert" id="alert" required>
							<option value="">----- Select -----</option>
							<option value="true">Enable</option>
							<option value="false">Disable</option>
					</select></td>

				</tr>

				<tr>
					<td><strong><font color="black">Message</font></strong></td>
					<td><strong><font color="black">:</font></strong></td>
					<td><textarea rows="3" cols="30" maxlength="150"
							name="alertText"></textarea></td>
				</tr>
				<tr>
					<td><input type="hidden" name="locationId"
						value="<%=locationId%>" style="width: 400px" required /> <input
						type="hidden" name="regDate" value="<%=Addeddate%>" /> <%-- <input type="hidden" name="userid" value="<%= UserId %>" /> --%>
					</td>
				</tr>


				<tr>
					<td colspan="3" align="right">
						<div style="margin-right: 20px">
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Update"
								name="submit" /> <input type="reset" />
						</div>
					</td>
				</tr>
			</table>
		</form>

		<%
			}
		%>
	</div>
	<br>
	<br>
	
	
     
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
