package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Article;
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
	//***************Eden Melgar*****************************
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
				user.setUser_type(rs.getInt("user_type"));
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
		String preparedSQL = "INSERT INTO user(user_name, user_psword, user_type) values(?,?,?)";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, user.getUser_name());
	    	statement.setString(2, user.getUser_psword());
	    	statement.setInt(3, user.getUser_type());
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
		String preparedSQL = "DELETE FROM user WHERE user_ID = ?";
		
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
	//***************Eden Melgar*****************************
	public synchronized static User getUser(String userID){//Lee Hawthorne
		User user = new User();
	 	PreparedStatement statement=null;
		String preparedSQL = "select * from user where user_id=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, Integer.parseInt(userID));
	    	ResultSet rs = statement.executeQuery();
	    	rs.next();
			user.setUser_ID(rs.getInt("user_ID"));
			user.setUser_name(rs.getString("user_name"));
			user.setUser_psword(rs.getString("user_psword"));
			user.setUser_type(rs.getInt("user_type"));
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return user;
	}
	
	public synchronized static int getUserType(String username){
		User user = new User();
		int userType = 3;
	 	PreparedStatement statement=null;
		String preparedSQL = "select * from user where user_name=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, username);
	    	ResultSet rs = statement.executeQuery();
	    	rs.next();
			user.setUser_ID(rs.getInt("user_ID"));
			user.setUser_name(rs.getString("user_name"));
			user.setUser_psword(rs.getString("user_psword"));
			user.setUser_type(rs.getInt("user_type"));
			userType = user.getUser_type();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return userType;
	}
	
	public synchronized static int updateUser(User user){//Lee Hawthorne
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "update user set user_name=?, user_psword=?, user_type=? where user_ID=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, user.getUser_name());
	    	statement.setString(2, user.getUser_psword());
	    	statement.setInt(3, user.getUser_type());
	    	statement.setInt(4, user.getUser_ID());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	//***************Eden Melgar*****************************
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
				user.setUser_type(rs.getInt("user_type"));
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
