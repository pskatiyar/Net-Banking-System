<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>third party fund transfer</title>
<style type="text/css">
<!--
.style9 {font-family: Arial, Helvetica, sans-serif; color: #0066FF; }
.style1 {font-family: Arial, Helvetica, sans-serif }
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
.style5 {font-family: Arial, Helvetica, sans-serif}
.style6 {color: #0033FF}
.style11 {font-family: Arial, Helvetica, sans-serif; color: #0000FF; }
.style22 {font-family: Arial, Helvetica, sans-serif}
.style15 {font-family: "Footlight MT Light"; font-weight: bold; font-size: 16px; background-color:#E1E1E1 }
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
<script type="text/javascript">
function showKeyCode(e)
{
alert("Inside function showKeyCode(e)");
var keycode =(window.event) ? event.keyCode : e.keyCode;

if(keycode == 116)
{
event.keyCode = 0;
event.returnValue = false;
return false;
}
}
</script>
</head>

<body onload="noBack()" >

<table width="1250" >
  <tr>
    <td width="1248"><%@include file="afterlogintop.jsp" %></td>
  </tr>
   <tr>
    <td height="72"><table width="952" align="center" cellpadding="8">
      <tr>
        <td width="246" height="34" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="681" rowspan="2" bgcolor="#ffffff"><table width="696">
         <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class=" style6">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="688" height="442" ><fieldset>
            <legend><span class="style3">fund transfer</span>            </legend>
            <table width="681" cellpadding="5">
                <tr>
                  <td  colspan="3"><span class="style10 style22">Select an account from which you want to trnasfer fund</span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style10 style22">Account Number</span></td>
                  <td bgcolor="#CCCCCC"><span class="style10 style22">Account Type</span></td>
                  <td bgcolor="#CCCCCC"><span class="style10 style22">Branch</span></td>
                </tr>
                <tr>
                  <td height="40" bgcolor="#F0F0F0"><span class="style10 style22">
                    <input name="radio" type="radio" id="radio" value=" <%= session.getAttribute( "theName1" ) %>" />
                    <%= session.getAttribute( "theName1" ) %></span></td>
                  <td bgcolor="#F0F0F0"><span class="style10 style22"><%= session.getAttribute( "theName2" ) %></span></td>
                  <td bgcolor="#F0F0F0"><span class="style10 style22"><%= session.getAttribute( "theName3" ) %></span></td>
                </tr>
                <tr>
                  <td><span class="style10 style22">Selected Account Number</span></td>
                  <td colspan="2"><span class="style10 style22"><label id="lblacc" ><%=request.getParameter("radio") %></label></span></td>
                </tr>
                <tr>
                  <td colspan="3" bgcolor="#CCCCCC"><span class="style10 style22">Select an beneficiary to transfer fund.</span></td>
                </tr>
              </table>
            </p>
	        <form id="form1" name="form1" method="post" action="verification.jsp">
	          <table width="684" cellpadding="5">
                <tr>
                  <td bgcolor="#0033FF"><a href="addbenificiary.jsp">If U have no beneficiary Add Here</a></td>
                </tr>
              </table>
	          <table width="682" align="center" cellpadding="0">
  <tr>
    <td width="666"><%
try
{

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    int f=0;
    String accno=(String)session.getAttribute("theacc");
    
    String q1="select NAME,ACC,IFSC,LIMIT from BENIFICIARY  where UACC='" + accno + "' AND APROVED='yes' ";
    
    ResultSet rs=smt.executeQuery(q1);
    %>
      <span class="style9">
      <% 
    out.println("<table cellpadding=3>");
    out.print("<tr>");
    out.print("<td bgcolor=#F0F0F0 width=240><span class=style9>ACOUNT NO</span></td><td bgcolor=#F0F0F0 width=230><span class=style9>BENEFICIARY NAME</span></td><td bgcolor=#F0F0F0 width=210><span class=style9>IFSC CODE</span></td><td bgcolor=#F0F0F0 width=210><span class=style9>LIMIT</span></td>");
    out.print("</tr>");
    while(rs.next())
    {
    f=1;
    String s1=rs.getString("ACC");
	String s2=rs.getString("NAME");
	String s4=rs.getString("IFSC");
	String s5=rs.getString("LIMIT");
	
	out.print("<tr>");
    out.print("<td bgcolor=#CCCCCC><span class=style1><input name=radio type=radio  id=radio value="+s1+" />"+s1+"</span></td><td bgcolor=#CCCCCC><span class=style1>"+s2+"</span></td><td  bgcolor=#CCCCCC><span class=style1>"+s4+"</span></td><td bgcolor=#CCCCCC><span class=style1>"+s5+"</span></td>");
    out.print("</tr>");
}
out.print("</table>");
%>
      <% 
                    con.close();
                }

                catch(Exception e){

                }		  
        %>
      </span></td>
  </tr>
  <tr>
    <td><br/>
    <div align="center">
      <p><span class="style22">Enter Transn. Amount:</span>
        <label>
       <input type="text" name="txtamt" id="txtamt" />
        </label>
</p></div></td></tr>
<tr><td height="32"><div align="center">
      <p><span class="style22">Transaction Password:</span> 
        <label>
         <input type="password" name="txtpass" id="txtpass" />
        </label>
      </p></div></td></tr>
       <tr><td></div>
</td>
       </tr>
      <tr><td height="36"><div align="center">
        <input type="submit" name="btnupdate" id="btnupdate" class="style15" value="TRANFER FUND" />   
    </div>
    </td>
  </tr>
</table>

            
                  </form>
	        <table width="680" cellpadding="5">
  <tr>
    <td width="664">
   
         
    </td>
  </tr>
</table>
            </fieldset>
              </td>
          </tr>
        
        </table>        
          <p>&nbsp;</p></td>
      </tr>
      <tr>
        <td height="449" bgcolor="#660033"><table width="217">
          <tr>
            <td width="196"><a href="profile.jsp">Personal Details</a></td>
          </tr>
          <tr>
            <td height="21"><a href="#">Set Account Nick Name</a></td>
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
