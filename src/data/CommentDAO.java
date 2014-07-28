package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Comment;

public class CommentDAO {
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
	
	public synchronized static ArrayList<Comment> getComments() {
	 	ArrayList<Comment> comments = new ArrayList<Comment>();
	 	Comment comment;
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM comments";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				comment = new Comment();
				comment.setCommentID(rs.getInt("com_ID"));
				comment.setCommentAuthorID(rs.getString("com_author_ID"));
				comment.setCommentAuthor(rs.getString("com_author"));
				comment.setCommentArticleID(rs.getString("com_article_ID"));
				comment.setCommentText(rs.getString("com_content"));
				comments.add(comment);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return comments;
	}
	
	public synchronized static int addComment(Comment comment){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "INSERT INTO comments(com_author,com_content) values(?,?);";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, comment.getCommentAuthor());
	    	statement.setString(2, comment.getCommentText());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	public synchronized static int deleteComment(int commentID){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "delete from comments where com_ID=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, commentID);
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static Comment getComment(String commentID){
		Comment comment = new Comment();
	 	PreparedStatement statement=null;
		String preparedSQL = "select * from comments where com_id=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, Integer.parseInt(commentID));
	    	ResultSet rs = statement.executeQuery();
	    	rs.next();
	    	comment.setCommentID(rs.getInt("com_ID"));
			comment.setCommentAuthorID(rs.getString("com_author_ID"));
			comment.setCommentAuthor(rs.getString("com_author"));
			comment.setCommentArticleID(rs.getString("com_article_ID"));
			comment.setCommentText(rs.getString("com_content"));
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return comment;
	}
	
	public synchronized static int updateComment(Comment comment){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "update comments set com_content=?, com_author=? where comment_id=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, comment.getCommentText());
	    	statement.setString(2, comment.getCommentAuthor());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static ArrayList<Comment> getArticleComments(int articleID) {
	 	ArrayList<Comment> comments = new ArrayList<Comment>();
	 	Comment comment;
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM comments WHERE com_article_id=?";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, articleID);
	    	ResultSet rs = statement.executeQuery();
			while(rs.next()){
				comment = new Comment();
				comment.setCommentID(rs.getInt("com_ID"));
				comment.setCommentAuthorID(rs.getString("com_author_ID"));
				comment.setCommentAuthor(rs.getString("com_author"));
				comment.setCommentArticleID(rs.getString("com_article_ID"));
				comment.setCommentText(rs.getString("com_content"));
				comments.add(comment);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return comments;
	}

}
