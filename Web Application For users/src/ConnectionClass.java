import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;


public class ConnectionClass {
	

	public static void main(String[] args)
	{ 
		
		System.out.println("Hello");
		try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
		Connection conn=DriverManager.getConnection("jdbc:odbc:NetBanking","system","vv2339");
		PreparedStatement stmt=conn.prepareStatement("select city from atmlocator where state='?'");
		ResultSet rs=stmt.executeQuery();
		System.out.println("Hello");
		
		while(rs.next())
		{
			String s1=rs.getString("city");
			System.out.println(s1);
		}
		
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
