<%@ page contentType="text/html; charset=utf-8" language="java" buffer="100kb" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@page import="java.io.IOException"
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
import="java.sql.* " 
import="java.io.BufferedReader"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>confirm</title>
<style type="text/css">
<!--
.style1 {
	font-family: "Bleeding Cowboys";
	font-size: 24px;
	color: #0066FF;
}

.style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 18px;
	color: #0066FF;
}
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
         </td>
    <td width="703" bgcolor="#FFFFFF">
       <%
try
{ 
	int sm=0;
	int c=0;
	int d=0;
    String j1="no";
    String j="";
    String s="Net Banking";
	String s1=request.getParameter("txtaccount");
	String s2=request.getParameter("txtcustid");
 	String s3=request.getParameter("txtifsc");
	
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
  
    String q3="select * from manager where REACNO= '" + s1 + "'";
    String q2="Select acc_no,cus__id,ifsc,NET_BANKING_ISSUE,BRANCH_CODE,NAME,PHONE_NO from user_details where ACC_NO='"+ s1 +"'";
    
    ResultSet rep=smt.executeQuery(q3);
   
    while(rep.next())
    {
    	c++;
    }

    ResultSet rs=smt.executeQuery(q2);
   
    int i=0;
  
    while(rs.next()){
    	
    String account= rs.getString("acc_no");
    String cusid= rs.getString("cus__id");
    String code= rs.getString("ifsc");
    j=rs.getString("NET_BANKING_ISSUE");
    String bcode= rs.getString("BRANCH_CODE");
    final String name=rs.getString("NAME");
    final String fon=rs.getString("PHONE_NO");
    if(s1.equals(account) && s2.equals(cusid) && s3.equals(code))
    {
    	i=1;
    }
    	 boolean k=j.equals(j1);
       	
       	if(!k)
       	{
       		d=1;
   		
       		%>
        	<table align="center">
    	<tr>
    	<td>	
        	<span class="style2">
        	U ARE ALREADY REGISTERD
        	 </span></td>
    		</tr>
    		</table>
        	<% 
       	}
       	if(c==0 && d==0)
	    {
       		sm=1;
		  String q1="INSERT INTO manager (REACNO,MBRANCHCODE,REQUEST) values('" + s1 + "','" + bcode + "','" + s + "')";
          smt.executeUpdate(q1);
          
%>
<table align="center">
<tr>
<td>		
<span class="style2">Your request is Submitted Successfully</span>
	</td>
	</tr>
	</table>	
		<% 
    }
       	if(sm==1)
       	{
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
          	    //Logging in to Way2sms and returning the authentication cookie 
          	    //No need to Give the cookie back to sendSMS() but cookie is returned for expanding the flexibility of the code
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
          	               // sendContent="custid=undefined&HiddenAction=instantsms&Action="+action+"&login=&pass=&MobNo="+ phoneNumber+ "&textArea="+message;
          	              //  sendContent="custid=undefined&HiddenAction=instantsms&Action=sa65sdf656fdfd&login=&pass=&MobNo=9543246247&textArea=hello";
          	              
          	                // working url  for me   sendContent="HiddenAction=instantsms&catnamedis=Birthday&textfield2=+91&MobNo="+phoneNumber+"&txtLen=5&textArea="+message+"&Action=sa65sdf656fdfd&login=9543246247&pass=*********";
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
          	       //REQUIRED :e.g sa65sdf656fdfd  In order to understand ACTION value please read the blog
          	        Way2Sms sms=new Way2Sms();
          	        //HTTP PROXY
          	        //sms.setProxy("10.1.1.1",8080); //REQUIRED ONLY IF CONNECTING THROUGH A PROXY
          	        
          	        StringBuilder phoneNumber= new StringBuilder();
          	        StringBuilder message=new StringBuilder();
          	  
          	            String msg2="Hello Mr./Miss "+name+" your Net Banking request submitted successfully"; //msg to be sent
          	           
          	            phoneNumber.append(fon); /*want to use as bean ??? pass the parametrs for phone,message to send multiple number just insert ';' between them and pass as  a string */
          	            phoneNumber.append(';');
          	           
          	            if(msg2==null||msg2==""||msg2==" ")
          	           {System.out.print("please enter msg of length >0");
          	           System.exit(0);
          	           }
          	            message.append(msg2);
          	            message.append(' ');
          	           
          	        // System.out.println("USAGE : Way2SMS phone <phonenumber1> <phonenumber2> ... message <message>");
          	           // System.exit(0);
          	       
          	   /* }
          	 */        //baseurl 1:http://site4.way2sms.com/ 2:http://site4.way2sms.com/ 3.http://site1.way2sms.com/
          	        
          	       
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
          	   

       	}
    }
    

    if(i==0)
  	 {
      	%>
      	<table align="center">
  	<tr>
  	<td>	
      	<span class="style2">
      	<%
  		 out.println("PLEASE ENTER CORRECT INFORMATION");
  	 }
      	 %>
      	 </span></td></tr><tr>
      	 <td>	<div align="center">
      	<span class="style2" >
      	<%
      	
      	 %>
      	 </span></div></td>
  		</tr>
  		</table>
      	<% 
      	
    con.close();
}

catch(Exception e){

}

%>
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
