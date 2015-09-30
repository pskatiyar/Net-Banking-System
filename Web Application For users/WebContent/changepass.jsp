<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" session="true" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>change password</title>
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	color: #990000;
}
.style5 {color: #0000CC}
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
.style10 {font-family: "Footlight MT Light"; font-weight: bold; font-size: 16px; background-color:#E1E1E1 }
.style11 {color: #0033FF}
.style12 {font-family: Arial, Helvetica, sans-serif}
.style14 {font-family: Arial, Helvetica, sans-serif; color: #000000; }
.style15 {font-family: Arial, Helvetica, sans-serif; color: #0033FF; }
.style16 {font-family: Arial, Helvetica, sans-serif; color: #0000CC; }
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
    <td height="355"><table width="953" align="center">
      <tr>
        <td width="220" height="20" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="685" rowspan="2" bgcolor="#ffffff"><table width="714">
         <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="706" height="528"><fieldset>
              <legend><span class="style3">Change password</span></legend>
              <table width="699" height="506" cellpadding="5">
                <tr>
                  <td width="333" height="500"><form id="form1" name="form1" method="post" action="changepass.jsp">
                    <table width="321" cellpadding="5">
                      <tr>
                        <td colspan="2"><span class="style15">LOGIN PASSWORD</span></td>
                      </tr>
                      <tr>
                        <td width="133"><span class="style14">Current Password</span></td>
                        <td width="160"><span class="style12">
                          <label>
                          <input type="password" name="txtlcurrent" id="txtlcurrent" />
                          </label>
                        </span></td>
                      </tr>
                      <tr>
                        <td><span class="style14">New Password</span></td>
                        <td><span class="style12">
                          <label>
                          <input type="password" name="txtlnew" id="txtlnew" />
                          </label>
                        </span></td>
                      </tr>
                      <tr>
                        <td><span class="style14">Confirm Password</span></td>
                        <td><span class="style12">
                          <label>
                          <input type="password" name="txtlconfirm" id="txtlconfirm" />
                          </label>
                        </span></td>
                      </tr>
                      <tr>
                        <td height="53" colspan="2"><label>
                          
                          <div align="right">
                            <input type="submit" class="style10" name="btnlchange" id="btnlchange" value="CHANGE PASSWORD" />
                          </div>
                            </label></td>
                      </tr>
                    </table>
                                    <br/>
                                         </form>
                                    <%
try
{

	String cp1=request.getParameter("txtlcurrent");
	String cp2=request.getParameter("txtlnew");
	String cp3=request.getParameter("txtlconfirm");
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    
    String accno=(String)session.getAttribute("theacc");
    String q1="select NPASS from USER_DETAILS where ACC_NO='" + accno + "'";
    String q2="update USER_DETAILS set NPASS='" + cp2 + "' where ACC_NO='" + accno + "'";
    ResultSet rs=smt.executeQuery(q1);
    boolean i,j;
while(rs.next())
{
	String s1=rs.getString("NPASS");
	j=(cp1.equals(s1));
	i=cp2.equals(cp3);
    if(cp1.equals(s1))	
{
    	
	if(cp2.equals(cp3))
	{
		
		smt.executeUpdate(q2);
		%>
		<p class="style1 style5">
		<% 
		out.println("PASSWORD CHANGED SUCCESSFULLY");%>
		</p>
		<% 
	}
	
	
}
    
    if(!j)
    {
    	%>
		<p class="style1">
		<%
    	out.println("CURRENT PASSWORD NOT MATCHED");
		%>
		</p>
		<% 
    }
    if(!i)
	{
    	%>
		<p class="style1">
		<%
		out.println("NEW AND CONFIRM PASSWORD NOT MATCHED");
		%>
		</p>
		<p>
		  <% 
	}
}
    con.close();
}

catch(Exception e){

}

%>            
		  </p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p></td>
                  <td width="338"><form id="form2" name="form2" method="post" action="changepass.jsp">
                    <table width="338" cellpadding="5">
                      <tr>
                        <td colspan="2"><span class="style15">TRANSACTION PASSWORD</span></td>
                      </tr>
                      <tr>
                        <td width="136"><span class="style14">Current Password</span></td>
                        <td width="174"><span class="style12">
                          <label>
                          <input type="password" name="txttcurrent" id="txttcurrent" />
                          </label>
                        </span></td>
                      </tr>
                      <tr>
                        <td><span class="style14">New Password</span></td>
                        <td><span class="style12">
                          <label>
                          <input type="password" name="txttnew" id="txttnew" />
                          </label>
                        </span></td>
                      </tr>
                      <tr>
                        <td><span class="style14">Confirm Password</span></td>
                        <td><span class="style12">
                          <label>
                          <input type="password" name="txttconfirm" id="txttconfirm" />
                          </label>
                        </span></td>
                      </tr>
                      <tr>
                        <td height="53" colspan="2"><label>
                          
                            <div align="right">
                              <input type="submit" class="style10" name="btntchange" id="btntchange" value="CHANGE PASSWORD" />
                            </div>
                            </label></td>
                      </tr>
                    </table>
                                    <br/>
                                         </form>
                                    <%
try
{

	String cp1=request.getParameter("txttcurrent");
	String cp2=request.getParameter("txttnew");
	String cp3=request.getParameter("txttconfirm");
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    
    String accno=(String)session.getAttribute("theacc");
    String q1="select TPASS from USER_DETAILS where ACC_NO='" + accno + "'";
    String q2="update USER_DETAILS set TPASS='" + cp2 + "' where ACC_NO='" + accno + "'";
    ResultSet rs=smt.executeQuery(q1);
    boolean i,j;
while(rs.next())
{
	String s1=rs.getString("TPASS");
	j=(cp1.equals(s1));
	i=cp2.equals(cp3);
    if(cp1.equals(s1))	
{
    	
	if(cp2.equals(cp3))
	{
		
		smt.executeUpdate(q2);
		%>
		<p class="style1 style5">
		<% 
		out.println("PASSWORD CHANGED SUCCESSFULLY");
		%>
		</p>
		<% 
	}
	
	
}
    
    if(!j)
    {
    	%>
		<p class="style1">
		<%
    	out.println("CURRENT PASSWORD NOT MATCHED");
		%>
		</p>
		<p>
		  <% 
    }
    if(!i)
	{
		out.println("NEW AND CONFIRM PASSWORD NOT MATCHED");
	}
}
    con.close();
}

catch(Exception e){

}

%>           
		  </p>
		<p>&nbsp;</p>
		<p>&nbsp;</p></td>
                </tr>
              </table>
              </fieldset></td>
          </tr>
        </table>
          <p class="style16">Please periodicaly change your sucure password to prevent theafts. and never reveal your password to any one.</p>
          <p>&nbsp;</p>
          </td>
      </tr>
      <tr>
        <td height="634" bgcolor="#660033"><table width="217">
          <tr>
            <td width="196"><a href="profile.jsp">Personal Details</a></td>
          </tr>
          <tr>
            <td height="21"><a href="nikname.jsp">Set Account Nick Name</a></td>
          </tr>
          <tr>
            <td><a href="changepass.jsp">Change password</a></td>
          </tr>
          <tr>
            <td><a href="benificiary.jsp">Manage benificiary</a></td>
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
