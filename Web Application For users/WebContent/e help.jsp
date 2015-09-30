<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>E-help</title>
<style type="text/css">
<!--
.style1 {
	font-family: "Bleeding Cowboys";
	font-size: 24px;
	color: #0066FF;
}
.style4 {
	font-family: "Bleeding Cowboys"
}
.style13 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #000000;
}
.style18 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
}
.style19 {font-family: Arial, Helvetica, sans-serif}
.style20 {font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-weight: bold; }
-->
</style>
</head>

<body>

<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="top.jsp" %></td>
  </tr>
   <tr>
    <td height="1162"><table width="949"  border="0" align="center" >    
<tr>
        
         <td width="226" height="1156" bgcolor="#660033">
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
             <br/>
           </p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p><br/>
           <br/>
           <br/>
           <br/>
           <br/>
         </p>
         <p><br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
           <br/>
         </p></td>
    <td width="713" bgcolor="#FFFFFF"><table width="710" cellpadding="15">
      <tr>
        <td width="554" height="1148">
        <p class="style20" >Getting Started with Internet Banking</p>
        <span class="style19">DDSV Internet Banking service is available to all Savings and   Current account holders. In all cases, the customer/mandate holder   should have the authority to operate the account with full permission.   Please refer to the T&amp;C while registering for Internet Banking. </span>
        <ul >
          <li class="style19">DDSV Internet Banking is a convenient &amp; faster   way to access your account &amp; manage your day to day banking   transactions anytime, anywhere, 24X7 at your own comfort. Now you don't   have to visit the branch all the time &amp; wait in long queues. </li>
          <li class="style19">DDSV's Internet Banking service is secure; our service gives you peace of mind. </li>
          <li class="style19" >Internet Banking is Real Time, giving you up-to-the-second details on your account. </li>
          </ul>
        <h1 align="left" class="style18">Registration Process</h1>
        
          <ul >
            <li class="style19">Fill your account details. </li>
            <li class="style19">Read the instructions over leaf before signing. </li>
            <li class="style19">The form must be signed by all account holders. </li>
            <li class="style19">Submit the form to any of our branch offices </li>
            <li class="style19">While submitting the form at the branch, register   your mobile number for Internet Banking (Netsecure, which is a 2nd   factor authentication and ensures that you enjoy an additional security   layer for all your important online transactions like fund transfer,   bill payment, mobile recharge etc). </li>
            <li class="style19">You can also register your mobile number for Internet Banking by visiting your nearest Axis Bank ATM.to view further details. </li>
          </ul>
        
        <h1 align="left" class="style18">Login Releated </h1>
        <ul>
          <li class="style19">
            To login, you need the log-in id which is usually the 9-digit Customer   ID (mentioned on the welcome letter and printed on your cheque book),   along with the login password sent by DDSV. Some of you might have a   personlized login id.          </li>
          <li class="style19">
            Five consecutive unsuccessful attempts at providing your password will   lock the password. This is applicable for both your Login id and   Transaction passwords. After locking your password, in case you remember   it, you can logon to your account the next day.          </li>
          <li class="style19">
            To generate a new password online, you will need your 16 digit ATM/Debit   Card Number and ATM PIN. (New account holders should have activated   their ATM / Debit Card by using it at an Axis Bank ATM at least once.)          </li>
        </ul>
        <h1 align="left" class="style18" >Fund Transfer Related</h1>
        <ul>
          <li class="style19">
            The daily debit limit is a security feature which limits the amount of   money that can flows from your accounts in a day. The aggregate of your   trasactions cannot exceed more than Rs. 50,000 on a day. You can have   the following combinations of transactions in your default daily   transaction limits:              
              <ul>
                  <li>A maximum of Rs 50000 on  - Fund transfers to self   linked accounts, Other Axis Bank accounts, Creation of Demand Drafts and   Axis Bank Credit Card Bill Payment under Credit Card section. </li>
                <li >In addition to the above, a maximum of Rs 50000 on   Fund transfers to Other Bank Accounts (NEFT), Bill Payments, Mobile   Recharges,Creation of Virtual Cards and Direct Debit transactions   (Payment made using DDSV Internet Banking at various merchants   website). </li>
              </ul>
          </li>
        </ul>
        </td>
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
