<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" session="true" import="java.util.*"  import="java.text.DateFormat" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
try
{ int f=0;

	 String v1="";
	 String v2="";
	 String mot="BY NET TRANSFER";
	 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	 Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     
     String accno=(String)session.getAttribute("theacc");
     
     String damt=(String)session.getAttribute("amt");
     
     String ben1 = (String)session.getAttribute( "benacc" );
     
     String q1="select BALANCE from USER_DETAILS  where ACC_NO='" +accno + "' ";
     String q3="select BALANCE from USER_DETAILS  where ACC_NO='" +ben1 + "' ";
     
     ResultSet rs1=smt.executeQuery(q1);
     
     Date date = Calendar.getInstance().getTime();
     DateFormat formatter = new SimpleDateFormat("EEE, dd MMM yyyy");
     String today = formatter.format(date);  
     String s=today.substring(5,16);
     
     
     while(rs1.next())
     {
    	 
    	 v1=rs1.getString("BALANCE");
    	
     }
     ResultSet rs2=smt.executeQuery(q3);
     while(rs2.next())
     {
    	 v2=rs2.getString("BALANCE");
    	 
     }
     
     
     String q2="INSERT INTO TRANSACTION (ACC_NO,TDATE,MOT,DEBIT,BALANCE) VALUES ('" + accno + "','" + s + "','" + mot + "','" + damt + "','" + v1 + "' )";
     String q4="INSERT INTO TRANSACTION (ACC_NO,TDATE,MOT,CREDIT,BALANCE) VALUES ('" + ben1 + "','" + s + "','" + mot + "','" + damt + "','" + v2 + "' )";
     f=smt.executeUpdate(q2);
       smt.executeUpdate(q4);
    
     if(f==1)
     {
    	
    	response.sendRedirect("finalsuccsess.jsp"); 
     }
    
}
     catch (Exception e)
     {
     }
     



%>
</body>
</html>