<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>final confirmation </title>
<style type="text/css">
<!--

.style20 {
	font-family: "Gemina Condensed";
	color: #0066FF;
}
.style3 {font-family: "Gemina Condensed"}
.style4 {
	font-family: "Gemina Condensed";
	font-weight: bold;
}
.style5 {
	font-family: Arial, Helvetica, sans-serif;
	color: #0033FF;
}
.style6 {color: #0033FF}
.style10 {
	font-family: Arial, Helvetica, sans-serif;
	color: #0000FF;
}
-->
</style>

<script type="text/javascript">
 function noBack()
 {
 window.history.forward(1);
 }
 
 var message="Right Click is not possible Here !";
 function click(e) {
 if (document.all) {
 if (event.button == 2) {
 alert(message);
 return false;
 }
 }
 if (document.layers) {
 if (e.which == 3) {
 alert(message);
 return false;
 }
 }
 }
 if (document.layers) {
 document.captureEvents(Event.MOUSEDOWN);
 }
 document.onmousedown=click;
</script>
</head>

<body onload="noBack()">

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="afterlogintop.jsp" %></td>
  </tr>
  <tr>
    <td height="72"><table width="954" align="center" cellpadding="5">
      <tr>
        <td width="217" height="28" colspan="" bgcolor="#000000"><span class="style20">Quick links</span></td>
        <td width="689" rowspan="2" bgcolor="#ffffff"><table width="737">
       <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11 style6">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="729" height="342"><fieldset>
            <legend><span class="style3">Requests</span></legend>
            <p class="style5">&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <div align="center"><span class="style10">Request Submitted SuccessFully.</span>
            </div>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            </fieldset>
              </td>
          </tr>
        
        </table>        
          <p>&nbsp;</p>
          </td>
      </tr>
      <tr>
        <td height="376" bgcolor="#660033"><table width="180">
          <tr>
            <td width="196"><a href="applyatm.jsp">ATM</a></td>
          </tr>
          <tr>
            <td><a href="applyatm.jsp">Cheque Book</a></td>
          </tr>
          <tr>
            <td><a href="#">SMS Alerts</a></td>
          </tr>
          <tr>
            <td><a href="applyatm.jsp">Passbook</a></td>
          </tr>
        </table>
           
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
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
