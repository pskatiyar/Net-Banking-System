<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Emi calulator</title>
<style type="text/css">
<!--
.style12 {
	font-family: "Gemina Condensed";
	font-size: 24px;
}
.style15 {
	font-family: "Footlight MT Light";
	font-weight: bold;
}
.style16 {
	font-family: "Bleeding Cowboys";
	font-size: 24px;
	color: #0066FF;
}
.style17 {color: #000000}
-->
</style>
<script type="text/javascript">

function reset()
{
	document.form1.txt1.value=" ";
	document.form2.txt2.value=" ";
	document.form3.txt3.value=" ";
	document.form4.txt4.value=" ";
	document.form5.txt5.value=" ";
	document.form6.txt6.value=" ";
	
	}

function emi()
{
var a = document.form1.txt1.value;
var b = document.form2.txt2.value;
var c = document.form3.txt3.value;
var n = c;
var r = b/(12*100);
var p = (a * r *Math.pow((1+r),n))/(Math.pow((1+r),n)-1);
var prin = Math.round(p*100)/100;
document.form4.txt4.value = prin;

var totalamountpaid=p*n;
document.form6.txt6.value=totalamountpaid;
var totalinterest=(totalamountpaid-a);
document.form5.txt5.value=totalinterest;

}
</script>
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
           <legend><span class="style4 style1 style16">Quick Views</span></legend>
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
    <td width="703" bgcolor="#FFFFFF"><br/>
     <div align="center" >
       <p>&nbsp;</p>
       <p >Calculate EMI </p>
     </div>
     <hr/>
    <br/>
     <br/>
      
      
    <table width="430"  cellpadding="5">
        <tr>
          <td width="197"><div align="right">Loan Amount(Rs)</div></td>
          <td width="205"><form id="form1" name="form1" method="post" action="">
            <label>
              <input type="text" name="txt1" id="txt1"  />
              </label>
          </form>
          </td>
        </tr>
        <tr>
          <td><div align="right" >Interest Rate</div></td>
          <td><form id="form2" name="form2" method="post" action="">
            <label>
              <input type="text" name="txt2" id="txt2" size="5" />%
              </label>
          </form>
          </td>
        </tr>
        <tr>
          <td><div align="right" >Installment Months</div></td>
          <td><form id="form3" name="form3" method="post" action="">
            <label>
              <input type="text" name="txt3" id="txt3" size="5" />
              </label>
          </form>
          </td>
        </tr>
        <tr>
          <td>
          </td>
          <td><form id="form7" name="form7" method="post" action="">
            <label>
              <input type="button" name="btn2" id="btn2" value="CALCULATE" onclick="emi()"/>
              </label>
            <label>
            <input type="reset" name="btnrst" id="btnrst" value="RESET" onclick="reset()" />
            </label>
          </form>
          </td>
        </tr>
        <tr>
          <td><div align="right" >Monthly EMI</div></td>
          <td><form id="form4" name="form4" method="post" action="">
            <label>
              <input type="text" name="txt4" id="txt4" />
              </label>
          </form>
          </td>
        </tr>
        <tr>
          <td><div align="right" >Total Interest Paid</div></td>
          <td><form id="form5" name="form5" method="post" action="">
            <label>
              <input type="text" name="txt5" id="txt5" />
              </label>
          </form>
          </td>
        </tr>
        <tr>
          <td height="32"><div align="right" >Total Amount Paid</div></td>
          <td><form id="form6" name="form6" method="post" action="">
            <label>
              <input type="text" name="txt6" id="txt6" />
              </label>
          </form>
          </td>
        </tr>
      </table>
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
