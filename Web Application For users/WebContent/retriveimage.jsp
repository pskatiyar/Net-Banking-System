<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>sudh</title>
</head>
<body>
<% 
Statement stmt = null;
ResultSet rs = null;
try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT IMAGE FROM HELLO WHERE ACNO = '0828910032'");

if (rs.next())
{
	InputStream sImage;
	byte[] bytearray = new byte[1048576];
    int size=0;
    sImage = rs.getBinaryStream(1);
    response.reset();
    response.setContentType("image/jpeg");
    while((size=sImage.read(bytearray))!= -1 ){
    response.getOutputStream().write(bytearray,0,size);
    }
} 
    else 
    {
      out.println("Display Blob Example");
      out.println("image not found for given id>");
      return;
    }
  } 
   catch (Exception e) 
   {
          out.println("Unable To Display image");
          out.println("Image Display Error=" + e.getMessage()); 
          return;
     } 
%> 
</body>
</html>