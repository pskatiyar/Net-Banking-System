<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" session="true" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My Accounts</title>
<style type="text/css">
<!--
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
.style9 {font-family: Arial, Helvetica, sans-serif; color: #0066FF; }
.style10 {font-family: Arial, Helvetica, sans-serif}
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
.style11 {color: #0033FF}
.style16 {font-family: Arial, Helvetica, sans-serif; color: #0000FF; }
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
    String q1="select ACC_NO,NAME,ACC_TYPE,BALANCE,BRANCH_NAME from user_details where ACC_NO='" + accno + "'";
    ResultSet rs=smt.executeQuery(q1);

    while(rs.next())
    {
    	 String account= rs.getString("ACC_NO");
    	    String cusid= rs.getString("NAME");
    	    String atype= rs.getString("ACC_TYPE");
    	    String balance= rs.getString("BALANCE");
    	    String branch= rs.getString("BRANCH_NAME");
    	   
    	    session.setAttribute( "theName1", account );
    	    session.setAttribute( "theName2", cusid );
    	    session.setAttribute( "theName3", atype );
    	    session.setAttribute( "theName4", balance );
    	    session.setAttribute( "theName5", branch );
    	    
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
    <td height="72"><table width="952" align="center" cellpadding="8">
      <tr>
        <td width="246" height="34" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="681" rowspan="2" bgcolor="#ffffff"><table width="696">
        <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;&nbsp;</a></span><a href="log in.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="688" height="212"><fieldset>
            <legend><span class="style3">Account information</span></legend>
            <table width="676" cellpadding="3">
              <tr>
                <td width="199" height="42"><span class="style5">Account Number</span></td>
                <td width="449"><span class="style10"><%= session.getAttribute( "theName1" ) %></span></td>
              </tr>
              <tr>
                <td><span class="style5">Name</span></td>
                <td><span class="style10"><%= session.getAttribute( "theName2" ) %></span></td>
              </tr>
              <tr>
                <td><span class="style5">Account type</span></td>
                <td><span class="style10"><%= session.getAttribute( "theName3" ) %></span></td>
              </tr>
              <tr>
                <td><span class="style5">Branch</span></td>
                <td><span class="style10"><%= session.getAttribute( "theName5" ) %></span></td>
              </tr>
              <tr>
                <td><span class="style5">Balance</span></td>
                <td><span class="style10"><%= session.getAttribute( "theName4" ) %></span></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            </fieldset>
            </td>
          </tr>
          <tr>
            <td height="294"><fieldset>
            <legend class="style3">last 10 Transactions</legend>
             <%
try
{
	int f=0;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();  
    String accno=(String)session.getAttribute("theacc");
    String q1="select TDATE,MOT,DEBIT,CREDIT,BALANCE from TRANSACTION  where ACC_NO='" + accno + "' ORDER BY tdate desc ";
    
    ResultSet rs=smt.executeQuery(q1);
  
    %>
    <span class="style9">
    <%
    out.println("<table cellpadding=3>");
    out.print("<tr>");
    out.print("<td bgcolor=#F0F0F0 width=170><span class=style9>Date</span></td><td bgcolor=#F0F0F0 width=200><span class=style9>Mode of trans</span></td><td bgcolor=#F0F0F0 width=110><span class=style9>DEBIT</span></td><td bgcolor=#F0F0F0 width=110><span class=style9>CREDIT</span></td><td bgcolor=#F0F0F0 width=130><span class=style9>BALANCE</span></td>");
    out.print("</tr>");
    
    int c=0;
    while(rs.next())
    {
    	f=1;
  
    String s1=rs.getString("TDATE");
	String s2=rs.getString("MOT");
	
	String s4=rs.getString("DEBIT");
	String s5=rs.getString("CREDIT");
	String s6=rs.getString("BALANCE");
	 
	 out.print("<tr>");
     out.print("<td bgcolor=#CCCCCC><span class=style1>"+(s1.substring(0,10))+"</span></td><td bgcolor=#CCCCCC><span class=style1>"+s2+"</span></td><td  bgcolor=#CCCCCC><span class=style1>"+s4+"</span></td><td bgcolor=#CCCCCC><span class=style1>"+s5+"</span></td><td bgcolor=#CCCCCC><span class=style1>"+s6+"</span></td>");
     out.print("</tr>");
     c++;
     if(c==10)
     {
    	 break;
     }
 }
    out.print("</table>");
	if(f==0)
	{
		out.println("NO TRANSACTION FOUND");
	}
    %>
    </span>
    <%  
con.close();
}

catch(Exception e){

}

%>

  
            </fieldset>
            </td>
          </tr>
        </table>        </td>
      </tr>
      <tr>
        <td height="485" bgcolor="#660033"><table width="217">
          <tr>
            <td width="196"><a href="welcome.jsp">Account Summary</a></td>
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
