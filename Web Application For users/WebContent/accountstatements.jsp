<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>account statements</title>
<style type="text/css">
<!--
.style2 {
	font-family: "Gemina Condensed";
	color: #0066FF;
}
.style3 {font-family: "Gemina Condensed"}
.style10 {font-family: "Footlight MT Light"; font-weight: bold; font-size: 16px; background-color:#E1E1E1 }
.style4 {
	font-family: "Gemina Condensed";
	font-weight: bold;
}
a {
	font-family: Arial, Helvetica, sans-serif;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 18px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #CC66FF;
}
a:hover {
	text-decoration: none;
	color: #0066FF;
}
a:active {
	text-decoration: none;
	color: #FFFFFF;
}
.style5 {font-family: Arial, Helvetica, sans-serif}
.style6 {font-family: Arial, Helvetica, sans-serif; color: #990033; }
.style7 {color: #0033FF}
.style9 {font-family: Arial, Helvetica, sans-serif; color: #0066FF; }
-->
</style>

 <script type="text/javascript">
 function noBack()
 {
 window.history.forward(1);
 }
 
 var message="Right Click is not possible Here !";
 function click(e) {
 if (document.all) {
 if (event.button == 2) {
 alert(message);
 return false;
 }
 }
 if (document.layers) {
 if (e.which == 3) {
 alert(message);
 return false;
 }
 }
 }
 if (document.layers) {
 document.captureEvents(Event.MOUSEDOWN);
 }
 document.onmousedown=click;
</script>

<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />

<script type="text/javascript" src="jquery.1.4.2.js"></script>
<script type="text/javascript" src="jsDatePick.jquery.min.1.3.js"></script>

<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"txtstart",
			dateFormat:"%d-%M-%Y"
			/*selectedDate:{				This is an example of what the full configuration offers.
				day:5,						For full documentation about these settings please see the full version of the code.
				month:9,
				year:2006
			},
			yearsRange:[1978,2020],
			limitToToday:false,
			cellColorScheme:"beige",
			dateFormat:"%m-%d-%Y",
			imgPath:"img/",
			weekStartDay:1*/
		});
	};
</script>
</head>

<body onload="noBack()">
 
<table width="1250" border="0" align="center">
  <tr>
    <td width="1248"><%@include file="afterlogintop.jsp" %></td>
  </tr>
  <tr>
    <td height="72"><table width="952" align="center" cellpadding="8">
      <tr>
        <td width="246" height="34" colspan="" bgcolor="#000000"><span class="style2">Quick links</span></td>
        <td width="681" rowspan="2" bgcolor="#ffffff"><table width="696">
          <tr>
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11 style7">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11 style7"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="688" height="295"><fieldset>
              <legend><span class="style3">Account statement</span></legend>
              <table width="681" cellpadding="5">
                <tr>
                  <td width="268" colspan="3"><span class="style5">Select an account</span></td>
                </tr>
                <tr>
                  <td bgcolor="#CCCCCC"><span class="style5">Account Number</span></td>
                  <td bgcolor="#CCCCCC"><span class="style5">Account Type</span></td>
                  <td bgcolor="#CCCCCC"><span class="style5">Branch</span></td>
                </tr>
                <tr>
                  <td height="40" bgcolor="#F0F0F0"><span class="style9">
                    <input name="radio" type="radio" id="radio" value=" <%= session.getAttribute( "theName1" ) %>" />
                    <%= session.getAttribute( "theName1" ) %></span></td>
                  <td bgcolor="#F0F0F0"><span class="style9"><%= session.getAttribute( "theName2" ) %></span></td>
                  <td bgcolor="#F0F0F0"><span class="style9"><%= session.getAttribute( "theName3" ) %></span></td>
                </tr>
                <tr>
                  <td><span class="style5">Selected Account Number</span></td>
                  <td colspan="2"><span class="style5"><label id="lblacc" ><%=request.getParameter("radio") %></label></span></td>
                </tr>
                <tr>
                  <td colspan="3" bgcolor="#CCCCCC"><span class="style5">Select options for the statement period</span></td>
                </tr>
              </table>
              <p class="style6">Please Enter Date In DD/MM/YYYY (Ex.-18/jul/1989) Format.</p>
              <form id="form1" name="form1" action="viewstatements.jsp">
                <label></label>
                <div align="center"></div>
                
              <p><span class="style5">Start Date:
                  <label>
                  <input type="text" name="txtstart" id="txtstart" />
                  </label>
              </span> </p>
              <p><span class="style5">End Date:</span>
                  <label> 
                  <input type="text" name="txtend" id="txtend" />
                  </label>
              </p>
                      
              <label> &nbsp;&nbsp;
              <input type="submit" class="style10" name="dtngo" id="dtngo" value="SUBMIT QUERY" />
              </label>
                </form>
             <br/><br/>
            </fieldset>
             <fieldset>
              <legend><span class="style3">Your Queried Information</span></legend>
              <p>&nbsp;</p>
                <p>&nbsp;</p>
              </fieldset></td>
          </tr>
        </table>
          <p>&nbsp;</p></td>
      </tr>
      <tr>
        <td height="333" bgcolor="#660033"><table width="217">
          <tr>
            <td width="196"><a href="myaccounts.jsp">Account Summary</a></td>
          </tr>
          <tr>
            <td><a href="accountstatements.jsp">Account Statement</a></td>
          </tr>
          <tr>
            <td><a href="pendingstatements.jsp">Pending Statement</a></td>
          </tr>
          <tr>
            <td><a href="taxstatements.jsp">Income tax Statement</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
            <p>&nbsp;</p>
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
</body>
</html>
