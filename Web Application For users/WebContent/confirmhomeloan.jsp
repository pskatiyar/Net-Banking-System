<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>home loan confirm</title>
<style type="text/css">
<!--
.style1 {
	font-family: "Bleeding Cowboys";
	font-size: 22px;
	color: #0066FF;
}
.style3 {color: #FF0000}
.style5 {
	font-family: "Footlight MT Light";
	font-size: 28px;
	font-weight: bold;
	color: #0033FF;
}
.style6 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; }
.style8 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; color: #0000FF; }
-->
</style>
</head>

<body>

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="top.jsp" %></td>
  </tr>
   <tr>
    <td height="452"><table width="955"  border="0" align="center" >    
<tr>
         
         <td width="227" height="446" bgcolor="#660033">
<fieldset>
           <legend><span class="style3 style1 style1">Quick Views</span></legend>
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
<p><br/>
</p>
</td>
         <td width="718" bgcolor="#FFFFFF"><form id="form1" name="form1" method="post" action="">
           <h1 class="style6"><span class="style5">&nbsp;HOME LOAN FORM</span></h1>
          <h1 class="style6">&nbsp;&nbsp;It takes just 1 simple steps to apply for DDSv Bank home Loan online</h1>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
           <table width="493" align="center" cellpadding="5">
             <tr>
               <td width="372">
                 <span >
                 <%
try
{
	int c=0;int j=0;
	String s1=request.getParameter("txtaccount");
	String s2=request.getParameter("txtcustid");
	String s3=request.getParameter("listatype");
	String s4=request.getParameter("txtname");
	String s5=request.getParameter("lstgen");
	String s6=request.getParameter("listoccupation");
	String s7=request.getParameter("txtincome");
	String s8=request.getParameter("txtfname");
	String s9=request.getParameter("txtbcode");
	String s10=request.getParameter("txtbname");
	String s11=request.getParameter("txtloanduration");
	String s12=request.getParameter("txtphone");
	String s13=request.getParameter("txtemail");
	String s14=request.getParameter("txtaddress");
	String s15=request.getParameter("txtcity");
	String sf=request.getParameter("txtpin");
	String s16=request.getParameter("txtstate");
	String s17="pending";
			
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    String q1="SELECT * FROM HLOAN WHERE HACC='" +s1+ "'";
    
    ResultSet r=smt.executeQuery(q1);
    
    while(r.next())
    {
    c++;
    
    }
    
    String q3="SELECT ACC_NO FROM USER_DETAILS where CUS__ID='" +s2+ "'";
    ResultSet r2=smt.executeQuery(q3);
    
   while(r2.next())
   {
   String ano=r2.getString("ACC_NO");
   
   if(ano.equals(s1))
   { 
	   j=1;
   }
   }
    
    String q2="INSERT INTO HLOAN  VALUES('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"','"+s11+"','"+s12+"','"+s13+"','"+s14+"','"+s15+"','"+sf+"','"+s16+"','"+s17+"')";
    if(c==0 && j==1)
    {
    	smt.executeUpdate(q2);
    	out.println("success");
    }
    if(c==1)
    {
    	out.println("request pending");
    }
    if(j==0)
    {
    	out.println("account no. or cus id not matched");
    }
}

catch(Exception e)
{

}

%>
                 </span></td>
             </tr>
           </table>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
         </form>
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
