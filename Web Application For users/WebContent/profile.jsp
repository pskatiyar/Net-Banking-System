<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" session="true" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>profile</title>
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
.style11 {color: #0033FF}
.style14 {font-family: Arial, Helvetica, sans-serif; color: #000000; }
.style16 {font-size: 16px}
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

                 <%
try
{

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    
    String accno=(String)session.getAttribute("theacc");
    String q1="select ACC_NO,NAME,ANIK,GENDER,PHONE_NO,ACC_TYPE,BRANCH_NAME,ADDRESS,CITY,PIN,STATE,NATIONALITY,IFSC from user_details where ACC_NO='" + accno + "'";
    ResultSet rs=smt.executeQuery(q1);

    while(rs.next())
    {
    	 String account= rs.getString("ACC_NO");
    	    String name= rs.getString("NAME");
    	    String nikname= rs.getString("ANIK");
    	    String gender= rs.getString("GENDER");
    	    String phone= rs.getString("PHONE_NO");  
    	    String atype= rs.getString("ACC_TYPE");
    	    
    	    String branch= rs.getString("BRANCH_NAME");
    	    String address= rs.getString("ADDRESS");
    	    String city= rs.getString("CITY");
    	    String pin= rs.getString("PIN");
    	    String state= rs.getString("STATE");
    	    String nation= rs.getString("NATIONALITY");
    	    String ifsc= rs.getString("IFSC");
    	      
    	    session.setAttribute( "Name1", account );
    	    session.setAttribute( "Name2", name );
    	    session.setAttribute( "Name3", nikname );
    	    session.setAttribute( "Name4", gender );
    	    session.setAttribute( "Name5", phone );
    	    session.setAttribute( "Name6", atype );
    	    session.setAttribute( "Name7", branch );
    	    session.setAttribute( "Name8", address );
    	    session.setAttribute( "Name9", city );
    	    session.setAttribute( "Name10", pin );
    	    session.setAttribute( "Name11", state );
    	    session.setAttribute( "Name12", nation );
    	    session.setAttribute( "Name13", ifsc );
    	    
    }
    
    con.close();
}

catch(Exception e){

}

%>
<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="afterlogintop.jsp" %></td>
  </tr>
  <tr>
    <td height="355"><table width="953" align="center" cellpadding="10">
      <tr>
        <td width="220" height="38" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="685" rowspan="2" bgcolor="#ffffff"><table width="685">
         <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="677" height="469"><fieldset>
              <legend><span class="style3">personal details</span></legend>
              <table width="664" cellpadding="5">
                <tr>
                  <td width="195" height="43" bgcolor="#CCCCCC"><span class="style14">Account Number</span></td>
                  <td width="441" bgcolor="#C8D5E4"><span class="style14"><%= session.getAttribute( "Name1" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Name</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name2" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Nik Name</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name3" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Gender</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name4" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Phone Number</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name5" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Account Type</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name6" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Branch</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name7" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Address</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name8" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">City</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name9" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Pin Code</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name10" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">State</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name11" ) %></span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style14">Nationality</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name12" ) %></span></td>
                </tr>
                <tr>
                  <td height="28" bgcolor="#CCCCCC"><span class="style14">IFSC Code</span></td>
                  <td bgcolor="#C8D5E4"> <span class="style14"><%= session.getAttribute( "Name13" ) %></span></td>
                </tr>
              </table>
              <p>&nbsp;</p>
              </fieldset></td>
          </tr>
        </table>
          <p>&nbsp;</p></td>
      </tr>
      <tr>
        <td height="538" bgcolor="#660033"><table width="217">
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
