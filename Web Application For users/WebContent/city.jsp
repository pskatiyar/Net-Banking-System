<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Atm locator</title>
<style type="text/css">
<!--
.style1 {
	font-family: "Bleeding Cowboys";
	font-size: 24px;
	color: #0066FF;
}
.style2 {
	font-family: "Footlight MT Light";
	font-size: 24px;
	font-weight: bold;
	color: #0066FF;
}
.style4 {font-size: 16px; color: #0066FF; font-family: Arial, Helvetica, sans-serif;}
.style5 {font-size: 16px; color: #000000; font-family: Arial, Helvetica, sans-serif; }
.style6 {font-family: Arial, Helvetica, sans-serif}
-->
</style>
</head>

<body>

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="top.jsp" %></td>
  </tr>
   <tr>
    <td height="204"><table width="955"  border="0" align="center" >    
<tr>
         
         <td width="240" height="198" bgcolor="#660033">
         <fieldset>
           <legend><span class="style4 style1 style1"><span class="style1">Quick Views</span></span></legend>
           <p><a href="atm locator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/atm.png" width="200" height="16" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="branch locator.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/branch.png" width="220" height="16" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="photo.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/photo gallery.png" width="220" height="16" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="career.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/careers.png" width="170" height="15" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="loans.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/loans.png" width="110" height="15" vspace="4" align="middle" style="border:hidden"/></a>
         <hr/>
         <a href="downloads.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/downloads.png" width="180" height="16" vspace="4" align="middle" style="border:hidden"/></a>     
         <hr/>
         <a href="contact us.jsp"><img src="D:/java projects/Net Banking System/WebContent/images/cantact.png" width="180" height="16" vspace="4" align="middle" style="border:hidden"/></a></p>
           </fieldset> 
         </td>
    <td width="703" bgcolor="#FFFFFF"><table width="556" height="320" cellpadding="25">
      <tr>
        <td width="500" height="314"><p class="style2">ATM LOCATOR</p>
          <p class="style5">now you can search our atm in your area. by following these easy steps</p>
          <p class="style5">.</p>
          <form id="form1" name="form1" method="post" >

              <label><span class="style6">Select State:&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <select name="liststate" size="1" id="liststate" >
              
                <option>Uttar pradesh</option>
                <option>Bihar</option>
                <option>Delhi</option> 
              </select>
              <br />
              <br />
              
              <span class="style6">Select City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label>
            <label>
            <select name="listcity" size="1" id="listcity" >
            <option value=0>select</option>
                     
            <%
       
            try{
            	  
        String var1=request.getParameter("liststate");
        String var2=request.getParameter("listcity");
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
		Connection conn=DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
		PreparedStatement stmt=conn.prepareStatement("select city from ATMLOCATOR where state='" + var1 + "'");
		ResultSet rs=stmt.executeQuery();
		//PreparedStatement stmt1=conn.prepareStatement("select ADDRESS1 from ATMLOCATOR where city='" + var2 + "'");
		//ResultSet rs1=stmt.executeQuery();
		while(rs.next())
		{
			
			%>
			<option ><%=rs.getString("city")%></option>
			<%

		}
		
		//while(rs1.next())
	//	{
		//	String s1=rs.getString("address1");
			//System.out.println(s1);
		//}
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
              
            %>
            </select>
            </label>
            <p>
              <label>
              <input type="submit" name="btnatmlocator"  id="btnatmlocator" value="LOCATE ATM" />
              </label>
            </p>

          </form>          
          <p class="style5">&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
     </table></td>
  </tr>
  <tr>
    <td height="20"><%@include file="footer.jsp" %></td>
  </tr>
</table>
</body>
</html>

