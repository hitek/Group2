package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.User;

public class UserDAO {
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
	public synchronized static ArrayList<User> getUsers() {
	 	ArrayList<User> users = new ArrayList<User>();
	 	User user;
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM user;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				user = new User();
				user.setUser_ID(rs.getInt("user_ID"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_psword(rs.getString("user_psword"));
				users.add(user);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return users;
	}
	
	public synchronized static int addUser(User user){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "INSERT INTO user(user_name, user_psword) values(?,?)";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, user.getUser_name());
	    	statement.setString(2, user.getUser_psword());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static int removeUser(int userID){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "DELETE FROM user WHERE userID = ?";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, userID);
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static User authenticate(String username, String password) {
	 	User user=null;
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM user WHERE user_name = ? and user_psword = ?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, username);
	    	statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if(rs.next()){
				user = new User();
				user.setUser_ID(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_psword(rs.getString("user_psword"));
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return user;
	}

}
