<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" import="java.io.*" session="true" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>welcome</title>
<style type="text/css">
<!--
.style2 {
	font-family: "Gemina Condensed";
	color: #0066FF;
}
.style3 {font-family: "Gemina Condensed"}
.style4 {
	font-family: "Gemina Condensed";
	font-weight: bold;
}
a {
	font-family: Arial, Helvetica, sans-serif;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 18px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #CC66FF;
}
a:hover {
	text-decoration: none;
	color: #0066FF;
}
a:active {
	text-decoration: none;
	color: #FFFFFF;
}
.style7 {font-family: Arial, Helvetica, sans-serif; color: #0066FF; }
.style9 {font-family: "Gemina Condensed"; color: #0033FF; }
.style10 {font-family: Arial, Helvetica, sans-serif}
.style11 {color: #0033FF}
-->
</style>
 <script type="text/javascript">
 function noBack()
 {
 window.history.forward(1);
 alert("not allowed");
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
    <td height="495"><table width="952" align="center" cellpadding="8">
      <tr>
        <td width="246" height="34" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="681" rowspan="2" bgcolor="#ffffff"><table width="696">
        <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a>

            </span></div></td>
          </tr>
          <tr>
            <td width="688" height="174"><fieldset>
            <legend><span class="style9">Account summary</span></legend>
            <table width="688" height="99">
              <tr>
                <td><img src="D:/java projects/Net Banking System/WebContent/images/sudh.png"  width="165" height="80" align="middle" style="border:hidden"/></td>
                <td><img src="D:/java projects/Net Banking System/WebContent/images/sudh1.png" width="170" height="80" align="middle" style="border:hidden"/></td>
                <td><img src="D:/java projects/Net Banking System/WebContent/images/sudh2.png" width="165" height="80"  align="middle" style="border:hidden"/></td>
                <td><img src="D:/java projects/Net Banking System/WebContent/images/sudh3.png" width="170" height="80"  align="middle" style="border:hidden"/></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            </fieldset>
            
            
             </td>
          </tr>
          <tr>
            <td height="349"><fieldset>
            <legend><span class="style3">Transaction Accounts</span></legend>
            <table width="693" height="80" cellpadding="5">
              <tr>
                <td width="217" height="31" bgcolor="#CCCCCC"><span class="style7">Account Number</span></td>
                <td width="190" bgcolor="#CCCCCC"><span class="style7">Branch</span></td>
                <td width="246" bgcolor="#CCCCCC"><span class="style7">View Balance</span></td>
              </tr>
              <tr>
                <td bgcolor="#0033FF"><span class="style10"><a href="myaccounts.jsp"><%= session.getAttribute( "theacc" ) %></a></span></td>
                <td bgcolor="#0033FF"><span class="style10"><%= session.getAttribute( "theName2" ) %></span></td>
                <td bgcolor="#0033FF"><span class="style10"><%= session.getAttribute( "theName3" ) %></span></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            </fieldset>
            

            
            </td>
          </tr>
        </table>        </td>
      </tr>
      <tr>
        <td height="523" bgcolor="#660033"><table width="206">
         
          <tr>
            <td width="198"><a href="welcome.jsp">Account Summary</a></td>
          </tr>
          <tr>
            <td><a href="accountstatements.jsp">Account Statement</a></td>
          </tr>
          <tr>
            <td><a href="pendingstatements.jsp">Pending Statement</a></td>
          </tr>
          <tr>
            <td><a href="taxstatements.jsp">Income tax Statement</a></td>
          </tr>
         
        </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
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

<script type="text/javascript">
var timeOut = 1000 * 60 * 1;
var lastActivity = new Date().getTime();
var checkTimeout;
checkTimeOut = function()
{
    if(new Date().getTime() > lastActivity + timeOut)
    {
       
    }
    else
    {
        window.setTimeout(checkTimeOut, 1000);
    }
}
</script>
<%
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = log in.jsp");
%>
</body>
</html>
