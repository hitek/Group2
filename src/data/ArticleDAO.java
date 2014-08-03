package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Article;
import beans.Category;

public class ArticleDAO {

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
	
	public synchronized static ArrayList<Article> getArticles() {
	 	ArrayList<Article> articles = new ArrayList<Article>();
	 	Article article;
	 	PreparedStatement statement=null;
//		String preparedSQL = "SELECT * FROM articles ORDER BY article_date DESC;";
		String preparedSQL = "select articles.article_ID,articles.article_title,articles.article_author,articles.article_content,articles.article_date,articles.article_publish,category.category_ID,category.cate_name from articles INNER JOIN category ON articles.cate_id=category.category_ID ORDER BY article_date DESC;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				article = new Article();
				article.setArticleID(rs.getInt("articles.article_ID"));
				article.setArticleTitle(rs.getString("articles.article_title"));
				article.setArticleAuthor(rs.getString("articles.article_author"));
				article.setArticleText(rs.getString("articles.article_content"));
				article.setArticleDate(rs.getString("articles.article_date"));
				article.setPublish(rs.getInt("articles.article_publish"));
				article.setCateID(rs.getLong("category.category_ID"));
				article.setCategoryName(rs.getString("category.cate_name"));
				articles.add(article);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return articles;
	}
	
	//***************sort, Lee Hawthorne*****************************
	public synchronized static ArrayList<Article> getArticlesSort(String sortType) {
	 	ArrayList<Article> articles = new ArrayList<Article>();
	 	Article article;
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM articles ORDER BY "+sortType+" DESC;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				article = new Article();
				article.setArticleID(rs.getInt("article_id"));
				article.setArticleTitle(rs.getString("article_title"));
				article.setArticleAuthor(rs.getString("article_author"));
				article.setArticleText(rs.getString("article_content"));
				article.setArticleDate(rs.getString("article_date"));
				article.setPublish(rs.getInt("article_publish"));
				article.setCateID(rs.getLong("cate_ID"));
				articles.add(article);
			}	
			rs.close();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return articles;
	}
	
	public synchronized static int addArticle(Article article){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "INSERT INTO articles(article_title, article_author, article_content, article_publish, cate_ID, article_date) values(?,?,?,?,?,NOW());";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, article.getArticleTitle());
	    	statement.setString(2, article.getArticleAuthor());
	    	statement.setString(3, article.getArticleText());
	    	statement.setInt(4, article.getPublish());
	    	statement.setLong(5, article.getCateID());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	public synchronized static int deleteArticle(int articleID){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "delete from articles where article_id=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, articleID);
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static Article getArticle(String articleID){
		Article article = new Article();
	 	PreparedStatement statement=null;
		String preparedSQL = "select * from articles where article_id=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, Integer.parseInt(articleID));
	    	ResultSet rs = statement.executeQuery();
	    	rs.next();
			article.setArticleID(rs.getInt("article_id"));
			article.setArticleTitle(rs.getString("article_title"));
			article.setArticleAuthor(rs.getString("article_author"));
			article.setArticleText(rs.getString("article_content"));
			article.setArticleDate(rs.getString("article_date"));
			article.setPublish(rs.getInt("article_publish"));
			article.setCateID(rs.getLong("cate_ID"));
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return article;
	}
	
	public synchronized static int updateArticle(Article article){
		int status=0;
		
	 	PreparedStatement statement=null;
		String preparedSQL = "update articles set article_title=?, article_author=?, article_content=?, article_publish=?, article_date=NOW() where article_id=?;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, article.getArticleTitle());
	    	statement.setString(2, article.getArticleAuthor());
	    	statement.setString(3, article.getArticleText());
	    	statement.setInt(4, article.getPublish());
	    	statement.setInt(5, article.getArticleID());
			status = statement.executeUpdate();
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}	
	    return status;
	}
	
	public synchronized static ArrayList<Article> getArtByAuthor(String articleAuthor) {
	 	ArrayList<Article> articles = new ArrayList<Article>();
	 	Article article;
	 	if(articleAuthor.contains("edited by")){articleAuthor=articleAuthor.split(", edited by")[0];}//fixes "edited by" thing I added for admins, Lee Hawthorne 
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM articles WHERE article_author=? OR article_author LIKE '"+articleAuthor+", edited by %' ORDER BY article_date DESC;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setString(1, articleAuthor);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				article = new Article();
				article.setArticleID(rs.getInt("article_id"));
				article.setArticleTitle(rs.getString("article_title"));
				article.setArticleAuthor(rs.getString("article_author"));
				article.setArticleText(rs.getString("article_content"));
				article.setArticleDate(rs.getString("article_date"));
				articles.add(article);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return articles;
	}
	
	public synchronized static ArrayList<Article> getArtBycateID(int cate_ID) {
	 	ArrayList<Article> articles = new ArrayList<Article>();
	 	Article article;
	 	PreparedStatement statement=null;
		String preparedSQL = "SELECT * FROM articles WHERE cate_ID=? ORDER BY article_date DESC;";
		
	    try{
	    	connection = getConnection();
	    	statement = connection.prepareStatement(preparedSQL);
	    	statement.setInt(1, cate_ID);
			ResultSet rs = statement.executeQuery();
			while(rs.next()){
				article = new Article();
				article.setArticleID(rs.getInt("article_id"));
				article.setArticleTitle(rs.getString("article_title"));
				article.setArticleAuthor(rs.getString("article_author"));
				article.setArticleText(rs.getString("article_content"));
				article.setArticleDate(rs.getString("article_date"));
				articles.add(article);
			}	
			rs.close();		
			statement.close();
			connection.close();
		}catch (SQLException ex){
			System.out.println("Error: " + ex);
			System.out.println("Query: " + statement.toString());
		}
		return articles;
	}
	
	

	
}
