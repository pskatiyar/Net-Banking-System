<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" autoFlush="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String j=(String)session.getAttribute("code");
System.out.println(j);
String j1=request.getParameter("textfield");
if(j1.equals(j))
{
	String mm= " ";
    session.setAttribute("mssg", mm);
	response.sendRedirect("midthirdparty.jsp");
	
}
if(!j1.equals(j))
{
	response.sendRedirect("verification.jsp");
	String mm="The code you entered didn't verify";
	session.setAttribute("mssg", mm);
}
%>
</body>
</html>