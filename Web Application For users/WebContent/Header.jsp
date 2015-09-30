<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>header</title>
<style type="text/css">
<!--
body {
	background-color:#B5B3DF;
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
}
a:visited {
	text-decoration: none;
	color: #FFFFFF;
}
a:hover {
	text-decoration: none;
	color: #00FFFF;
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


div.img a:hover img {border: 1px solid #0000ff;}

}
.style12 {font-weight: bold}
.style13 {
	font-family: "Gemina Condensed";
	font-weight: bold;
}
.style25 {font-family: "Gemina Condensed"}
.style28 {
	font-family: "Footlight MT Light";
	font-size: 24px;
	color: #FFFFFF;
	font-weight: bold;
}
.style30 {
	font-family: "Footlight MT Light";
	color: #FFFFFF;
	font-size: 18px;
}
-->
</style>

<script type="text/javascript" >
var c=0;
window.onload=init;
function init()
{
if(c%6==0)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/homeloan copy.png";
else if(c%6==1)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/education.png";
else if(c%6==2)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/business copy.png";
else if(c%6==3)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/Untitled-1 copy.png";
else if(c%6==4)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/agreecultur.png";
else if(c%6==5)
document.getElementById("gal").src="D:/java projects/Net Banking System/WebContent/images/cars.png";
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
    <td width="104" height="23"><a href="aboutus.jsp" class="style5">About Us</a></td>
    <td width="104"><a href="accounts.jsp" class="style5">Accounts</a></td>
    <td width="171"><a href="internet banking.jsp" class="style5">Internet Banking</a></td>
    <td width="156"><a href="mobile banking.jsp" class="style5">Mobile Banking</a></td>
    <td width="176"><a href="financial services.jsp" class="style5">Financial Services</a></td>
    <td width="146"><a href="other services.jsp" class="style5">Other services</a></td>
    <td width="63"><a href="e help.jsp" class="style5">E-help</a></td>
  </tr>
</table>
</div>

<table width="950" align="center" border="0"  bgcolor="#660033">
<tr>
     <td width="677" height="232" ><strong><img src="D:/java projects/Net Banking System/WebContent/images/cars.png" alt="ddsv" name="gal" width="681" height="231" align="middle" id="gal"/></strong></td>
     <td width="263" align="center">
       <p><a href="internet banking.jsp" class="style25">Net Banking Login</a>       </p>
       <p class="style28">not a user ? <a href="register.jsp" class="style25">Register</a> <span class="style28">Here</span></p><hr/>
       <p>   <span class="style13"><a href="emi calculator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/MINIMUM (50) copy.jpg" width="220" height="20" vspace="2" align="middle" style="border:hidden"/></a><br/>
        <a href="interest calculator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/MINIMUM1 (49) copy.jpg" width="220" height="20" vspace="1" align="middle" style="border:hidden"/></a></span> </p></td>
  </tr></table>
<table width="950" align="center" bgcolor="#2378B1" style="display:block" >
  <tr>
    <td height="21" ><strong>      <span style="font-size: 16px">
      <marquee behavior="scroll" onmouseover="stop" style="text-shadow:#999999" scrolldelay="250"> 
      <a href="marquee.jsp" class="style5"> New Interest rates</a>
      </marquee>
    </span>    </strong></td>
    <td>
    
    </td>
  </tr>
</table>
</body>
</html>