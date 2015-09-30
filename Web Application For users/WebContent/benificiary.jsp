<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>manage beneficiary</title>
<style type="text/css">
<!--
.style2 {
	font-family: "Gemina Condensed";
	color: #0066FF;
}
.style15 {font-family: "Footlight MT Light"; font-weight: bold; font-size: 16px; background-color:#E1E1E1 }
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
.style6 {color: #0033FF}
.style7 {font-family: Arial, Helvetica, sans-serif}
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
    <td height="72"><table width="952" align="center" cellpadding="8">
      <tr>
        <td width="246" height="34" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="681" rowspan="2" bgcolor="#ffffff"><table width="696">
          <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11  style6">Welcome , <%= session.getAttribute( "theName" ) %> </span></blink> <span class="style11  style6"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="688" height="252"><fieldset>
              <legend><span class="style3">manage beneficiary</span></legend>
              <p>&nbsp;</p>
              <table width="576" align="center" cellpadding="5">
                <tr>
                  <td><div align="left" class="style7">
                    <p>For Transfering your funds to other(third parties) You have to manage( ADD NEW BENEFIFIARY, DELETE BENEFICIARY, VIEW EXISTING BENEFICIARY, AND MODIFY BENEFICIARY). </p>
                    <p>Please select an option the buttons given below and you can perform your desired operation.</p>
                  </div></td>
                </tr>
              </table>
              <p>&nbsp;</p>
              <table width="274" align="center" cellpadding="5">
                <tr>
                  <td width="87"><form id="form1" name="form1" method="post" action="addbenificiary.jsp" >
                    <label>
                      <input type="submit" name="btnadd" id="btnadd"class="style15" value="ADD NEW BENEFICIARY" />
                      </label>
                  </form></td>
                  <td width="67"><form id="form2" name="form2" method="post" action="view.jsp">
                    <label>
                      <input type="submit" name="btview" class="style15"  value="  VIEW BENEFICIARY  " />
                      </label>
                  </form></td></tr><tr>
                  <td width="67"><form id="form3" name="form3" method="post" action="delete.jsp">
                    <label>
                    <input type="submit" name="btndel" class="style15" value="  DELETE BENEFICIARY  " />
                    </label>
                  </form></td>
                  <td width="67"><form id="form4" name="form4" method="post" action="modify.jsp">
                    <label>
                      <input type="submit" name="btnmodify"  class="style15" value="MODIFY BENEFICIARY" />
                      </label>
                  </form></td>
                </tr>
              </table>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
            </fieldset></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="295" bgcolor="#660033"><table width="217">
          <tr>
            <td width="196"><a href="profile.jsp">Personal Details</a></td>
          </tr>
          <tr>
            <td height="21"><a href="nikname.jsp" class="style16">Set Account Nick Name</a></td>
          </tr>
          <tr>
            <td><a href="changepass.jsp">Change password</a></td>
          </tr>
          <tr>
            <td><a href="benificiary.jsp">Manage beneficiary</a></td>
          </tr>
          <tr>
            <td><a href="modify.jsp">Define Limit</a></td>
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
          <p>&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><%@include file="footer.jsp" %></td>
  </tr>
</table>
</body>
</html>
