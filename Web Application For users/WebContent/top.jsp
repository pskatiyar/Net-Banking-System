<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>top</title>
<style type="text/css">
<!--
body {
	background-color: #B5B3DF;
	background-image: url("D:/java projects/Net Banking System/WebContent/images/bg_repeat.JPG");
	background-repeat: repeat-x;
	margin-left: 5px;
	margin-top: 5px;
}
body,td,th {
	color: #000000;
	font-family: Courier New, Courier, monospace;
}
a {
	font-family: Footlight MT Light;
	font-size: 18px;
	color: #FFFFFF;
}
a:link {
	text-decoration: none;
	color: #FFFFFF;
}
a:visited {
	text-decoration: none;
	color: #663366;
}
a:hover {
	text-decoration: none;
	color: #66CCFF;
	font-size:18px
	font-family: Footlight MT Light;
	text-transform: capitalize;
}
a:active {
	text-decoration: none;
	color: #FFFFFF;
}
.style5 {
	font-size: 18px
}
.style12 {font-weight: bold}
.style13 {font-family: "Gemina Condensed"}
.style14 {
	font-family: "Footlight MT Light";
	font-size: 24px;
	font-weight: bold;
	color: #FFFFFF;
}
.style15 {
	color: #FFFFFF;
	font-weight: bold;
}
.style16 {color: #FFFFFF}
.style17 {font-size: 18px; color: #FFFFFF; }
-->
</style>

<script type="text/javascript" >
var c=0;
window.onload=init;
function init()
{
if(c%7==0)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/branch (2).png";
else if(c%7==1)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/finance.png";
else if(c%7==2)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/career.png";
else if(c%7==3)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/contact copy.png";
else if(c%7==4)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/mobile copy.png";
else if(c%7==5)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/Internet-Banking.png";
else if(c%7==6)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/Untitled-1 copy (2).png";
c++;
setTimeout("init()",4000);
}
</script>
</head>

<body>
   
<table width="966" border="0" align="center">
  <tr>
    <td width="162" height="81"><strong><img src="D:/java projects/Net Banking System/WebContent/images/logo2.jpg" height="77" width="162" align="right" alt="ddsv"  /></strong></td>
    <td width="724"><strong><img src="D:/java projects/Net Banking System/WebContent/images/MINIMUM (49) copy.jpg" height="50" width="726" align="right" alt="ddsv"  />   </strong></td>
    <td width="66"><div class="img"><strong><a href="main.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/captur.jpg" width="62" height="60" align="middle" style="border:hidden" alt="Home"/></a> </strong></div></td>
   
  </tr>
</table>
   
<div align="center" class="style12">
<table width="952">
  <tr>
    <td width="104" height="23"><a href="aboutus.jsp" class="style5 style16">About Us</a></td>
    <td width="104"><a href="accounts.jsp" class="style17">Accounts</a></td>
    <td width="171"><a href="internet banking.jsp" class="style17">Internet Banking</a></td>
    <td width="156"><a href="mobile banking.jsp" class="style17">Mobile Banking</a></td>
    <td width="176"><a href="financial services.jsp" class="style17">Financial Services</a></td>
    <td width="146"><a href="other services.jsp" class="style17">Other services</a></td>
    <td width="63"><a href="e help.jsp" class="style17">E-help</a></td>
  </tr>
</table>
</div>
<table width="950" align="center" border="0"  bgcolor="#660033">
<tr>
     <td width="677" height="226" ><strong><img src="D:/java projects/Net Banking System/WebContent/images/Untitled-1 copy (2).png" alt="ddsv" name="gal" width="681" height="231" align="middle" id="gal"/></strong></td>
     <td width="263" align="center">
       <p><a href="internet banking.jsp" class="style25 style13">Net Banking Login</a>       </p>
       <p class="style28"><span class="style14">not a user ?</span> <a href="register.jsp" class="style25 style13">Register</a> <span class="style30 style5 style15">Here</span></p>
       <hr/>
       <p>   <span class="style13"><a href="emi calculator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/MINIMUM (50) copy.jpg" width="220" height="20" vspace="2" align="middle" style="border:hidden"/></a><br/>
    <a href="interest calculator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/MINIMUM1 (49) copy.jpg" width="220" height="20" vspace="1" align="middle" style="border:hidden"/></a></span> </p></td>
  </tr></table>

</body>
</html>