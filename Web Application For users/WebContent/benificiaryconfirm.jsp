<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" session="true"
    import="java.io.IOException"
import ="java.io.InputStreamReader"
import ="java.io.OutputStreamWriter"
import ="java.io.PrintWriter"
import ="java.io.UnsupportedEncodingException"
import ="java.net.HttpURLConnection"
import ="java.net.MalformedURLException"
import ="java.net.Proxy"
import ="java.net.URL"
import ="java.net.URLConnection"
import ="java.net.URLEncoder"
import ="java.util.*" 
import="java.io.BufferedReader"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>beneficiary confirm</title>
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	color: #990000;
}
.style2 {
	font-family: "Gemina Condensed";
	color: #0066FF;
}
.style3 {font-family: "Gemina Condensed"}
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
.style6 {color: #0033FF}
-->
</style>
 <script type="text/javascript">
 function noBack()
 {
 window.history.forward(1);
 alert("not allowed");
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
<script type="text/javascript">
function showKeyCode(e)
{
alert("Inside function showKeyCode(e)");
var keycode =(window.event) ? event.keyCode : e.keyCode;

if(keycode == 116)
{
event.keyCode = 0;
event.returnValue = false;
return false;
}
}
</script>
</head>

<body onload="noBack()" onKeyDown ="showKeyCode();">

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
            <td  height="23" bgcolor="#FFFFFF"><div align="right"><span class="style4 style3"><blink><span class="style11 style6">Welcome , <%= session.getAttribute( "theName" ) %>
            </span></blink> <span class="style11"><a href="#">&nbsp;&nbsp;</a></span><a href="log in.jsp">&nbsp;<img src="D:/java projects/Net Banking System/WebContent/images/logout.png" height="23"/></a></span></div></td>
          </tr>
          <tr>
            <td width="688" height="252" align="center"><fieldset>
            <legend><span class="style3">add new beneficiary</span></legend>
            <p>&nbsp;</p>
<span class="style1">
<%
final String fon=(String)session.getAttribute("thephone");
final String name=(String)session.getAttribute("theName");
class Way2Sms {
	   // private URLConnection sendSMSConnection;
	    private String sessionCookie;
	    private Proxy proxy;
	    private String baseurl;
	    private  Random svcRand = new Random();
	    private int a;
	    //Function to support connection through an HTTP Proxy 
	    public void setProxy(String proxyHost,int proxyPort)
	    {
	        proxy=new Proxy(Proxy.Type.HTTP,java.net.InetSocketAddress.createUnresolved(proxyHost, proxyPort));
	    }
 public String loginWay2SMS(String userName,String password)
	    {
	        String cookie=null;
	        URL urlLogin;
	        String loginContent;
	        HttpURLConnection loginConnection;
	        if(userName==null || userName.isEmpty())
	        {
	            System.err.println("A Valid User Name must be present!");
	            System.exit(0);
	        }
	        if(password==null || password.isEmpty())
	        {
	            System.err.println("A Valid Password must be present!");
	            System.exit(0);
	        }
	        try {
	            //UTF-8 encoding is the web standard so data must be encoded to UTF-8
	            userName=URLEncoder.encode(userName, "UTF-8");
	            password=URLEncoder.encode(password, "UTF-8");
	            String   tologinurl=baseurl+"Login1.action";

	         //   urlLogin=new URL("http://site5.way2sms.com/Login1.action");
	            urlLogin=new URL(tologinurl);
	            if(proxy==null)
	            {
	                loginConnection = (HttpURLConnection) urlLogin.openConnection();
	            }
	            else
	            {
	                loginConnection = (HttpURLConnection) urlLogin.openConnection(proxy);
	            }
	            
	            loginContent="username=" + userName + "&password=" + password+"&button=Login";
	            //Faking that we are from a valid client
	            loginConnection.setDoOutput(true);
	            loginConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5");
	            loginConnection.setRequestProperty("Content-Length", String.valueOf(loginContent.length()));
	            loginConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
	            loginConnection.setRequestProperty("Accept", "*/*");
	            loginConnection.setRequestProperty("Referer", "http://site5.way2sms.com//entry.jsp");
	            loginConnection.setRequestMethod("POST");
	            loginConnection.setInstanceFollowRedirects(false);
	            //Writing the Content to the site
	            PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(loginConnection.getOutputStream()), true);
	            printWriter.print(loginContent);
	            printWriter.flush();
	            printWriter.close();
	            //Reading the cookie
	            cookie = loginConnection.getHeaderField("Set-Cookie");
	            
	            
	        } catch (MalformedURLException ex) {
	           System.err.println("Login URL Error");
	           System.exit(0);
	        } catch (UnsupportedEncodingException ex) {
	            System.err.println("Error in encoding Username or Password");
	            System.exit(0);
	        }catch (IOException ex) {
	            System.err.println("Can not connect to Login URL");
	            //retrying
	          
	          if(a==6)a=0;
	            a++;
	            baseurl="http://site"+a+".way2sms.com/";
	            System.out.println(baseurl);
	            loginWay2SMS(userName,password);
	            // System.exit(0);
	        } 
	        if(cookie==null || cookie.isEmpty())
	        {
	            System.err.println("Some error occured...Try again in a few seconds..If still problem exists check your username and password");
	        }
	        sessionCookie=cookie;
	        return cookie;
     
	    }
	    public void sendSMS(String phoneNumber,String message,String action,String username,String password)
	    {
	        
	            if(phoneNumber==null || phoneNumber.isEmpty())
	            {
	                System.err.println("Enter A Valid Phone Number");
	                System.exit(0);
	            }
	            else 
	            {
	                try
	                {
	                    
	                //    long testLong=Long.valueOf(phoneNumber);
	                }catch(NumberFormatException ex)
	                {
	                    System.err.println("Invalid Phone Number");
	                    System.exit(0);
	                }
	                    
	                
	            }
	            
	            if(message==null|| message.length()==1|| message.isEmpty())
	            {   
	                System.err.println("Enter A Valid Phone Number");
	                System.exit(0);
	            }
	            else if(message.length()>140)
	            {  
	                System.err.println("Message should be less than 140 characters");
	            }
	            if(action==null || action.isEmpty())
	            {
	                System.err.println("Enter Valid Action to send Message");
	                System.exit(0);
	            }
	           
	            URL sendURL;
	            HttpURLConnection sendConnection;
	            String sendContent;
	            try {
	                 message=URLEncoder.encode(message, "UTF-8");
	                //sendURL=new URL("http://site5.way2sms.com/FirstServletsms?custid=");
	                 String   tosendurl=baseurl+"quicksms.action?";
	                //sendURL=new URL("http://site5.way2sms.com/quicksms.action?");
	                 sendURL=new URL(tosendurl);
	                 if(proxy==null)
	                {
	                    sendConnection = (HttpURLConnection) sendURL.openConnection();
	                }
	                else 
	                {
	                    //sendConnection = (HttpURLConnection) sendURL.openConnection(proxy);
	                sendConnection = (HttpURLConnection) sendURL.openConnection();
	                }
	               sendContent="HiddenAction=instantsms&catnamedis=Birthday&textfield2=+91&MobNo="+phoneNumber+"&txtLen=5&textArea="+message+"&Action="+action+"&login="+username+"&pass="+password+"";
	                sendConnection.setDoOutput(true);
	                sendConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5");
	                sendConnection.setRequestProperty("Content-Length", String.valueOf(sendContent.getBytes().length));
	                sendConnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
	                sendConnection.setRequestProperty("Accept", "*/*");
	                sendConnection.setRequestProperty("Cookie", sessionCookie);
	                sendConnection.setRequestMethod("POST");
	                sendConnection.setInstanceFollowRedirects(false);
	                
	                PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(sendConnection.getOutputStream()),true);
	                printWriter.print(sendContent);
	                printWriter.flush();
	                printWriter.close();
	                //Reading the returned web page to analyse whether the operation was sucessfull
	                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(sendConnection.getInputStream()));
	                StringBuilder SendResult=new StringBuilder();
	                String line;
	                while ((line=bufferedReader.readLine()) != null)
	                {
	                    SendResult.append(line);
	                    SendResult.append('\n');
	                    //Message has been submitted successfully
	                }
	                if(SendResult.toString().contains("Message has been submitted successfully"))
	                {
	                    System.out.println("Message sent to "+phoneNumber+" successfully.");
	                }
	                else
	                { 
	                    System.err.println("Message could not send to "+phoneNumber+". Also check login credentials");
	                    System.out.print(SendResult.toString());
	                }
	                bufferedReader.close();
	                
	            }catch (UnsupportedEncodingException ex) {
	                System.err.println("Message content encoding error");
	                System.exit(0);
	            }catch (MalformedURLException ex) {
	                System.err.println("Sending URL Error");
	              //retrying
	                if(a==6)a=0;
	                a++;
	                baseurl="http://site"+a+".way2sms.com/";
	                System.out.println(baseurl);
	                loginWay2SMS(username,password);
	       sendSMS(phoneNumber,message,action,username,password);

	                // System.exit(0);
	            }catch (IOException ex) {
	               System.err.println("Sending URL Connection Error");
	               System.exit(0);
	            } 
	        
	        
	    }
	    public void logoutWay2SMS()
	    {
	        try {
	            HttpURLConnection logoutConnection;
	            URL logoutURL;
	            String logouturlmy=baseurl+"jsp/logout.jsp";
	           // logoutURL = new URL("http://site3.way2sms.com/jsp/logout.jsp");
	            logoutURL = new URL(logouturlmy);
	            if(proxy==null)
	            {
	               logoutConnection = (HttpURLConnection) logoutURL.openConnection(); 
	            }
	            else
	            {
	               logoutConnection = (HttpURLConnection) logoutURL.openConnection(proxy); 
	            }
	            
	            logoutConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5");
	            logoutConnection.setRequestProperty("Accept", "*/*");
	            logoutConnection.setRequestProperty("Cookie", sessionCookie);
	            logoutConnection.setRequestMethod("GET");
	            logoutConnection.setInstanceFollowRedirects(true);
	           BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(logoutConnection.getInputStream()));
	            while ((bufferedReader.readLine()) != null);
	            bufferedReader.close();
	        } catch (MalformedURLException ex) {
	            System.err.println("Logout URL Error");
	            System.exit(0);
	        }catch (IOException ex) {
	            System.err.println("Logout URL Connection Error");
	            System.exit(0);
	        } 
	    }
	    Way2Sms()
	    {   
	        proxy=null; 
	        //sendSMSConnection=null;
	        a=svcRand.nextInt(6);
	        while(a==0)
	        a=svcRand.nextInt(6);
	        baseurl="http://site"+a+".way2sms.com/"; 
	        System.out.print(baseurl);
	    }
	    public  void main()
	    {  
	         final String USERNAME="8899312458";//REQUIRED
	       final String PASSWORD="vinvin";//REQUIRED
	         final String ACTION="sa65sdf656fdfd";
	        Way2Sms sms=new Way2Sms();
	       StringBuilder phoneNumber= new StringBuilder();
	        StringBuilder message=new StringBuilder();
	            phoneNumber.append(fon); 
	            phoneNumber.append(';');
	            String msg2="Hello Mr./Miss "+name+" your Beneficiary request submitted successfully"; 
	            if(msg2==null||msg2==""||msg2==" ")
	           {System.out.print("please enter msg of length >0");
	           System.exit(0);
	           }
	            message.append(msg2);
	            message.append(' ');	       
	        String cookie=sms.loginWay2SMS(USERNAME,PASSWORD);
	        System.out.println(cookie);
	        String textMessage=message.toString();
	        String strPhoneNumber=phoneNumber.toString();
	        String arrPhoneNUmber[]=strPhoneNumber.split(";");
	        for(int i=0;i<arrPhoneNUmber.length;i++)
	        {
	         
	         sms.sendSMS(arrPhoneNUmber[i], textMessage, ACTION,USERNAME,PASSWORD);
	        }
	        
	        sms.logoutWay2SMS();
	    }
	}

/*****************sms code end*****************************/
try
{
	int i=0,j=0,n=0;
	String b="beneficiary";
	String bcode="";
	String s1=request.getParameter("textname");
 	String s2=request.getParameter("textacc");
 	String s3=request.getParameter("textifsc");
 	String s4=request.getParameter("txtlimit");	
 	String s5="no";
 	String accno=(String)session.getAttribute("theacc");	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    String q1="INSERT INTO BENIFICIARY (NAME,ACC,IFSC,LIMIT,UACC,APROVED) values('" + s1 + "','" + s2 + "','" + s3+ "','" + s4 + "','" + accno + "','" + s5 + "')";
   
    String q3="SELECT ACC FROM BENIFICIARY WHERE UACC='" + accno + "'";
    String q4="SELECT BRANCH_CODE FROM USER_DETAILS where ACC_NO='" + accno + "'";
    ResultSet r2=smt.executeQuery(q4);
    
    while (r2.next())
    {
    bcode=r2.getString("BRANCH_CODE");
    
    }
    
    ResultSet rs=smt.executeQuery(q3);
    while (rs.next())
    {
    n++;	
    }
    j=n;
    String q2="INSERT INTO MANAGER (REACNO,REBENIFICIARY,REQUEST,MBRANCHCODE) values('" + accno + "','" + s2 + "','" + b + "','" + bcode + "') ";
    if(j<=5)
    {
    	smt.executeUpdate(q1);
    	smt.executeUpdate(q2);
    	Way2Sms sm= new Way2Sms(); 
        sm.main();
    	response.sendRedirect("massage.jsp");
    }
    if(j>5)
    {
    	out.println("YOUR LIMIT REACHED");
    }
}
catch(Exception e)
{
	
}
%>
</span>
	<table align="center">
	<tr>
	<td>		
<span class="style2"></span>
		</td>
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
            </fieldset>
            </td>
          </tr>
        
        </table>        </td>
      </tr>
      <tr>
        <td height="295" bgcolor="#660033"><table width="217">
          <tr>
            <td width="196"><a href="profile.jsp">Personal Details</a></td>
          </tr>
          <tr>
            <td height="21"><a href="#">Set Account Nick Name</a></td>
          </tr>
          <tr>
            <td><a href="changepass.jsp">Change password</a></td>
          </tr>
          <tr>
            <td><a href="benificiary.jsp">Manage benificiary</a></td>
          </tr>
          <tr>
            <td><a href="#">Define Limit</a></td>
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
            <p>&nbsp;</p><p>&nbsp;</p>
     
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
