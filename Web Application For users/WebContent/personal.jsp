<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Personal banking</title>
<style type="text/css">
<!--
.style1 {font-size: 18px}
.style2 {
	color: #0000CC;
	font-size: 16px;
	font-family: Arial, Helvetica, sans-serif;
}
.style3 {
	color: #0033CC;
	font-family: Arial, Helvetica, sans-serif;
}
.style4 {font-family: "Footlight MT Light"}
.style6 {font-family: "Footlight MT Light"; font-weight: bold; }
.style7 {font-size: 18px; font-weight: bold; }
.style8 {
	font-family: Arial, Helvetica, sans-serif;
	color: #0000CC;
}
.style16 {
	font-family: "Bleeding Cowboys";
	color: #0066FF;
}
-->
</style>
</head>

<body>

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="top.jsp" %></td>
  </tr>
   <tr>
    <td height="204"><table width="955"  border="0" align="center" >    
<tr>
         
         <td width="240" height="198" bgcolor="#660033">
           <fieldset>
           <legend><span class="style1 style16">Quick Views</span></legend>
           <p><a href="atm locator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/atm.png" width="200" height="16" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="branch locator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/branch.png" width="220" height="16" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="photo.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/photo gallery.png" width="220" height="16" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="career.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/careers.png" width="170" height="15" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="loans.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/loans.png" width="110" height="15" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="downloads.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/downloads.png" width="180" height="16" vspace="4" align="middle" style="border:hidden"/></a>     
         <hr/>
         <a href="contact us.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/cantact.png" width="180" height="16" vspace="4" align="middle" style="border:hidden"/></a></p>
           </fieldset>
         </td>
    <td width="703" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3"></td>
        <td width="856"><table width="100%" cellpadding="0" cellspacing="0">
            <tbody>
              <tr>
                <td valign="top" width="858"><div>
                    <fieldset>
                    <legend>DDSV</legend>
                    <h1 class="style7">&nbsp;&nbsp;&nbsp;<span class="style4">Please ensure the following before logging in</span></h1>
                    <ul>
                      <li class="style2">Do not enter login or other sensitive information in any pop up window. </li>
                      <li class="style2">Look for the pad lock symbol either in the address bar or the status bar   (mostly in the address bar) but not within the web page display area.   Verify the security certificate by clicking on the padlock.</li>
                      <li class="style2">URL address on the address bar of your Internet browser begins with   &quot;https&quot;; the letter  's' at the end of &quot;https&quot; means 'secured'.</li>
                      <li class="style3">The address bar has turned to green indicating that  the site is secured   with an SSL Certificate that  meets the Extended Validation Standard.</li>
                    </ul>
                    <h1 class="style1">&nbsp;&nbsp;&nbsp;<span class="style6">Beware of Phishing attacks</span></h1>
                    <ul class="style8">
                      <li class="style2">Phishing is a fraudulent attempt, usually made through email, phone   calls, SMS etc seeking your personal and confidential information.</li>
                      <li class="style2">For more security tips visit link <a href="#"><img src="D:/java projects/Net Banking System/WebContent/images/termofuses.png" width="150" height="15" vspace="0"/></a></li>
                    </ul>
                    </fieldset><br/>
                    <form>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="Continue" type="button" value="CONTINUE TO LOGIN" onclick="window.open('log in.jsp','mywindow','width=800,height=600,scrollbars=1')"/>
                    </form>
                    <p>&nbsp;</p>
                </div></td>
              </tr>
            </tbody>
        </table></td>
      </tr>
    </table>
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
