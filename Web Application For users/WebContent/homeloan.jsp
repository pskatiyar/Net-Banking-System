<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>home loan</title>
<style type="text/css">
<!--
.style1 {
	font-family: "Bleeding Cowboys";
	font-size: 22px;
	color: #0066FF;
}
.style2 {
	font-family: Arial, Helvetica, sans-serif
}
.style3 {color: #FF0000}
.style4 {color: #FF0000; font-family: Arial, Helvetica, sans-serif; }
.style5 {
	font-family: "Footlight MT Light";
	font-size: 28px;
	font-weight: bold;
	color: #0033FF;
}
.style6 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; }
-->
</style>
</head>

<body>

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="top.jsp" %></td>
  </tr>
   <tr>
    <td height="610"><table width="955"  border="0" align="center" >    
<tr>
         
         <td width="227" height="604" bgcolor="#660033">
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
    <br/><br/><br/><br/><br/>
  </p>
<p>&nbsp;</p>
<p><br/>
  <br/>
</p>
</td>
         <td width="718" bgcolor="#FFFFFF"><form id="form1" name="form1" method="post" action="confirmhomeloan.jsp">
           <h1 class="style6"><span class="style5">&nbsp;HOME LOAN FORM</span></h1>
          <h1 class="style6">&nbsp;&nbsp;It takes just 1 simple steps to apply for DDSv Bank home Loan online</h1>
           <table width="714" border="0" cellpadding="10">
             <tr>
               <td width="329" height="511"><label class="style2" >Account Number: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="text" name="txtaccount" id="txtaccount" />
               </label>
                 <p>
                   <label class="style2">Customer Id: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="text" name="txtcustid" id="txtcustid" />
                   </label>
                 </p>
                 <p>
                   <label class="style2">Account Type: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <select name="listatype" id="listatype">
                     <option>savings</option>
                     <option>current</option>
                     <option selected="selected">credit</option>
                   </select>
                   </label>
                 </p>
                 <p>
                   <label class="style2">Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="text" name="txtname" id="txtname" />
                   </label>
                 </p>
                 <label class="style2">Gender:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                 <label>
                 <select name="lstgen" id="lstgen">
                   <option>male</option>
                   <option>female</option>
                 </select>
                 </label>
                 <p>
                   <label class="style2">Occupation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <select name="listoccupation" id="listoccupation">
                     <option>salaried</option>
                     <option>not employed</option>
                     <option>business man</option>
                     <option>self employed</option>
                   </select>
                   </label>
                 </p>
                 <p class="style2">Net Income: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <label>
                     <input type="text" name="txtincome" id="txtincome" />
                     </label>
                 </p>
                 <p>
                   <label class="style2">Loan Amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="text" name="txtfname" id="txtfname" />
                   </label>
                    <p>
              <label class="style2">Branch Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="text" name="txtbcode" id="txtbcode" />
              </label>
            </p>
            <p>
              <label class="style2">Branch Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
              <input type="text" name="txtbname" id="txtbname" />
              </label>
            </p>
                 </p>
                 <p>&nbsp;</p><p>&nbsp;</p>
                 <p>&nbsp;</p>
                 </td>
               <td width="353"><span class="style2">Loan Duration:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <label>
            <input type="text" name="txtloanduration" id="txtloanduration" />
            </label>
            <p>
              <label class="style2">Phone Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="text" name="txtphone" id="txtphone" />
              </label>
            </p>
             <p>
              <label class="style2">E-mail:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
              <input type="text" name="txtemail" id="txtemail" />
              </label>
            </p>
             <p><span class="style2">Address:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
               <label>
               <input type="text" name="txtaddress" id="txtaddress" />
               </label>
             </p>
             <p>
               <label><span class="style2">City:</span>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="text" name="txtcity" id="txtcity" />
               </label>
             </p>
             <p class="style2">Pin:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
               <label>
               <input type="text" name="txtpin" id="txtpin" />
               </label>
             </p>
             <p class="style2">
               <label>State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
               <input type="text" name="txtstate" id="txtstate" />
               </label>
             </p>
             
             <p>
             <label> &nbsp; &nbsp; &nbsp; &nbsp;<br />
             &nbsp; 
              <input type="submit" name="btnsubmit" id="btnsubmit" value="SUBMIT"/>
              </label>
            
             <label>
             <input type="button" name="btncancel" id="btncancel" value="CANCEl"/>
              </label>
            </p>
             <p>&nbsp;</p>
             <p class="style4">* Please insert these values.</p>
             </td>
             </tr>
           </table>
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
