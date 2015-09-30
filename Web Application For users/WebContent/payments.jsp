<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>payments</title>
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
	font-weight: bold;
}
.style6 {color: #0033FF}
.style9 {font-family: Arial, Helvetica, sans-serif}
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
    <td height="339"><table width="954" align="center" cellpadding="10">
      <tr>
        <td width="217" height="38" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="689" rowspan="2" bgcolor="#ffffff"><table width="687">
        <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11 style6">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="679" height="258"><fieldset>
            <legend><span class="style3">fund transfer</span></legend>
            <p class="style9" >The Payments and Transfers tab enables you to make online transactions   using funds in your accounts. You can transfer funds to own accounts, or   beneficiary accounts in the same bank or other banks. You can issue a   demand draft payable at any branch in the same bank, transfer an amount   to any Credit Card (VISA) Bill, or make donations to religious and   charitable institutions. Third Party transfers valued above Rs.10,000/- in a day will   require to be processed through one time SMS based password which is   sent on your registered mail.</p>
            <table width="643" height="82" cellpadding="15">
              <tr>
                <td><p class="style9">You Can transfer your funds by tese three services.</p>
                  <p class="style9">1.Fund Transfer</p>
                  <p class="style9">2.Inter Bank Fund Transfer</p>
                  <p class="style9">3.Third Party Fund Transfer</p></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            </fieldset>
            </td>
          </tr>
        
        </table>        
          <p>&nbsp;</p>
          <p>&nbsp;</p></td>
      </tr>
      <tr>
        <td height="443" bgcolor="#660033">
        <table width="217">
          <tr>
            <td width="196"><a href="payments.jsp">Fund Transfer</a></td>
          </tr>
          <tr>
            <td><a href="#">Inter Bank Transfer</a></td>
          </tr>
          <tr>
            <td><a href="thirdparty.jsp">Third Party Transfer</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
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
