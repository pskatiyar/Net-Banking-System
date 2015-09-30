<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ResultSet rs=null;
PreparedStatement psmt=null;
FileInputStream fis;
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
File image=new File("D:/java projects/Net Banking System/WebContent/images/DSCN2327.jpg");
psmt=con.prepareStatement("insert into HELLO(NAME,RNO,IMAGE)"+"values(?,?,?)");
psmt.setString(1,"sudhir singh");
psmt.setString(2,"0828910032");
fis=new FileInputStream(image);
psmt.setBinaryStream(3, (InputStream)fis, (int)(image.length()));
int s = psmt.executeUpdate();
if(s>0) 
{
%>
<b><font color="Blue">
<% out.println("Image Uploaded successfully !"); %>
</font></b>
<%
}
else {
out.println("unsucessfull to upload image.");
}
con.close();
psmt.close();
}catch(Exception ex){
out.println("Error in connection : "+ex);
}
%>
</body>
</html>