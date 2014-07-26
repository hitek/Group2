package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CategoryDAO {

	private static Connection connection=null;

	public static Connection getConnection(){
		 Connection conn=null;
		 
	        try {
	        	Class.forName("com.mysql.jdbc.Driver"); 
	            conn = DriverManager.getConnection("jdbc:mysql://hightower2.cis.uafs.edu:3306/group2?user=group2&password=g5432c");
	        }
	        catch (SQLException ex) {
	            System.out.println("Error: " + ex);
	            return null;
	        }
	        catch(NullPointerException ex) {
	        	System.out.println("Error: " + ex);
	        	return null;
	        } catch (ClassNotFoundException ex) {
	        	System.out.println("Error: " + ex);
			}
	        return conn;		
		}	
}
