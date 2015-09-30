/*
 * BankingSystemView.java
 */

package bankingsystem;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;
//import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.*;
import org.jdesktop.application.Action;
import org.jdesktop.application.ResourceMap;
import org.jdesktop.application.SingleFrameApplication;
import org.jdesktop.application.FrameView;
import org.jdesktop.application.TaskMonitor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Timer;
import javax.swing.Icon;
import javax.swing.JDialog;
import javax.swing.JFrame;
import java.sql.*;

import java.util.Random;
/*mail imprt*/
import java.util.Date;
import java.util.*;
import java.util.Properties;

import javax.mail.Authenticator;

import javax.mail.Message;

import javax.mail.MessagingException;

import javax.mail.PasswordAuthentication;

import javax.mail.Session;

import javax.mail.Transport;

import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;
/**
 * The application's main frame.
 */
public class BankingSystemView extends FrameView {

    public BankingSystemView(SingleFrameApplication app) {
        super(app);

        initComponents();
        jPanel4.setVisible(false);
        jPanel3.setVisible(false); 
        // status bar initialization - message timeout, idle icon and busy animation, etc
        ResourceMap resourceMap = getResourceMap();
        int messageTimeout = resourceMap.getInteger("StatusBar.messageTimeout");
        messageTimer = new Timer(messageTimeout, new ActionListener() {
            public void actionPerformed(ActionEvent e) {
               
            }
        });
        messageTimer.setRepeats(false);
        int busyAnimationRate = resourceMap.getInteger("StatusBar.busyAnimationRate");
        for (int i = 0; i < busyIcons.length; i++) {
            busyIcons[i] = resourceMap.getIcon("StatusBar.busyIcons[" + i + "]");
        }
        busyIconTimer = new Timer(busyAnimationRate, new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                busyIconIndex = (busyIconIndex + 1) % busyIcons.length;
                
            }
        });
        idleIcon = resourceMap.getIcon("StatusBar.idleIcon");
       

        // connecting action tasks to status bar via TaskMonitor
        TaskMonitor taskMonitor = new TaskMonitor(getApplication().getContext());
        taskMonitor.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                String propertyName = evt.getPropertyName();
                if ("started".equals(propertyName)) {
                    if (!busyIconTimer.isRunning()) {
                        
                        busyIconIndex = 0;
                        busyIconTimer.start();
                    }
                   
                } else if ("done".equals(propertyName)) {
                    busyIconTimer.stop();
                   
                } else if ("message".equals(propertyName)) {
                    String text = (String)(evt.getNewValue());
                   
                    messageTimer.restart();
                } else if ("progress".equals(propertyName)) {
                    int value = (Integer)(evt.getNewValue());
                  
                }
            }
        });
    }
    /******************************mail code start********************************/
private static class GMailAuthenticator extends Authenticator {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    }
/******************************mail code end******************************************/
public class Way2Sms {
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
     /*   if(args.length>0)
        {
          if(args[0].toLowerCase().compareTo("phone")==0)
          {
            int i=1;
            while(args[i].toLowerCase().compareTo("message")!=0)
            {
                phoneNumber.append(args[i]);
                 phoneNumber.append(';');
                i++;
            }
            for(i=i+1;i<args.length;i++)
            {
                message.append(args[i]);
                message.append(' ');
            }
          }
          else
          {
          System.out.println("USAGE : Way2SMS phone <phonenumber1> <phonenumber2> ... message <message>");
            System.exit(0);
          }
        } 
        else
        { */
       
            phoneNumber.append(phn); /*want to use as bean ??? pass the parametrs for phone,message to send multiple number just insert ';' between them and pass as  a string */
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
    @Action
    public void showAboutBox() {
        if (aboutBox == null) {
            JFrame mainFrame = BankingSystemApp.getApplication().getMainFrame();
            mainFrame.setDefaultCloseOperation(mainFrame.DISPOSE_ON_CLOSE);
            aboutBox = new BankingSystemAboutBox(mainFrame);
            aboutBox.setLocationRelativeTo(mainFrame);
        }
        BankingSystemApp.getApplication().show(aboutBox);
    }
    

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        mainPanel = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        txtmid = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        msg = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jSeparator1 = new javax.swing.JSeparator();
        jPasswordField1 = new javax.swing.JPasswordField();
        jPanel4 = new javax.swing.JPanel();
        jLabel8 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        jLabel23 = new javax.swing.JLabel();
        jLabel24 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        jLabel26 = new javax.swing.JLabel();
        jButton9 = new javax.swing.JButton();
        jButton10 = new javax.swing.JButton();
        jButton11 = new javax.swing.JButton();
        jLabel27 = new javax.swing.JLabel();
        jLabel28 = new javax.swing.JLabel();
        jLabel29 = new javax.swing.JLabel();
        jButton12 = new javax.swing.JButton();
        jLabel30 = new javax.swing.JLabel();
        jLabel31 = new javax.swing.JLabel();
        jLabel32 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jButton7 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();

        org.jdesktop.application.ResourceMap resourceMap = org.jdesktop.application.Application.getInstance(bankingsystem.BankingSystemApp.class).getContext().getResourceMap(BankingSystemView.class);
        mainPanel.setBackground(resourceMap.getColor("mainPanel.background")); // NOI18N
        mainPanel.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        mainPanel.setName("mainPanel"); // NOI18N
        mainPanel.setPreferredSize(new java.awt.Dimension(768, 450));

        jPanel1.setBackground(resourceMap.getColor("jPanel1.background")); // NOI18N
        jPanel1.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel1.setName("jPanel1"); // NOI18N

        jLabel1.setIcon(resourceMap.getIcon("jLabel1.icon")); // NOI18N
        jLabel1.setText(resourceMap.getString("jLabel1.text")); // NOI18N
        jLabel1.setMaximumSize(new java.awt.Dimension(219, 191));
        jLabel1.setName("jLabel1"); // NOI18N

        jLabel2.setIcon(resourceMap.getIcon("jLabel2.icon")); // NOI18N
        jLabel2.setText(resourceMap.getString("jLabel2.text")); // NOI18N
        jLabel2.setName("jLabel2"); // NOI18N

        jLabel3.setIcon(resourceMap.getIcon("jLabel3.icon")); // NOI18N
        jLabel3.setText(resourceMap.getString("jLabel3.text")); // NOI18N
        jLabel3.setName("jLabel3"); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel2)))
                .addContainerGap(397, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        jPanel2.setBackground(resourceMap.getColor("jPanel2.background")); // NOI18N
        jPanel2.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel2.setForeground(resourceMap.getColor("jPanel2.foreground")); // NOI18N
        jPanel2.setName("jPanel2"); // NOI18N

        jLabel5.setFont(resourceMap.getFont("jLabel5.font")); // NOI18N
        jLabel5.setForeground(resourceMap.getColor("jLabel5.foreground")); // NOI18N
        jLabel5.setText(resourceMap.getString("jLabel5.text")); // NOI18N
        jLabel5.setName("jLabel5"); // NOI18N

        txtmid.setFont(resourceMap.getFont("txtmid.font")); // NOI18N
        txtmid.setText(resourceMap.getString("txtmid.text")); // NOI18N
        txtmid.setName("txtmid"); // NOI18N

        jLabel6.setFont(resourceMap.getFont("jLabel6.font")); // NOI18N
        jLabel6.setForeground(resourceMap.getColor("jLabel6.foreground")); // NOI18N
        jLabel6.setText(resourceMap.getString("jLabel6.text")); // NOI18N
        jLabel6.setName("jLabel6"); // NOI18N

        jButton1.setBackground(resourceMap.getColor("jButton1.background")); // NOI18N
        jButton1.setFont(resourceMap.getFont("jButton1.font")); // NOI18N
        jButton1.setForeground(resourceMap.getColor("jButton1.foreground")); // NOI18N
        jButton1.setText(resourceMap.getString("jButton1.text")); // NOI18N
        jButton1.setBorder(null);
        jButton1.setName("jButton1"); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        msg.setFont(resourceMap.getFont("msg.font")); // NOI18N
        msg.setForeground(resourceMap.getColor("msg.foreground")); // NOI18N
        msg.setText(resourceMap.getString("msg.text")); // NOI18N
        msg.setName("msg"); // NOI18N

        jLabel4.setFont(resourceMap.getFont("jLabel4.font")); // NOI18N
        jLabel4.setForeground(resourceMap.getColor("jLabel4.foreground")); // NOI18N
        jLabel4.setText(resourceMap.getString("jLabel4.text")); // NOI18N
        jLabel4.setAutoscrolls(true);
        jLabel4.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jLabel4.setName("jLabel4"); // NOI18N

        jSeparator1.setName("jSeparator1"); // NOI18N

        jPasswordField1.setFont(resourceMap.getFont("txtmpass.font")); // NOI18N
        jPasswordField1.setText(resourceMap.getString("txtmpass.text")); // NOI18N
        jPasswordField1.setName("txtmpass"); // NOI18N

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 194, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(msg, javax.swing.GroupLayout.DEFAULT_SIZE, 277, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(15, 15, 15)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jSeparator1, javax.swing.GroupLayout.DEFAULT_SIZE, 272, Short.MAX_VALUE)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(33, 33, 33)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel6))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txtmid, javax.swing.GroupLayout.DEFAULT_SIZE, 136, Short.MAX_VALUE)
                                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jPasswordField1, javax.swing.GroupLayout.DEFAULT_SIZE, 136, Short.MAX_VALUE))))))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(31, 31, 31)
                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(22, 22, 22)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtmid, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(jPasswordField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(26, 26, 26)
                .addComponent(msg, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(147, Short.MAX_VALUE))
        );

        jPanel4.setBackground(resourceMap.getColor("jPanel4.background")); // NOI18N
        jPanel4.setName("jPanel4"); // NOI18N

        jLabel8.setFont(resourceMap.getFont("jLabel8.font")); // NOI18N
        jLabel8.setForeground(resourceMap.getColor("jLabel8.foreground")); // NOI18N
        jLabel8.setText(resourceMap.getString("jLabel8.text")); // NOI18N
        jLabel8.setName("jLabel8"); // NOI18N

        jComboBox1.setBackground(resourceMap.getColor("jComboBox1.background")); // NOI18N
        jComboBox1.setFont(resourceMap.getFont("jComboBox1.font")); // NOI18N
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jComboBox1.setName("jComboBox1"); // NOI18N
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jLabel9.setFont(resourceMap.getFont("jLabel9.font")); // NOI18N
        jLabel9.setText(resourceMap.getString("jLabel9.text")); // NOI18N
        jLabel9.setName("jLabel9"); // NOI18N

        jLabel10.setFont(resourceMap.getFont("jLabel10.font")); // NOI18N
        jLabel10.setText(resourceMap.getString("jLabel10.text")); // NOI18N
        jLabel10.setName("jLabel10"); // NOI18N

        jLabel11.setFont(resourceMap.getFont("jLabel11.font")); // NOI18N
        jLabel11.setText(resourceMap.getString("jLabel11.text")); // NOI18N
        jLabel11.setName("jLabel11"); // NOI18N

        jLabel12.setFont(resourceMap.getFont("jLabel12.font")); // NOI18N
        jLabel12.setText(resourceMap.getString("jLabel12.text")); // NOI18N
        jLabel12.setName("jLabel12"); // NOI18N

        jLabel13.setFont(resourceMap.getFont("jLabel13.font")); // NOI18N
        jLabel13.setText(resourceMap.getString("jLabel13.text")); // NOI18N
        jLabel13.setName("jLabel13"); // NOI18N

        jLabel14.setFont(resourceMap.getFont("jLabel14.font")); // NOI18N
        jLabel14.setText(resourceMap.getString("jLabel14.text")); // NOI18N
        jLabel14.setName("jLabel14"); // NOI18N

        jLabel15.setFont(resourceMap.getFont("jLabel15.font")); // NOI18N
        jLabel15.setText(resourceMap.getString("jLabel15.text")); // NOI18N
        jLabel15.setName("jLabel15"); // NOI18N

        jLabel16.setFont(resourceMap.getFont("jLabel16.font")); // NOI18N
        jLabel16.setText(resourceMap.getString("jLabel16.text")); // NOI18N
        jLabel16.setName("jLabel16"); // NOI18N

        jLabel17.setFont(resourceMap.getFont("jLabel17.font")); // NOI18N
        jLabel17.setText(resourceMap.getString("jLabel17.text")); // NOI18N
        jLabel17.setName("jLabel17"); // NOI18N

        jLabel18.setFont(resourceMap.getFont("jLabel19.font")); // NOI18N
        jLabel18.setText(resourceMap.getString("jLabel18.text")); // NOI18N
        jLabel18.setName("jLabel18"); // NOI18N

        jLabel19.setFont(resourceMap.getFont("jLabel19.font")); // NOI18N
        jLabel19.setText(resourceMap.getString("jLabel19.text")); // NOI18N
        jLabel19.setName("jLabel19"); // NOI18N

        jLabel20.setFont(resourceMap.getFont("jLabel24.font")); // NOI18N
        jLabel20.setText(resourceMap.getString("jLabel20.text")); // NOI18N
        jLabel20.setName("jLabel20"); // NOI18N

        jLabel21.setFont(resourceMap.getFont("jLabel24.font")); // NOI18N
        jLabel21.setText(resourceMap.getString("jLabel21.text")); // NOI18N
        jLabel21.setName("jLabel21"); // NOI18N

        jLabel22.setFont(resourceMap.getFont("jLabel24.font")); // NOI18N
        jLabel22.setText(resourceMap.getString("jLabel22.text")); // NOI18N
        jLabel22.setName("jLabel22"); // NOI18N

        jLabel23.setFont(resourceMap.getFont("jLabel24.font")); // NOI18N
        jLabel23.setText(resourceMap.getString("jLabel23.text")); // NOI18N
        jLabel23.setName("jLabel23"); // NOI18N

        jLabel24.setFont(resourceMap.getFont("jLabel24.font")); // NOI18N
        jLabel24.setText(resourceMap.getString("jLabel24.text")); // NOI18N
        jLabel24.setName("jLabel24"); // NOI18N

        jLabel25.setFont(resourceMap.getFont("jLabel24.font")); // NOI18N
        jLabel25.setText(resourceMap.getString("jLabel25.text")); // NOI18N
        jLabel25.setName("jLabel25"); // NOI18N

        jLabel26.setFont(resourceMap.getFont("jLabel24.font")); // NOI18N
        jLabel26.setText(resourceMap.getString("jLabel26.text")); // NOI18N
        jLabel26.setName("jLabel26"); // NOI18N

        jButton9.setBackground(resourceMap.getColor("jButton9.background")); // NOI18N
        jButton9.setFont(resourceMap.getFont("jButton9.font")); // NOI18N
        jButton9.setText(resourceMap.getString("jButton9.text")); // NOI18N
        jButton9.setName("jButton9"); // NOI18N
        jButton9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton9ActionPerformed(evt);
            }
        });

        jButton10.setBackground(resourceMap.getColor("jButton10.background")); // NOI18N
        jButton10.setFont(resourceMap.getFont("jButton10.font")); // NOI18N
        jButton10.setForeground(resourceMap.getColor("jButton10.foreground")); // NOI18N
        jButton10.setText(resourceMap.getString("jButton10.text")); // NOI18N
        jButton10.setName("jButton10"); // NOI18N
        jButton10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton10ActionPerformed(evt);
            }
        });

        jButton11.setBackground(resourceMap.getColor("jButton11.background")); // NOI18N
        jButton11.setFont(resourceMap.getFont("jButton11.font")); // NOI18N
        jButton11.setForeground(resourceMap.getColor("jButton11.foreground")); // NOI18N
        jButton11.setText(resourceMap.getString("jButton11.text")); // NOI18N
        jButton11.setName("jButton11"); // NOI18N
        jButton11.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton11ActionPerformed(evt);
            }
        });

        jLabel27.setFont(resourceMap.getFont("jLabel27.font")); // NOI18N
        jLabel27.setForeground(resourceMap.getColor("jLabel27.foreground")); // NOI18N
        jLabel27.setText(resourceMap.getString("jLabel27.text")); // NOI18N
        jLabel27.setName("jLabel27"); // NOI18N

        jLabel28.setFont(resourceMap.getFont("jLabel28.font")); // NOI18N
        jLabel28.setForeground(resourceMap.getColor("jLabel28.foreground")); // NOI18N
        jLabel28.setText(resourceMap.getString("jLabel28.text")); // NOI18N
        jLabel28.setName("jLabel28"); // NOI18N

        jLabel29.setFont(resourceMap.getFont("jLabel29.font")); // NOI18N
        jLabel29.setForeground(resourceMap.getColor("jLabel29.foreground")); // NOI18N
        jLabel29.setText(resourceMap.getString("jLabel29.text")); // NOI18N
        jLabel29.setName("jLabel29"); // NOI18N

        jButton12.setBackground(resourceMap.getColor("jButton12.background")); // NOI18N
        jButton12.setFont(resourceMap.getFont("jButton12.font")); // NOI18N
        jButton12.setForeground(resourceMap.getColor("jButton12.foreground")); // NOI18N
        jButton12.setText(resourceMap.getString("jButton12.text")); // NOI18N
        jButton12.setName("jButton12"); // NOI18N
        jButton12.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton12ActionPerformed(evt);
            }
        });

        jLabel30.setFont(resourceMap.getFont("jLabel30.font")); // NOI18N
        jLabel30.setText(resourceMap.getString("jLabel30.text")); // NOI18N
        jLabel30.setName("jLabel30"); // NOI18N

        jLabel31.setText(resourceMap.getString("jLabel31.text")); // NOI18N
        jLabel31.setName("jLabel31"); // NOI18N

        jLabel32.setFont(resourceMap.getFont("jLabel32.font")); // NOI18N
        jLabel32.setText(resourceMap.getString("jLabel32.text")); // NOI18N
        jLabel32.setName("jLabel32"); // NOI18N

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(jLabel9, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel11, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel12, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel13, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel14, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel30, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addComponent(jLabel17, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel16, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel15, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 16, Short.MAX_VALUE)))
                        .addGap(133, 133, 133)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel22)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel21)
                                    .addComponent(jLabel20)
                                    .addComponent(jLabel19)
                                    .addComponent(jLabel18)
                                    .addComponent(jLabel23)
                                    .addComponent(jLabel24)
                                    .addComponent(jLabel25)
                                    .addComponent(jLabel26)
                                    .addComponent(jLabel32))
                                .addContainerGap(426, Short.MAX_VALUE))))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel8)
                        .addGap(21, 21, 21)
                        .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 217, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(282, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel27)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jLabel28))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel29)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 156, Short.MAX_VALUE)
                                .addComponent(jButton10)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jButton11)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jButton9)
                                .addGap(40, 40, 40))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jButton12, javax.swing.GroupLayout.PREFERRED_SIZE, 105, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addContainerGap())))))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(4, 4, 4)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel28)
                    .addComponent(jLabel27)
                    .addComponent(jButton12, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel9)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel10)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel11)
                        .addGap(13, 13, 13)
                        .addComponent(jLabel12)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel13)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel14)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel15)
                        .addGap(11, 11, 11)
                        .addComponent(jLabel16)
                        .addGap(11, 11, 11)
                        .addComponent(jLabel17)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel30)
                        .addGap(34, 34, 34)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButton9)
                            .addComponent(jButton11)
                            .addComponent(jButton10)
                            .addComponent(jLabel29)))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel18)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel19)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel20)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel21)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel22)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel23)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel24)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel25, javax.swing.GroupLayout.PREFERRED_SIZE, 14, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel26)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel32)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel3.setBackground(resourceMap.getColor("jPanel3.background")); // NOI18N
        jPanel3.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel3.setName("jPanel3"); // NOI18N

        jButton2.setBackground(resourceMap.getColor("jButton2.background")); // NOI18N
        jButton2.setFont(resourceMap.getFont("jButton2.font")); // NOI18N
        jButton2.setForeground(resourceMap.getColor("jButton2.foreground")); // NOI18N
        jButton2.setText(resourceMap.getString("jButton2.text")); // NOI18N
        jButton2.setName("jButton2"); // NOI18N
        jButton2.setPreferredSize(new java.awt.Dimension(203, 32));
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setBackground(resourceMap.getColor("jButton3.background")); // NOI18N
        jButton3.setFont(resourceMap.getFont("jButton3.font")); // NOI18N
        jButton3.setForeground(resourceMap.getColor("jButton3.foreground")); // NOI18N
        jButton3.setText(resourceMap.getString("jButton3.text")); // NOI18N
        jButton3.setMaximumSize(new java.awt.Dimension(133, 23));
        jButton3.setMinimumSize(new java.awt.Dimension(133, 23));
        jButton3.setName("jButton3"); // NOI18N
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setBackground(resourceMap.getColor("jButton4.background")); // NOI18N
        jButton4.setFont(resourceMap.getFont("jButton4.font")); // NOI18N
        jButton4.setForeground(resourceMap.getColor("jButton4.foreground")); // NOI18N
        jButton4.setText(resourceMap.getString("jButton4.text")); // NOI18N
        jButton4.setName("jButton4"); // NOI18N
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jButton5.setBackground(resourceMap.getColor("jButton5.background")); // NOI18N
        jButton5.setFont(resourceMap.getFont("jButton5.font")); // NOI18N
        jButton5.setForeground(resourceMap.getColor("jButton5.foreground")); // NOI18N
        jButton5.setText(resourceMap.getString("jButton5.text")); // NOI18N
        jButton5.setName("jButton5"); // NOI18N
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        jButton6.setBackground(resourceMap.getColor("jButton6.background")); // NOI18N
        jButton6.setFont(resourceMap.getFont("jButton6.font")); // NOI18N
        jButton6.setForeground(resourceMap.getColor("jButton6.foreground")); // NOI18N
        jButton6.setText(resourceMap.getString("jButton6.text")); // NOI18N
        jButton6.setName("jButton6"); // NOI18N

        jButton7.setBackground(resourceMap.getColor("jButton7.background")); // NOI18N
        jButton7.setFont(resourceMap.getFont("jButton7.font")); // NOI18N
        jButton7.setForeground(resourceMap.getColor("jButton7.foreground")); // NOI18N
        jButton7.setText(resourceMap.getString("jButton7.text")); // NOI18N
        jButton7.setName("jButton7"); // NOI18N
        jButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton7ActionPerformed(evt);
            }
        });

        jButton8.setBackground(resourceMap.getColor("jButton8.background")); // NOI18N
        jButton8.setFont(resourceMap.getFont("jButton8.font")); // NOI18N
        jButton8.setForeground(resourceMap.getColor("jButton8.foreground")); // NOI18N
        jButton8.setText(resourceMap.getString("jButton8.text")); // NOI18N
        jButton8.setBorder(null);
        jButton8.setName("jButton8"); // NOI18N
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jButton2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
            .addComponent(jButton3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
            .addComponent(jButton4, javax.swing.GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
            .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 227, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(jButton7, javax.swing.GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
            .addComponent(jButton8, javax.swing.GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
            .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 227, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton7, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton8, javax.swing.GroupLayout.PREFERRED_SIZE, 52, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(46, 46, 46))
        );

        javax.swing.GroupLayout mainPanelLayout = new javax.swing.GroupLayout(mainPanel);
        mainPanel.setLayout(mainPanelLayout);
        mainPanelLayout.setHorizontalGroup(
            mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, mainPanelLayout.createSequentialGroup()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(1, 1, 1))
        );
        mainPanelLayout.setVerticalGroup(
            mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(mainPanelLayout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 438, Short.MAX_VALUE)))
        );

        jLabel7.setText(resourceMap.getString("jLabel7.text")); // NOI18N
        jLabel7.setName("jLabel7"); // NOI18N

        setComponent(mainPanel);
    }// </editor-fold>//GEN-END:initComponents

String code;
private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
// TODO add your handling code here:
    jLabel8.setVisible(false);
    jLabel9.setVisible(false);
    jLabel10.setVisible(false);
    jLabel11.setVisible(false);
    jLabel12.setVisible(false);
    jLabel13.setVisible(false);
    jLabel14.setVisible(false);
    jLabel15.setVisible(false);jLabel16.setVisible(false);jLabel17.setVisible(false);
    
    jLabel18.setVisible(false);
    jLabel19.setVisible(false);
    jLabel20.setVisible(false);
    jLabel21.setVisible(false);
    jLabel22.setVisible(false);
    jLabel23.setVisible(false);
    jLabel24.setVisible(false);
    jLabel25.setVisible(false);
    jLabel26.setVisible(false); jLabel29.setVisible(false);jLabel30.setVisible(false); jLabel32.setVisible(false);
    
    jComboBox1.setVisible(false);
    jButton10.setVisible(false);jButton11.setVisible(false);jButton9.setVisible(false);
    try
    { int i=0;
      String uid= txtmid.getText();
      String mpass= jPasswordField1.getText();
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
     String q1="select * from UMANAGER" ;
    
    ResultSet rs=smt.executeQuery(q1);
    while(rs.next())
    {
       String id=rs.getString("USERNAME"); 
       String pas=rs.getString("PASS");
       
       if(id.equals(uid) && mpass.equals(pas))
       { 
       i=1;
       String n=rs.getString("NAME");
       jLabel28.setText(n);
       String branch= rs.getString("BRANCH");
       code=rs.getString("BRANCH_CODE");
               
    jPanel2.setVisible(false);
    jPanel3.setVisible(true);
    jPanel4.setVisible(true); 
   txtmid.setText("");
       jPasswordField1.setText("");
       }
    }
      if(i==0)
      {
       txtmid.setText("");
       jPasswordField1.setText("");
         msg.setText("USER ID OR PASSWORD INCORRECT");
      }
    }
    catch(Exception e)
    {
        
    }
   
}//GEN-LAST:event_jButton1ActionPerformed

private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
// TODO add your handling code here:
    flag=1;
    try
    {
    jLabel8.setVisible(true);
    jLabel9.setVisible(true);
    jLabel10.setVisible(true);
    jLabel11.setVisible(true);
    jLabel12.setVisible(true);
    jLabel13.setVisible(true);
    jLabel14.setVisible(true);
    jLabel15.setVisible(true);jLabel16.setVisible(true);jLabel17.setVisible(true);
    
    jLabel18.setVisible(true);
    jLabel19.setVisible(true);
    jLabel20.setVisible(true);
    jLabel21.setVisible(true);
    jLabel22.setVisible(true);
    jLabel23.setVisible(true);
    jLabel24.setVisible(true);
    jLabel25.setVisible(true);
    jLabel26.setVisible(true); jLabel29.setVisible(false);
   
    jComboBox1.setVisible(false);
    jButton10.setVisible(true);jButton11.setVisible(true);jButton9.setVisible(true);
     jButton10.setText("ACTIVATE");
     jButton11.setText("REJECT"); 
    jLabel9.setText("ACCOUNT NO. ");jLabel10.setText("ACCOUNT  TYPE");jLabel11.setText("BALANCE");jLabel12.setText("NAME ");jLabel13.setText("PHONE NO.");jLabel14.setText("EMAIL");
    jLabel15.setText("ADDRESS");jLabel16.setText("CITY");jLabel17.setText("PIN");
        
      String s="Net Banking";
    jLabel8.setText("NET BANKING REQUEST :");  
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
     String q1="select REACNO from MANAGER where MBRANCHCODE='"+ code +"' AND REQUEST='"+s+"'";
      ResultSet rs=smt.executeQuery(q1);
     jComboBox1.setVisible(true);
     jComboBox1.removeAllItems();
     String z="select";
     jComboBox1.addItem(z);
     while(rs.next())
     {
         String j= rs.getString("REACNO");
         System.out.println(j);
         jComboBox1.addItem(j);
         
     }
    }
   catch(Exception e)
    {
        
    }
}//GEN-LAST:event_jButton2ActionPerformed
String phn;
String hemail;
String hname;
String hacc;
String bacc;
String nam;
String email;
String req;
String bname;

private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
// TODO add your handling code here:
    if(flag==1)
    {
     try
    { 
        String r= "select";
        jLabel29.setVisible(false);
        req= (String)jComboBox1.getSelectedItem();
        if(req.equals(r))
        {
          jLabel18.setText("");
           jLabel19.setText("");
           jLabel20.setText(""); 
           jLabel21.setText("");
           jLabel22.setText("");  
           jLabel23.setText(""); 
           jLabel24.setText(""); 
           jLabel25.setText("");
           jLabel26.setText("");   
        }
        System.out.println(req);
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
     String q1="select * from USER_DETAILS where ACC_NO='"+ req +"'";
     ResultSet rs=smt.executeQuery(q1);
     while(rs.next())
     {
         String ano= rs.getString("ACC_NO");
                nam=rs.getString("NAME");
         String atype=rs.getString("ACC_TYPE");
         String bal1=rs.getString("BALANCE");
                 phn=rs.getString("PHONE_NO");
                email=rs.getString("EMAIL");
         String add1=rs.getString("ADDRESS");
         String city=rs.getString("CITY");
         String pin1=rs.getString("PIN");
         
           jLabel18.setText(ano);
           jLabel19.setText(atype);
           jLabel20.setText(bal1); 
           jLabel21.setText(nam);
           jLabel22.setText(phn);  
           jLabel23.setText(email); 
           jLabel24.setText(add1); 
           jLabel25.setText(city);
           jLabel26.setText(pin1); 
    }
    }
      catch(Exception e)
    {
        
    }
    }
    
    if(flag==2)
    {
        try
        {
         String r= "select";
        jLabel29.setVisible(false);
        req= (String)jComboBox1.getSelectedItem();
        if(req.equals(r))
        {
          jLabel18.setText("");
           jLabel19.setText("");
           jLabel20.setText(""); 
           jLabel21.setText("");
           jLabel22.setText("");  
            
        }
        System.out.println(req);
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String q1="select * from USER_DETAILS where ACC_NO='"+ req +"'";
     String q2="select * from  BENIFICIARY where UACC='"+ req +"'";
     ResultSet rs=smt.executeQuery(q1);
     while(rs.next())
     {
          nam=rs.getString("NAME");
           email=rs.getString("EMAIL");         
           phn=rs.getString("PHONE_NO");
    }  
     ResultSet rs1=smt.executeQuery(q2);
     while(rs1.next())
     {
        bacc=rs1.getString("ACC");
        bname=rs1.getString("NAME");
        String bifsc=rs1.getString("IFSC");
        String blimit=rs1.getString("LIMIT"); 
        
        jLabel18.setText(req);
         jLabel19.setText(bacc);
          jLabel20.setText(bname);
           jLabel21.setText(bifsc);
            jLabel22.setText(blimit);
     }
        }
        catch(Exception e)
    {
        
    }
    }
    /******************************atm requests****************************************/
    if(flag==3)
    {
        try
        {
         String r= "select";
        jLabel29.setVisible(false);
        req= (String)jComboBox1.getSelectedItem();
        if(req.equals(r))
        {
          jLabel18.setText("");
           jLabel19.setText("");
           jLabel20.setText(""); 
           jLabel21.setText("");
           jLabel22.setText("");    jLabel23.setText("");
            
        }
        System.out.println(req);
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String q1="select * from USER_DETAILS where ACC_NO='"+ req +"'";
     String q2="select * from  ATM where ATMACC='"+ req +"'";
     String q3="select * from  MANAGER where REACNO='"+ req +"'";
     ResultSet rs=smt.executeQuery(q1);
     while(rs.next())
     {
          nam=rs.getString("NAME");
           email=rs.getString("EMAIL");         
           phn=rs.getString("PHONE_NO");
    }  
     ResultSet rs1=smt.executeQuery(q2);
     while(rs1.next())
     {
        bname=rs1.getString("ATMNO");
        String atmtype=rs1.getString("ATMTYPE");
        String holdername=rs1.getString("HOLDERNAME"); 
        String expiry=rs1.getString("EXPIRY");
     
          jLabel20.setText(bname);
           jLabel21.setText(atmtype);
           jLabel22.setText(holdername);
            jLabel23.setText(expiry);
     }
     ResultSet rs2=smt.executeQuery(q3);
     while(rs2.next())
     {
         String purpose=rs2.getString("PURPOSE");
         bacc=rs2.getString("REACNO");
              jLabel18.setText(bacc);
         jLabel19.setText(purpose);
     }
        }
        catch(Exception e)
    {
        
    }
    }
    /****************************************8passbook******************************/
    if(flag==4)
    {
        try
        {
         String r= "select";
        jLabel29.setVisible(false);
        req= (String)jComboBox1.getSelectedItem();
        if(req.equals(r))
        {
          jLabel18.setText("");
           jLabel19.setText("");
           jLabel20.setText(""); 
           jLabel21.setText("");
           jLabel22.setText("");    jLabel23.setText("");
            
        }
        System.out.println(req);
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String q1="select * from USER_DETAILS where ACC_NO='"+ req +"'";
     String q3="select * from  MANAGER where REACNO='"+ req +"'";
     ResultSet rs=smt.executeQuery(q1);
     while(rs.next())
     {
          nam=rs.getString("NAME");
           email=rs.getString("EMAIL");
         String phone=rs.getString("PHONE_NO");
         String hadd=rs.getString("ADDRESS");
        String hcity=rs.getString("CITY");
        String hpin=rs.getString("PIN");
        String hstate=rs.getString("STATE");
       String add=hadd+" "+hcity+" "+hpin+" "+hstate;
       phn=rs.getString("PHONE_NO");
         jLabel19.setText(nam);
          jLabel21.setText(phone);
          jLabel22.setText(email);
           jLabel23.setText(add);
    }  
     ResultSet rs2=smt.executeQuery(q3);
     while(rs2.next())
     {
         String purpose=rs2.getString("PURPOSE");
         bacc=rs2.getString("REACNO");
              jLabel18.setText(bacc);
         jLabel20.setText(purpose);
     }
        }
        catch(Exception e)
    {
        
    }
    }
   /******************************************************************************************************/
    if(flag==6)
    {
           try
        {
         String r= "select";
        jLabel29.setVisible(false);
        req= (String)jComboBox1.getSelectedItem();
        if(req.equals(r))
        {
          jLabel18.setText("");
           jLabel19.setText("");
           jLabel20.setText(""); 
           jLabel21.setText("");
           jLabel22.setText(""); 
           jLabel23.setText(""); 
           jLabel24.setText(""); 
           jLabel25.setText(""); 
           jLabel26.setText("");  
            
        }
        System.out.println(req);
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
    String st="pending";
    String q1="select * from USER_DETAILS where ACC_NO='"+ req +"'";
     String q2="select * from  HLOAN where HACC='"+ req +"' and STATUS='"+ st +"'";
     ResultSet rs=smt.executeQuery(q1);
     while(rs.next())
     {
       phn=rs.getString("PHONE_NO");
       nam=rs.getString("NAME");
     }
     ResultSet rs1=smt.executeQuery(q2);
     while(rs1.next())
     {
        hacc=rs1.getString("HACC");
        String hatype=rs1.getString("HATYPE");
        hname=rs1.getString("HNAME");
        String hocc=rs1.getString("HOCC");
        String hinc=rs1.getString("HINC");
        String hamt=rs1.getString("HAMT");
        String hdur=rs1.getString("HDUR");
        String hphn=rs1.getString("HPHN");
        String hadd=rs1.getString("HADD");
        String hcity=rs1.getString("HCITY");
        String hpin=rs1.getString("HPIN");
        String hstate=rs1.getString("HSTATE");
                  hemail=rs1.getString("HEMAIL");
      
        jLabel18.setText(hacc);
         jLabel19.setText(hatype);
          jLabel20.setText(hname);
           jLabel21.setText(hocc);
            jLabel22.setText(hinc);
            jLabel23.setText(hamt);
            jLabel24.setText(hdur);
            jLabel25.setText(hphn);
            String address=hadd+" "+hcity+" "+hpin+" "+hstate;
            jLabel26.setText(address);   
     }
        }
        catch(Exception e)
    {
        
    }   
    }
    /********************************education loan***************************************/
     if(flag==7)
    {
           try
        {
         String r= "select";
        jLabel29.setVisible(false);
        req= (String)jComboBox1.getSelectedItem();
        if(req.equals(r))
        {
          jLabel18.setText("");
           jLabel19.setText("");
           jLabel20.setText(""); 
           jLabel21.setText("");
           jLabel22.setText(""); 
           jLabel23.setText(""); 
           jLabel24.setText(""); 
           jLabel25.setText(""); 
           jLabel26.setText(""); 
            jLabel32.setText("");      
        }
        System.out.println(req);
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String st="pending";
     String q2="SELECT * FROM  ELOAN WHERE LACC='"+ req +"' and STATUS='"+ st +"'";
     String q1="select * from USER_DETAILS where ACC_NO='"+ req +"'";
     ResultSet rs=smt.executeQuery(q1);
     while(rs.next())
     {
       phn=rs.getString("PHONE_NO");
       nam=rs.getString("NAME");
     }
     ResultSet rs1=smt.executeQuery(q2);
     while(rs1.next())
     { 
        hacc=rs1.getString("LACC");
        String hatype=rs1.getString("LATYPE");
        hname=rs1.getString("LNAME");
        String fname=rs1.getString("LFNAME");
        String hocc=rs1.getString("LOCC");
        String hinc=rs1.getString("LNETINC");
        String hamt=rs1.getString("LAMOUNT");
        String hdur=rs1.getString("LDURATION");
        String hcapp=rs1.getString("LCOURSEAPP");
        String hiname=rs1.getString("LINSTNAME");
                  hemail=rs1.getString("LMAIL");
      jLabel18.setVisible(true);
       jLabel18.setText(hacc);jLabel19.setText(hatype);jLabel20.setText(hname);jLabel21.setText(fname);
       jLabel22.setText(hocc);jLabel23.setText(hinc);jLabel24.setText(hamt);jLabel25.setText(hdur);jLabel26.setText(hcapp);jLabel32.setText(hiname);       
     }
        }
        catch(Exception e)
    {
        
    }   
    }
    
}//GEN-LAST:event_jComboBox1ActionPerformed

private void jButton9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton9ActionPerformed
// TODO add your handling code here:
   System.exit(1);
}//GEN-LAST:event_jButton9ActionPerformed

private void jButton10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton10ActionPerformed
// TODO add your handling code here:
    if(flag==1)
    {
    try
    { 
        String p1="";
Random diceRoller = new Random();
for (int i = 0; i < 10; i++) 
    {int roll = diceRoller.nextInt(6) + 1;
p1=p1+roll;
    }
              String p2="";
Random diceRoller1 = new Random();
for ( int i = 0; i < 6; i++)

    {int roll = diceRoller1.nextInt(6) + 1;
p2=p2+roll; 
    }

            String p3="";
Random diceRoller2 = new Random();
for ( int i = 0; i < 6; i++)

    {int roll = diceRoller2.nextInt(6) + 1;
p3=p3+roll; 
    }
        System.out.println(p1);
        System.out.println(p2);
        System.out.println(p3);
        
        String s="Net Banking";
        String s1="no";
        String s2="yes";
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String  q1="UPDATE USER_DETAILS set  NET_BANKING_ISSUE='" + s2 + "' where ACC_NO='" + req + "'";
     String q2="DELETE FROM MANAGER  where REACNO='" + req+ "' AND REQUEST='"+ s +"'";
     String q3="UPDATE USER_DETAILS set NID='"+p1+"', NPASS='"+p2+"', TPASS='"+p3+"' where ACC_NO='" +req+ "'" ;
    int i= smt.executeUpdate(q1);
    /****************************************sms code**********************************************/
    if(i==1)
    {
       
       Way2Sms sm= new Way2Sms(); 
       sm.main(); 
    }
    /********************************************mail code**************************************/
    if(i==1)
    {
        smt.executeUpdate(q3);
     int j=  smt.executeUpdate(q2);
     if(j==1)
     { 
         int k=1;
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = email;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);

            // Set the FROM message

            msg.setFrom(new InternetAddress(from));

            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV BANK");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Congratulations!! Mr."+nam+" Your Net Banking is Activated your Net ID is-"+p1+" ,Login Password- "+p2+" and Transaction Password "+p3+" .please change your id and password for better security .enjoye net Banking with us");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
      
       
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Activated Successfully");
     }
     }
    }
    catch(Exception e)
    {
        
    }
    }
    
    if(flag==2)
    { int i=0;
        try
    {     
        String s="beneficiary";
        String s2="yes";
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String  q1="UPDATE BENIFICIARY set  APROVED='" + s2 + "' where UACC='" + req + "'";
     String q2="DELETE FROM MANAGER  where REACNO='" + req+ "' AND REQUEST='"+ s +"'";
  
    smt.executeUpdate(q1);
    i=1;
   
    if(i==1)
    {
        
     int j= smt.executeUpdate(q2);
    
     if(j==1)
     { 
         
       Way2Sms sm= new Way2Sms(); 
       sm.main();
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = email;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);

            // Set the FROM message

            msg.setFrom(new InternetAddress(from));

            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV BANK");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Congratulations!! Mr."+nam+" Your Beneficiary "+bname+" Account number "+bacc+" has been Approved Now u can transfer your funds as per given limit  .enjoye net Banking with us");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
       
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Approved Successfully");
     }
     }
    }
    catch(Exception e)
    {
        
    }  
    }
    /********************************************atm requests*******************************************/
     if(flag==3)
    {
    try
    { 
        String p1="";
Random diceRoller = new Random();
for (int i = 0; i < 16; i++) 
    {int roll = diceRoller.nextInt(6) + 1;
p1=p1+roll;
    }
              String p2="";
Random diceRoller1 = new Random();
for ( int i = 0; i < 3; i++)

    {int roll = diceRoller1.nextInt(6) + 1;
p2=p2+roll; 
    }

            String p3="";
Random diceRoller2 = new Random();
for ( int i = 0; i < 4; i++)

    {int roll = diceRoller2.nextInt(6) + 1;
p3=p3+roll; 
    }
        System.out.println(p1);
        System.out.println(p2);
        System.out.println(p3);
	 Calendar cal = new GregorianCalendar();
         int month = cal.get(Calendar.MONTH);
         month=month+1;
  int year = cal.get(Calendar.YEAR);
  String dat=month +"/"+ year;
  System.out.println(dat);
        String s="Net Banking";
        String s1="no";
        String s2="yes";
        String s3="ATM CUM DEBIT";
        String hnam="";
        String s4="ATM";
        int z=0;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String  q1="SELECT * from USER_DETAILS  where ACC_NO='" + req + "'";
     String q2="DELETE FROM ATM  where ATMACC='" + req+ "'";
     String q3="UPDATE USER_DETAILS set ATM__ISSUE='"+s1+"' where ACC_NO='" +req+ "'" ;
     String q6="DELETE from MANAGER where REACNO='" +req+ "'AND REQUEST='"+s4+"'";
    ResultSet r= smt.executeQuery(q1);
    while(r.next())
    {
        String atm= r.getString("ATM__ISSUE");
        hnam=r.getString("NAME");
        if(atm.equals(s2))
        {
            smt.executeUpdate(q2);
             smt.executeUpdate(q3);
             String q4="INSERT INTO ATM VALUES('"+req+"','"+p1+"','"+s3+"','"+hnam+"','"+p2+"','"+p3+"','"+dat+"')";
             smt.executeUpdate(q4);
            String q5="UPDATE USER_DETAILS set ATM__ISSUE='"+s2+"' where ACC_NO='" +req+ "'" ;
            smt.executeUpdate(q5);
            smt.executeUpdate(q6);
            z=1;
        }
        if(atm.equals(s1))
        {
           String q4="INSERT INTO ATM VALUES('"+req+"','"+p1+"','"+s3+"','"+hnam+"','"+p2+"','"+p3+"','"+dat+"')";
             smt.executeUpdate(q4);
            String q5="UPDATE USER_DETAILS set ATM__ISSUE='"+s2+"' where ACC_NO='" +req+ "'" ;
            smt.executeUpdate(q5);
            smt.executeUpdate(q6);
             z=1;
        }
     if(z==1)
     {
         
       Way2Sms sm= new Way2Sms(); 
       sm.main();
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = email;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);

            // Set the FROM message

            msg.setFrom(new InternetAddress(from));

            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV BANK");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Congratulations!! Mr."+nam+" your new atm has been issued to u");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
      
       
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Activated Successfully");
     }
     }
    }
    catch(Exception e)
    {
        
    }
    }
    
   /***********************************************HOME LOAN**********************************************************/
    if(flag==6)
    {
          try
    {     
        String s2="approved";
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String  q1="UPDATE HLOAN set  STATUS='" + s2 + "' where HACC='" + req + "'";
  
    int i= smt.executeUpdate(q1);
    if(i==1)
    { 
        
       Way2Sms sm= new Way2Sms(); 
       sm.main();
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = hemail;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);

            // Set the FROM message

            msg.setFrom(new InternetAddress(from));

            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV BANK");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Congratulations!! Mr."+hname+" Your request for HOME LOANE Has been approved please contact the Manager Of Your Branch on working days between 2 p.m to 4.p.m.with the print out of this mail. NOTE: This Approval will be vaild for only one week");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
      
       
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Approved Successfully");
     }
    }
    catch(Exception e)
    {
        
    }  
    }
    /**********************************education loan***********************************************/
     if(flag==7)
    {
          try
    {     
        String s2="approved";
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String  q1="UPDATE ELOAN set  STATUS='" + s2 + "' where LACC='" + req + "'";
  
    int i= smt.executeUpdate(q1);
    if(i==1)
    { 
        
       Way2Sms sm= new Way2Sms(); 
       sm.main();
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = hemail;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);

            // Set the FROM message

            msg.setFrom(new InternetAddress(from));

            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV BANK");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Congratulations!! Mr."+hname+" Your request for EDUCATIOn LOAN Has been approved please contact the Manager Of Your Branch on working days between 2 p.m to 4.p.m.with the print out of this mail. NOTE: This Approval will be vaild for only one week");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
      
       
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Approved Successfully");
     }
    }
    catch(Exception e)
    {
        
    }  
    }
}//GEN-LAST:event_jButton10ActionPerformed

private void jButton11ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton11ActionPerformed
// TODO add your handling code here:
    if(flag==1)
    {
     try
    {
        
        String s="Net Banking";

     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String q2="DELETE FROM MANAGER  where REACNO='" + req+ "' AND REQUEST='"+ s +"'";
   
     int j=  smt.executeUpdate(q2);
     if(j==1)
     { 
         
       Way2Sms sm= new Way2Sms(); 
       sm.main();
         int k=1;
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = email;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);
            // Set the FROM message

            msg.setFrom(new InternetAddress(from));
            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV Bank");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Mr."+nam+" Your Net Banking is not activated becose of some account details are missing please contaxt to your nearest ddsv brach.");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
         
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Canceled successfull");
     }
     
    }
    catch(Exception e)
    {
        
    }
    }
    
    if(flag==2)
    {
      try
      {
            
        String s="beneficiary";

     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String q2="DELETE FROM MANAGER  where REACNO='" + req+ "' AND REQUEST='"+ s +"'";
   
     int j=  smt.executeUpdate(q2);
     if(j==1)
     { 
         
       Way2Sms sm= new Way2Sms(); 
       sm.main();
         int k=1;
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = email;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);
            // Set the FROM message

            msg.setFrom(new InternetAddress(from));
            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV Bank");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Mr."+nam+" Your Beneficiary is not Approved becose of some account details are missing please contant to your nearest ddsv branch.");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
         
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Rejected successfull");
     }  
      }
      catch(Exception e)
    {
        
    }
    }
    
     if(flag==6)
    {
          try
    {     
        String s2="pending";
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String  q1="DELETE FROM HLOAN where HACC='" + req + "' AND STATUS='" + s2 + "'";
  
    int i= smt.executeUpdate(q1);
    if(i==1)
    { 
        
       Way2Sms sm= new Way2Sms(); 
       sm.main();
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = hemail;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);

            // Set the FROM message

            msg.setFrom(new InternetAddress(from));

            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV BANK");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Sorry Mr."+hname+" Your request for HOME LOANE Has been Rejected due to our bank policy.");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
      
       
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Rejected Successfully");
     }
    }
    catch(Exception e)
    {
        
    }  
    }
     /********************************************education loan reject*************************************/
      if(flag==7)
    {
          try
    {     
        String s2="pending";
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String  q1="DELETE FROM ELOAN where LACC='" + req + "' AND STATUS='" + s2 + "'";
  
    int i= smt.executeUpdate(q1);
    if(i==1)
    { 
        
       Way2Sms sm= new Way2Sms(); 
       sm.main();
       jComboBox1.removeItem(req);
       
       /**          ***************             mail start        */
       String host = "smtp.gmail.com";

        String from = "noreplyddsv@gmail.com";

        String to = hemail;
         Properties props = new Properties();

        props.put("mail.smtp.host", host);

        props.put("mail.smtp.port", 25);

        props.put("mail.debug", "true");

        props.put("mail.transport.protocol", "smtp");

        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.starttls.enable", "true");
       
        // Get session with authenticator

        Session session = Session.getInstance(props, new GMailAuthenticator());
        try {
            // Instantiate a message
            Message msg = new MimeMessage(session);

            // Set the FROM message

            msg.setFrom(new InternetAddress(from));

            // The recipients can be more than one so we use an array but you can

            // use 'new InternetAddress(to)' for only one address.

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);
          
            // Set the message subject and date we sent it.
            msg.setSubject("DDSV BANK");
            msg.setSentDate(new Date());
            // Set message content
            msg.setText("Sorry Mr."+hname+" Your request for EDUCATION LOAN Has been Rejected due to our bank policy.");
            // Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
      
       
       /********************mail end****************************************/
        jLabel29.setVisible(true);
        jLabel29.setText("Rejected Successfully");
     }
    }
    catch(Exception e)
    {
        
    }  
    }

}//GEN-LAST:event_jButton11ActionPerformed

String j1;
private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
// TODO add your handling code here:
    flag=2;
    try
    {
         jComboBox1.setVisible(true);
         jLabel9.setVisible(true);
    jLabel10.setVisible(true);
    jLabel11.setVisible(true);
    jLabel12.setVisible(true);
    jLabel13.setVisible(true);
    jLabel14.setVisible(false);jLabel15.setVisible(false);jLabel16.setVisible(false);jLabel17.setVisible(false);
    
    jLabel18.setVisible(true);
    jLabel19.setVisible(true);
    jLabel20.setVisible(true);
    jLabel21.setVisible(true);
    jLabel22.setVisible(true);
    jButton10.setVisible(true);jButton11.setVisible(true);jButton9.setVisible(true);
    jButton10.setText("ACTIVATE");
    jButton11.setText("REJECT"); 
    jLabel8.setVisible(true);
    
    jLabel9.setText("ACCOUNT NO.");
jLabel10.setText("BENEFICIARY ACCOUNT");
jLabel11.setText("BENEFICIARY  NAME");
jLabel12.setText("IFSC CODE.");
jLabel13.setText("LIMIT.");

    String s="beneficiary";
    jLabel8.setText("Beneficiary Requests :");  
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
     String q1="select * from MANAGER where MBRANCHCODE='"+ code +"' AND REQUEST='"+s+"'";
      ResultSet rs=smt.executeQuery(q1);
     jComboBox1.setVisible(true);
     jComboBox1.removeAllItems();
     String z="select";
     jComboBox1.addItem(z); 
     while(rs.next())
     {
         String j= rs.getString("REACNO");
         j1= rs.getString("REBENIFICIARY");
         System.out.println(j);
         jComboBox1.addItem(j);
         
     }
    }
    catch(Exception e)
    {
        
    }
}//GEN-LAST:event_jButton3ActionPerformed

private void jButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton7ActionPerformed
// TODO add your handling code here:
    flag=6;
    try
    {
     jComboBox1.setVisible(false);
    jLabel9.setVisible(true);
    jLabel10.setVisible(true);
    jLabel11.setVisible(true);
    jLabel12.setVisible(true);
    jLabel13.setVisible(true);
    jLabel14.setVisible(true);
    jLabel15.setVisible(true);
    jLabel16.setVisible(true);
    jLabel17.setVisible(true);
    jLabel18.setVisible(true);
    jLabel19.setVisible(true);
    jLabel20.setVisible(true);
    jLabel21.setVisible(true);
    jLabel22.setVisible(true);
    jLabel23.setVisible(true);
    jLabel24.setVisible(true);
    jLabel25.setVisible(true);
    jLabel26.setVisible(true);
    
    jLabel9.setText("ACCOUNT NO.");
    jLabel10.setText("ACCOUNT TYPE");
    jLabel11.setText("NAME");
    jLabel12.setText("OCCUPATION");
    jLabel13.setText("INCOME");
    jLabel14.setText("LOAN AMOUNT");
    jLabel15.setText("LOAN DURATION");
    jLabel16.setText("PHONE NO.");
    jLabel17.setText("ADDRESS.");
     
    
    jButton10.setVisible(true);jButton11.setVisible(true);jButton9.setVisible(true);
    jButton10.setText("ACTIVATE");
    jButton11.setText("REJECT"); 
    jLabel8.setVisible(true);
    jLabel8.setText("HOME LOAN REQUESTS :");  
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    String st="pending";
     String q1="select * from HLOAN where HBCODE='"+ code +"' AND STATUS='"+ st +"'";
      ResultSet rs=smt.executeQuery(q1);
     jComboBox1.setVisible(true);
     jComboBox1.removeAllItems();
     String z="select";
     jComboBox1.addItem(z);
     while(rs.next())
     {
         String j= rs.getString("HACC");
         System.out.println(j);
         jComboBox1.addItem(j);
         
     }   
    }
    catch(Exception e)
    {
        
    }
}//GEN-LAST:event_jButton7ActionPerformed

private void jButton12ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton12ActionPerformed
// TODO add your handling code here:
    jPanel3.setVisible(false);
    jPanel4.setVisible(false);
    jPanel2.setVisible(true);
    
}//GEN-LAST:event_jButton12ActionPerformed

private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
// TODO add your handling code here:
   flag=7;
   try
    {
     jComboBox1.setVisible(false);
    jLabel9.setVisible(true);
    jLabel10.setVisible(true);
    jLabel11.setVisible(true);
    jLabel12.setVisible(true);
    jLabel13.setVisible(true);
    jLabel14.setVisible(true);
    jLabel15.setVisible(true);
    jLabel16.setVisible(true);
    jLabel17.setVisible(true);
    jLabel18.setVisible(true);
    jLabel19.setVisible(true);
    jLabel20.setVisible(true);
    jLabel21.setVisible(true);
    jLabel22.setVisible(true);
    jLabel23.setVisible(true);
    jLabel24.setVisible(true);
    jLabel25.setVisible(true);
    jLabel26.setVisible(true);
     jLabel30.setVisible(true); jLabel32.setVisible(true);
    
    jLabel9.setText("ACCOUNT NO.");
    jLabel10.setText("ACCOUNT TYPE");
    jLabel11.setText("NAME");
     jLabel12.setText("FATHER NAME");
    jLabel13.setText("OCCUPATION");
    jLabel14.setText("INCOME");
    jLabel15.setText("LOAN AMOUNT");
    jLabel16.setText("LOAN DURATION");
    jLabel17.setText("COURSE APPLIED");
     jLabel30.setText("INSTITUTE NAME");
     
    jButton10.setVisible(true);jButton11.setVisible(true);jButton9.setVisible(true);
    jButton10.setText("ACTIVATE");
    jButton11.setText("REJECT"); 
    jLabel8.setVisible(true);
    jLabel8.setText("EDUCATION LOAN REQUESTS :");  
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
    Statement smt=con.createStatement();
    String st="pending";
     String q1="select * from ELOAN where LBCODE='"+ code +"' AND STATUS='"+ st +"'";
      ResultSet rs=smt.executeQuery(q1);
     jComboBox1.setVisible(true);
     jComboBox1.removeAllItems();
     String z="select";
     jComboBox1.addItem(z);
     while(rs.next())
     {
         String j= rs.getString("LACC");
         System.out.println(j);
         jComboBox1.addItem(j);
         
     }   
    }
    catch(Exception e)
    {
        
    }
}//GEN-LAST:event_jButton8ActionPerformed

private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
// TODO add your handling code here:
    flag=3;
     try
    {
    jComboBox1.setVisible(false);
    jLabel9.setVisible(true);
    jLabel10.setVisible(true);
    jLabel11.setVisible(true);
    jLabel12.setVisible(true);
    jLabel13.setVisible(true);
    jLabel14.setVisible(true);
    jLabel18.setVisible(true);
    jLabel19.setVisible(true);
    jLabel20.setVisible(true);
    jLabel21.setVisible(true);
    jLabel22.setVisible(true);
    jLabel23.setVisible(true);jLabel15.setVisible(false);jLabel16.setVisible(false);jLabel17.setVisible(false);jLabel30.setVisible(false);
     jLabel24.setVisible(true);jLabel25.setVisible(false);jLabel26.setVisible(false);jLabel32.setVisible(false);
    jLabel9.setText("ACCOUNT NO.");
    jLabel10.setText("PURPOSE");
    jLabel11.setText("ATM NUMBER");
     jLabel12.setText("ATM TYPE");
    jLabel13.setText("HOLDER NAME");
    jLabel14.setText("EXPIRY DATE");  
    jButton10.setVisible(true);jButton11.setVisible(false);jButton9.setVisible(true);
     jButton10.setText("ISSUE"); jButton11.setText("BLOCK");
    
    jLabel8.setVisible(true);
    jLabel8.setText("ATM REQUESTS :");  
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String s="ATM";
     String q1="select * from MANAGER where MBRANCHCODE='"+ code +"' AND REQUEST='"+s+"'";
     ResultSet rs=smt.executeQuery(q1);
     jComboBox1.setVisible(true);
     jComboBox1.removeAllItems();
     String z="select";
     jComboBox1.addItem(z);
     while(rs.next())
     {
         String j= rs.getString("REACNO");
         System.out.println(j);
         jComboBox1.addItem(j);
         
     }   
    }
    catch(Exception e)
    {
        
    }
}//GEN-LAST:event_jButton4ActionPerformed

private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
// TODO add your handling code here:
flag=4;
     try
    {
    jComboBox1.setVisible(false);
    jLabel9.setVisible(true);
    jLabel10.setVisible(true);
    jLabel11.setVisible(true);
    jLabel12.setVisible(true);
    jLabel13.setVisible(true);
    jLabel14.setVisible(true);
    jLabel18.setVisible(true);
    jLabel19.setVisible(true);
    jLabel20.setVisible(true);
    jLabel21.setVisible(true);
    jLabel22.setVisible(true);
    jLabel23.setVisible(true);
    jLabel15.setVisible(false);jLabel16.setVisible(false);jLabel17.setVisible(false);jLabel30.setVisible(false);
      jLabel24.setVisible(false);jLabel25.setVisible(false);jLabel26.setVisible(false);jLabel32.setVisible(false);
    jLabel9.setText("ACCOUNT NO.");
    jLabel10.setText("NAME");
    jLabel11.setText("PURPOSE");
     jLabel12.setText("PHONE NUMBER");
    jLabel13.setText("E-MAIL ADDRESS");
    jLabel14.setText("ADDRESS");  
    jButton10.setVisible(true);jButton11.setVisible(true);jButton9.setVisible(true);
     jButton10.setText("ISSUE"); jButton11.setText("BLOCK");
    
    jLabel8.setVisible(true);
    jLabel8.setText("PASSBOOK REQUESTS :");  
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con= DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
     Statement smt=con.createStatement();
     String s="PASSBOOK";
     String q1="select * from MANAGER where MBRANCHCODE='"+ code +"' AND REQUEST='"+s+"'";
     ResultSet rs=smt.executeQuery(q1);
     jComboBox1.setVisible(true);
     jComboBox1.removeAllItems();
     String z="select";
     jComboBox1.addItem(z);
     while(rs.next())
     {
         String j= rs.getString("REACNO");
         System.out.println(j);
         jComboBox1.addItem(j);
         
     }   
    }
    catch(Exception e)
    {
        
    }    
    
}//GEN-LAST:event_jButton5ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton10;
    private javax.swing.JButton jButton11;
    private javax.swing.JButton jButton12;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JButton jButton7;
    private javax.swing.JButton jButton8;
    private javax.swing.JButton jButton9;
    private javax.swing.JComboBox jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel30;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JLabel jLabel32;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPasswordField jPasswordField1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JPanel mainPanel;
    private javax.swing.JLabel msg;
    private javax.swing.JTextField txtmid;
    // End of variables declaration//GEN-END:variables
private static final String username = "noreplyddsv";
String msg2="hello mr./miss "+ nam +" your request is processed please check your mail. regards: DDSV BANK";
    private static final String password = "ddsvbank";
    private int flag;
    private final Timer messageTimer;
    private final Timer busyIconTimer;
    private final Icon idleIcon;
    private final Icon[] busyIcons = new Icon[15];
    private int busyIconIndex = 0;
private String sessionCookie;
    private Proxy proxy;
    private String baseurl;
    private static Random svcRand = new Random();
    private int a;
    private JDialog aboutBox;
     
}
