package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Category;

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
	
	public synchronized static ArrayList<Category> getCategories() {//Lee Hawthorne
	 	ArrayList<Category> categories = new ArrayList<Category>();
	 	Category category;
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM category ORDER BY cate_name DESC;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				category = new Category();
				category.setCategoryID(rs.getInt("category_ID"));
				category.setCategoryName(rs.getString("cate_name"));
				category.setCategoryOwnerID(rs.getInt("cate_owner_ID"));
				category.setCategoryOwner(rs.getString("cate_owne"));
				category.setCategoryParentCateID(rs.getInt("parent_cate_ID"));
				category.setCategoryParentCate(rs.getString("parent_cate"));
				categories.add(category);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return categories;
	}
	
	public synchronized static Category getCategory(String categoryID){//Lee Hawthorne
		Category category = new Category();
	 	PreparedStatement statement=null;
		String preparedSQL = "select * from category where category_ID=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, Integer.parseInt(categoryID));
	    	ResultSet rs = statement.executeQuery();
	    	rs.next();
	    	category.setCategoryID(rs.getInt("category_ID"));
			category.setCategoryName(rs.getString("cate_name"));
			category.setCategoryOwnerID(rs.getInt("cate_owner_ID"));
			category.setCategoryOwner(rs.getString("cate_owne"));
			category.setCategoryParentCateID(rs.getInt("parent_cate_ID"));
			category.setCategoryParentCate(rs.getString("parent_cate"));
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return category;
	}
	
	public synchronized static int addCategory(Category category){//Lee Hawthorne
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "INSERT INTO category(cate_name, cate_owner_ID, cate_owne, parent_cate_ID, parent_cate) values(?,?,?,?,?);";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, category.getCategoryName());
	    	statement.setInt(2, category.getCategoryOwnerID());
	    	statement.setString(3, category.getCategoryOwner());
	    	statement.setInt(4, category.getCategoryParentCateID());
	    	statement.setString(5, category.getCategoryParentCate());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static int deleteCategory(int categoryID){//Lee Hawthorne
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "delete from category where category_id=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, categoryID);
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static int updateCategory(Category category){//Lee Hawthorne
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "update category set cate_name=?, cate_owner_ID=?, cate_owne=?, parent_cate_ID=?, parent_cate=? where category_ID=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, category.getCategoryName());
	    	statement.setInt(2, category.getCategoryOwnerID());
	    	statement.setString(3, category.getCategoryOwner());
	    	statement.setInt(4, category.getCategoryParentCateID());
	    	statement.setString(5, category.getCategoryParentCate());
	    	statement.setInt(6, category.getCategoryID());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static ArrayList<Category> getCategoryByparentID(String parent_cate_ID){//Steve Li
		ArrayList<Category> categories = new ArrayList<Category>();
	 	Category category;
	 	PreparedStatement statement=null;
		String preparedSQL = "select * from category where parent_cate_ID=?;";
	    
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, Integer.parseInt(parent_cate_ID));
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				category = new Category();
				category.setCategoryID(rs.getInt("category_ID"));
				category.setCategoryName(rs.getString("cate_name"));
				category.setCategoryOwnerID(rs.getInt("cate_owner_ID"));
				category.setCategoryOwner(rs.getString("cate_owne"));
				category.setCategoryParentCateID(rs.getInt("parent_cate_ID"));
				category.setCategoryParentCate(rs.getString("parent_cate"));
				categories.add(category);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
	    return categories;
	}
	
	
}
