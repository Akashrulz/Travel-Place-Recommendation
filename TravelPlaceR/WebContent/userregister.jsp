<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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


<script>
		// initialise plugins
		jQuery(function(){
			jQuery('#example').superfish({
				//useClick: true
			});
		});

		function validate(){  
			
			if(document.getElementById("fname").value=="")
		   	{
		   		alert("First name should not be blank");
		   		document.getElementById("fname").focus();
		   		return false;
		   	}
			else
				{
			       
			    	var fname = document.myform.fname; 
			    var letters = /^[A-Za-z]+$/;  
			    if(!fname.value.match(letters))   
			    {  
			    alert('First name must have alphabet characters only');  
			    document.getElementById("fname").focus();  
			    return false;  
			    }  
			      
				}
			if(document.getElementById("lname").value=="")
		   	{
		   		alert("Last name should not be blank");
		   		document.getElementById("lname").focus();
		   		return false;
		   	}
			else
			{
		       
		    	var lname = document.myform.lname.value; 
		    var letters = /^[A-Za-z]+$/;  
		    if(!lname.match(letters))   
		    {  
		    alert('Last name must have alphabet characters only');  
		    document.getElementById("lname").focus();  
		    return false;  
		    }  
		      
			}
			if(document.getElementById("dob").value=="")
		   	{
		   		alert("Date of Birth should not be blank");
		   		document.getElementById("dob").focus();
		   		return false;
		   	}
			if(document.getElementById("gender").value=="")
		   	{
		   		alert("Gender should not be blank");
		   		document.getElementById("gender").focus();
		   		return false;
		   	}
			if(document.getElementById("email").value=="")
		   	{
		   		alert("Email should not be blank");
		   		document.getElementById("email").focus();
		   		return false;
		   	}
			
			if(document.getElementById("mobile").value=="")
		   	{
		   		alert("Mobile Number should not be blank");
		   		document.getElementById("mobile").focus();
		   		return false;
		   		
		   	}
			
			if(document.getElementById("username").value=="")
		   	{
		   		alert("username should not be blank");
		   		document.getElementById("username").focus();
		   		return false;
		   	}
			if(document.getElementById("password").value=="")
		   	{
		   		alert("password should not be blank");
		   		document.getElementById("password").focus();
		   		return false;
		   	}
			 
		}  
		
		
		</script>
</head>
<%
if(request.getParameter("failed")!=null){
	out.println("<script>alert('Registrated successsfully.')</script>");
}


if(request.getParameter("exist")!=null){
	out.println("<script>alert('Email or mobile are already registered.')</script>");
}
%>
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
          <li class="active"><a href="index.jsp"><span>Home Page</span></a></li>
          <li><a href="admin.jsp"><span>Admin</span></a></li>
          <li><a href="user.jsp"><span>User</span></a></li>
          <li><a href="about.html"><span>About</span></a></li>
          <li><a href="contact.html"><span>Contact Us</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo">
        <h1><span>Traveller's Guide</span> <small>A Personalize Recommendation System for Tourists</small></h1>      </div>
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
      <div align="center" class="article">
      <br></br>
      <h3 style="font: normal;">
      </h3>
      <b style="font-size: 20px; color: black;">User Registration !!</b>
      <form action="UserRegister" method="post" onsubmit="return validate()">
      <table>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>

</tr>
      <tr>
      <td style="color: black; size: 10px"><b>First name : </b></td>
      <td><input type="text" name="fname" placeholder="Enter first name" id="fname" required></input></td>
      </tr> 
      <tr>
      <td style="color: black; size: 10px"><b>Last name : </b></td>
      <td><input type="text" name="lname" placeholder="Enter last name"  id="lname" required></input></td>
      </tr> 
      <tr>
      <td style="color: black; size: 10px"><b>DOB : </b></td>
      <td><input type="text" name="dob"id="dob" placeholder ="Date Of Birth" onfocus="showCalendarControl(this);" required></input></td>
      </tr> 
     
      <tr>
     <td  style="color: black; size: 10px"><b>Gender : </b></td>
      <td>&nbsp;Male<input type="radio" name="gender" id="gender" value="male"></input>
          &nbsp;Female<input type="radio" name="gender" id="gender" value="female"></input>
      </td>
	  </tr>
      <tr><td style="color: black; size: 10px"><b>Email : </b></td>
      <td><input type="email" name="email" id="email" placeholder="user@mail.com" required></input></td>
      </tr> 
      <tr>
      <td style="color: black; size: 10px"><b>Mobile : </b></td>
      <td><input type="text" maxlength="10" pattern="[789][0-9]{9}"  title=" Only Number allowed Start with 7 or 8 or 9" name="mobile" placeholder="mobile" required></input></td>
      </tr> 
      <tr>
      <td style="color: black; size: 10px"><b>Profession : </b></td>
      <td><input type="text" name="profession" placeholder="Enter profession" required></input></td>
      </tr> 
     
      <tr>
      <td  style="color: black; size: 10px"><b>Password : </b></td>
      <td><input type="password" name="password" placeholder="********" required></input></td>
      </tr>

      <tr>
      <td><b></b></td>
      <td><input type="submit" value="Register" name="Register" placeholder="username" required></input>
      <input type="reset"></input>
      </td>
      </tr>
      <tr>
      <td></td>
<td style="color: black; size: 10px">Already SingIUp ? Click here for <a href="user.jsp"><font color="Green">SingIn</font></a></td>
            </tr>
<tr></tr>
<tr></tr>
      
      </table>
      </form>
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
      </div>
      <div class="sidebar">
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
