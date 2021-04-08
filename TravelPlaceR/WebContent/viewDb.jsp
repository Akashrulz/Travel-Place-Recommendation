<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
div.ex3 {
    background-color: lightblue;
    width: 950px;
    height: 500px;
    overflow: auto;
}
</style>
</head>
<body>
<%
if(request.getParameter("added")!=null){
	out.println("<script>alert('Place updated successsfully.')</script>");
}

if(request.getParameter("updated")!=null){
	out.println("<script>alert('Location updated successsfully.')</script>");
}
if(request.getParameter("failed")!=null){
	out.println("<script>alert('Failed to updated location.')</script>");
}
%>

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
      <div align="left">
      <b style="font-size: 15px; color: black;">Welcome Admin,</b></div>
      </div>
      <div class="ex3">
      
<table align="center" cellspacing="5" border="1" cellpadding="5">
<tr style="size: 25px; color: black;">
<td style="width: 100px"><b>Sr. no</b></td>
<td style="width: 2500px"><b>Location</b></td>
<td style="width: 240px"><b>Category</b></td>
<td style="width: 240px"><b>Season</b></td>
<td style="width: 240px"><b>Action</b></td>
</tr>
<%
Connection con = ConnectionProvider.getConn();
PreparedStatement ps = con.prepareStatement("select * from location order by location");

ResultSet rs = ps.executeQuery();
int sr = 1;
while(rs.next()){
	%>
	<tr  style="size: 20px; color: black;">
	<td><%=sr++ %> </td>
	<td><%=rs.getString("location")%></td>
	<td><%=rs.getString("category") %></td>
	<td><%=rs.getString("season") %></td>
	
	<td><a href ="editLocation.jsp?locationId=<%=rs.getString("id")%>">View</a></td>
	</tr>
	
	<%
}
%>

</table>

      </div>
     <!--    <div class="article">
          <h2><span>A Personalize Recommendation System for Tour Management</span></h2>
          <div class="clr"></div>
          <div class="img"><img src="images/t2.jpg" width="184" height="194" alt="" class="fl" /></div>
          <div class="post_content">
            <p>Today when we want to plan a trip for holidays or general visit, very first we take a help from travel agencies then we need to plan according to travel agencies. But, because of this we face some difficulties like our vacation is start but travel agency package date is in the end of our holiday or in working time. Because of this limitation sometime we change the plan or drop the plan. In our system we propose a system in which user define its holiday starting date and ending date then system provide some recommendation like cost of package, points according to season, schedule, hotels and different packages. Tourist will filter according to its need.</p>
          </div>
          <div class="clr"></div>
        </div>
      --> <!--   <div class="article">
            <h2><span>A Personalize Recommendation System for Tour Management</span></h2>
          <div class="clr"></div>
          <div class="img"><img src="images/t3.jpg" width="184" height="194" alt="" class="fl" /></div>
          <div class="post_content">
<p>Today when we want to plan a trip for holidays or general visit, very first we take a help from travel agencies then we need to plan according to travel agencies. But, because of this we face some difficulties like our vacation is start but travel agency package date is in the end of our holiday or in working time. Because of this limitation sometime we change the plan or drop the plan. In our system we propose a system in which user define its holiday starting date and ending date then system provide some recommendation like cost of package, points according to season, schedule, hotels and different packages. Tourist will filter according to its need.</p>          </div>
          <div class="clr"></div>
        </div>
         -->
         <br></br>
         <br></br>
      </div>
<!--       <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="admin.jsp">Admin</a></li>
            <li><a href="user.jsp">User</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact us</a></li>
            <li><a href="#"></a></li>
          </ul>
        </div>
 --> <!--        <div class="gadget">
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
