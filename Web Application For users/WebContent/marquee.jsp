<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>marquee</title>
<style type="text/css">
<!--
.style1 {
	font-family: "Bleeding Cowboys";
	font-size: 24px;
	color: #0066FF;
}
.style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
	color: #0000FF;
	font-weight: bold;
}
.style3 {font-family: Arial, Helvetica, sans-serif}
.style4 {font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
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
           <legend><span class="style4 style1 style1">Quick Views</span></legend>
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
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;              </p></td>
    <td width="703" bgcolor="#FFFFFF"><table width="674" height="96" align="center" cellpadding="5">
      <tr>
        <td width="672" height="29"><div align="center"><span class="style2">New Interest Rates</span></div></td>
      </tr>
      <tr>
        <td><p class="style3">SAVINGS BANK DEPOSITS:</p>
          <p class="style3"><strong>RATE OF INTEREST</strong> : <span lang="EN-GB" xml:lang="EN-GB">4.00% p.a.</span></p>
          <p><span class="style4">HOME LOANS - INTEREST RATES:</span><span class="style3">(Base Rate= 10.00% p.a.)</span></p>
          <table width="549" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="173" height="46" valign="top"><p align="center" class="style3"><strong>Loan Amount</strong></p></td>
              <td valign="top" width="224"><p align="center" class="style3"><strong>Linkage with Base Rate over the tenor of the loan</strong></p></td>
              <td valign="top" width="150"><p align="center" class="style3"><strong>Effective Rate </strong></p></td>
            </tr>
            <tr>
              <td width="173" height="32" valign="top"><p class="style3">Upto Rs. 30.00 lacs</p></td>
              <td valign="top" width="224"><p class="style3">0.75% above Base Rate</p></td>
              <td valign="top" width="150"><p class="style3">10.75% p.a.*</p></td>
            </tr>
            <tr>
              <td width="173" height="48" valign="top"><p class="style3">Above Rs. 30.00 lacs and upto Rs. 75.00 lacs </p></td>
              <td valign="top" width="224"><p class="style3">1.00% above Base Rate</p></td>
              <td valign="top" width="150"><p class="style3">11.00% p.a.*</p></td>
            </tr>
            <tr>
              <td width="173" height="43" valign="top"><p class="style3">Above Rs. 75.00 lacs</p></td>
              <td valign="top" width="224"><p class="style3">1.25% above Base Rate</p></td>
              <td valign="top" width="150"><p class="style3">11.25% p.a.*</p></td>
            </tr>
            <tr>
              <td height="50" colspan="3" valign="top"><p class="style3">No fixed rate option in any limit bracket.</p></td>
            </tr>
          </table>          
          <p class="style4">EDUCATION LOAN SCHEME-</p>
          <table height="159" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="207" height="41" valign="top"><p class="style3"><strong>Loan Amount</strong> </p></td>
              <td valign="top" width="337"><p class="style3"><strong> Rate of Interest (w.e.f. 27.02.2012)</strong> </p></td>
            </tr>
            <tr>
              <td width="207" height="38" valign="top"><p class="style3">For loans upto Rs.4 lacs </p></td>
              <td valign="top" width="337"><p class="style3">350 bps above Base Rate, currently 13.50% p.a.</p></td>
            </tr>
            <tr>
              <td width="207" height="48" valign="top"><p class="style3">Above Rs.4 lacs and upto Rs.7.50 lacs </p></td>
              <td valign="top" width="337"><p class="style3">325 bps above Base Rate, currently 13.25% p.a.</p></td>
            </tr>
            <tr>
              <td valign="top" width="207"><p class="style3">Above Rs.7.50 lacs </p></td>
              <td valign="top" width="337"><p class="style3">200 bps above Base Rate, currently 12.00% p.a.</p></td>
            </tr>
          </table>          
          <p class="style4">&nbsp; </p></td>
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
