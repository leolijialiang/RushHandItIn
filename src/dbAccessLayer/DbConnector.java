package dbAccessLayer;
import java.sql.*;

public class DbConnector {
	private static String url = "jdbc:mysql://localhost:3306/wineguy";
	private static String dbusr = "root";
	private static Connection conn=null;
	private	static String dbPass ="3356123037P";
	private static ResultSet rs;
     	
     	
     public static Connection getConn()
     {
    	 try
  		{
  			Class.forName("com.mysql.jdbc.Driver");
  			conn = DriverManager.getConnection(url,dbusr,dbPass);
  		} 
    	 catch (Exception e) 
    	 {
  		// TODO Auto-generated catch block
  			e.printStackTrace();
    	 }
    	 return conn;
      }
     
     public static ResultSet exeQuerySQL(String str)
     { 
    	 try
    	 { 
    		 Statement stmt = conn.createStatement(); 
    		 rs = stmt.executeQuery(str); 
    	 } 
    	 catch(Exception e)
    	 { 
    		 e.printStackTrace(); 
    	 } 
    	 return rs; 
    }
     
     public static void exeSQL(String str)
     {
    	 try
    	 {
    		 Statement stmt = conn.createStatement();
    		 stmt.execute(str);
    	 }
    	 catch (Exception e)
    	 {
    		 e.printStackTrace();
    	 }
    	 
     }
}


