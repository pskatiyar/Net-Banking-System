<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>register</title>
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
	font-size: 30px;
	font-weight: bold;
	color: #0033FF;
}
.style6 {font-family: "Footlight MT Light"; font-weight: bold; font-size: 16px; background-color:#E1E1E1 }
-->
</style>

<script type='text/javascript'>
function emailValidator(elem, helperMsg){
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if(elem.value.match(emailExp)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
</script>
<script type='text/javascript'>
function isNumeric(elem, helperMsg){
	var numericExpression = /^[0-9]+$/;
	if(elem.value.match(numericExpression)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}

function mobile()
{
	 
    var y = document.getElementById('mobile_number').value;
          if(isNaN(y)||y.indexOf(" ")!=-1)
          {
             alert("Invalid Mobile No. please enter mobile number");
             document.getElementById('mobile_number').focus();
             return false;
          }
        
          if (y.length>10 || y.length<10)
          {
               alert("Mobile No. should be 10 digit");
               document.getElementById('mobile_number').focus();
               return false;
          }
          if (!(y.charAt(0)=="9" || y.charAt(0)=="8"))
          {
               alert("Mobile No. should start with 9 or 8 ");
               document.getElementById('mobile_number').focus();
               return false;
          }
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
<p><br/>
</p></td>
    <td width="718" bgcolor="#FFFFFF"><table width="685" border="0" cellpadding="15">
      <tr >
        <td height="63" colspan="2"><div align="center" class="style5">NET BANKING FORM</div></td>
       
      </tr>
      <tr>
        
        <td width="456" ><form  action="confirm.jsp" method="post">
          <label class="style2" >Account Number: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="txtaccount" id="numbers" />
            </label>
          <p>
            <label class="style2">Customer Id: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="txtcustid" id="number" />
            </label>
          </p>
          <p>
            <label class="style2">IFSC code: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="txtifsc" />
            </label>
          </p>
        
        
             <p>
             <label>
              <input type="submit" class="style6"/>
              </label>
            
             <label>
             <input type="reset" class="style6"/>
              </label>
            </p>
             <p>&nbsp;</p>
             <p class="style4">* Please insert these values.</p>
        </form>
        </td>
      </tr>
    </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
  </tr>
     </table></td>
  </tr>
  <tr>
    <td height="20"><%@include file="footer.jsp" %></td>
  </tr>
</table>

<script type="text/javascript">
	//Generates the captcha function   
	    var a = Math.ceil(Math.random() * 9)+ '';
	    var b = Math.ceil(Math.random() * 9)+ '';      
	    var c = Math.ceil(Math.random() * 9)+ ''; 
	    var d = Math.ceil(Math.random() * 9)+ ''; 
	    var e = Math.ceil(Math.random() * 9)+ ''; 
	    var f = Math.ceil(Math.random() * 9)+ ''; 
	       
	    var code = a + b + c + d + e+f;
	    document.getElementById("txtCaptcha").value = code;
	    document.getElementById("txtCaptchaDiv").innerHTML = code; 
	</script>
	
	<script type="text/javascript">
	function checkform(theform){
	    var why = "";
	      
	    if(theform.txtInput.value == ""){
	        why += "- Security code should not be empty.\n";
	    }
	    if(theform.txtInput.value != ""){
	        if(ValidCaptcha(theform.txtInput.value) == false){
	            why += "- Security code did not match.\n";
	        }
	    }
	    if(why != ""){
	        alert(why);
	        return false;
	    }
	}
	     
	// Validate the Entered input aganist the generated security code function  
	function ValidCaptcha(){
	    var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
	    var str2 = removeSpaces(document.getElementById('txtInput').value);
	    if (str1 == str2){
	        return true;   
	    }else{
	        return false;
	    }
	}
	 
	// Remove the spaces from the entered and generated code
	function removeSpaces(string){
	    return string.split(' ').join('');
	}
	     
	</script>
</body>
</html>
