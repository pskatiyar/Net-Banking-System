<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>welcome to DDSv bank</title>
<style type="text/css">
<!--
.style4 {font-family: "Bleeding Cowboys"; font-size: 20px; color: #0099FF; font-weight: bold; }
.style5 {font-family: Arial, Helvetica, sans-serif}
.style7 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}
.style9 {font-family: Arial, Helvetica, sans-serif; color: #000000; }
-->
</style>
</head>

<body >

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="Header.jsp" %></td>
  </tr>
   <tr>
    <td height="204"><table width="955"  border="0" align="center" cellpadding="5" >    
<tr>
         <td width="240" height="198" bgcolor="#660033">
           <fieldset>
           <legend><span class="style4">Quick Views</span></legend>
           <p><a href="atm locator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/atm.png" width="200" height="16" vspace="2" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="branch locator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/branch.png" width="220" height="16" vspace="2" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="photo.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/photo gallery.png" width="220" height="16" vspace="2" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="career.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/careers.png" width="170" height="15" vspace="2" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="loans.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/loans.png" width="110" height="15" vspace="2" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="downloads.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/downloads.png" width="180" height="16" vspace="2" align="middle" style="border:hidden"/></a>     
         <hr/>
         <a href="contact us.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/cantact.png" width="180" height="16" vspace="2" align="middle" style="border:hidden"/></a></p>
           </fieldset>         </td>
    <td width="350" bgcolor="#FFFFFF"><fieldset>
    <legend><span class="style4">Announcements</span></legend>
    <br/>
    <br/>
    <marquee behavior="scroll" onmouseover="stop" style="text-shadow:#999999" direction="up" scrolldelay="250">
    <p class="style9">&rArr; <span class="style7">Notice For Meeting Of Share Holders on (05/04/2012).</span></p>
    <p class="style7">&rArr; LAUNCH OF INTERNATIONAL TOLL FREE NOS.</p>
    <p class="style7">&rArr; REVISED RBI INSTRUCTIONS
FOR FAILED ATM TRANSACTIONS
AND
PERMISSIBLE FREE ATM TRANSACTIONS.</p>
</marquee><br/>
    <br/>
    </fieldset>
    </td>
    <td width="341" bgcolor="#FFFFFF"><fieldset>
    <legend class="style4">Whats new</legend>
    <br/>
    <br/>
     <marquee behavior="scroll" onmouseover="stop" style="text-shadow:#999999" direction="up" scrolldelay="250">
    <p class="style7">&rArr; Notice for elected directors of Bank amongst shareholders.</p>
    <p class="style7">&rArr; Chairman &amp; Managing Director's Message &amp; Address.</p>
    <p class="style7">&rArr; Financial Results for the quarter / half year ended 30th September 2011.</p></marquee>
    <br/>
    <br/>
    </fieldset>
   
    </td>
  </tr>
     </table></td>
  </tr>
  <tr>
    <td height="20"><%@include file="footer.jsp" %></td>
  </tr>
</table>
</body>
</html>
