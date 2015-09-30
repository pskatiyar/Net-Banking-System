<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>interest calculator</title>
<style type="text/css">
<!--
.style1 {
	font-family: "Footlight MT Light";
	font-weight: bold;
}
.style3 {font-size: 18px}
.style4 {color: #FF0000}
.style7 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style8 {font-family: "Footlight MT Light"}
.style9 {
	font-family: "Bleeding Cowboys";
	font-size: 24px;
}
.style11 {font-family: "Footlight MT Light"; color: #0066FF; }
-->
</style>
<script language="javascript" type="text/javascript">
function interest()
{
var amount=Number(document.form1.txtbox.value);
var rate=Number(document.form1.txtbox1.value);
var duration=Number(document.form1.txtbox2.value);

var interest=(amount*rate*duration)/100;
var finalAmount=(amount+interest);
document.form1.txtresult.value=interest;
document.form1.txtfvalue.value=finalAmount;
}
</script>
</head>

<body>

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="top.jsp" %></td>
  </tr>
   <tr>
    <td height="204"><table width="956"  border="0" align="center" >    
<tr>
         
         <td width="244" height="198" bgcolor="#660033" align="char">
         <table width="200" border="0">
  <tr>
    <td height="250">
     <fieldset>
           <legend><span class="style4 style1 style9"><span class="style11">Quick Views</span></span></legend>
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
  </tr>
</table>

         </td>
    <td width="702" bgcolor="#FFFFFF" align="justify"><h1 class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u> Calculate Interest</u></h1>
      <p ><span class="style1">&nbsp;&nbsp; </span><span class="style8"><span class="style7">Use this Calculator to calculate the Final value of your Investment.</span></span></p>
      <p  class="style7"> &nbsp;&nbsp; And What amount of interest you earned.&nbsp;</p>
      <form id="form1" name="form1" method="post" action="">
        <p class="style1">
      <label><span class="style3">&nbsp;&nbsp; Investment Amount:<span class="style4">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
          <input type="text" name="txtbox" id="txtbox" />
          </label>
      </p>
        <p class="style1">
          <label><span class="style3">&nbsp; &nbsp;Interest Rate on Investment:</span><span class="style4"> *</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="text" name="txtbox1" id="txtbox1" />
          </label>
        </p>
        <p class="style1">
          <label><span class="style3">&nbsp;  &nbsp;Duration of Investment:</span><span class="style4">* </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="text" name="txtbox2" id="txtbox2" />
          </label>
        </p>
        <p class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="Calculate" type="button" value="Calculate" onclick="javascript:interest();"/>
        <label>
        <input type="submit" name="btnreset" id="btnreset" value="Reset" onclick="clear()"/>
        </label>
        </p>
        <p class="style1"><span class="style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interest Earned:
            <label> &nbsp;</label>
        </span>
          <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="text" name="txtresult" id="txtresult" />
          </label>
        </p>
        <p class="style1">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style3">Final Value of Investment:&nbsp;&nbsp;&nbsp;&nbsp; </span> 
          <label>
          <input type="text" name="txtfvalue" id="txtfvalue" />
          </label>
        </p>
        <p class="style1 style4"> &nbsp;&nbsp;* Please fill The Star marked Values</p>
      </form>      </td>
  </tr>
     </table></td>
  </tr>
  <tr>
    <td height="20"><%@include file="footer.jsp" %></td>
  </tr>
</table>
</body>
</html>
