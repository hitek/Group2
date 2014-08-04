//Zackary Moore
package beans;

public class Comment {
	private int commentID;
	private String commentAuthorID;
	private String commentAuthor;
	private int commentArticleID;
	private String commentText;
	
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getCommentAuthorID() {
		return commentAuthorID;
	}
	public void setCommentAuthorID(String commentAuthorID) {
		this.commentAuthorID = commentAuthorID;
	}
	public String getCommentAuthor() {
		return commentAuthor;
	}
	public void setCommentAuthor(String commentAuthor) {
		this.commentAuthor = commentAuthor;
	}
	public int getCommentArticleID() {
		return commentArticleID;
	}
	public void setCommentArticleID(int commentArticleID) {
		this.commentArticleID = commentArticleID;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
}