package beans;

public class Article {
	private int articleID;
	private int articlePublish;
	private String articleTitle;
	private String articleAuthor;
	private String articleText;
	private String articleDate;
	private Long cateID;
	private String categoryName;
	
	public int getArticleID() {
		return articleID;
	}
	public void setArticleID(int articleID) {
		this.articleID = articleID;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleAuthor() {
		return articleAuthor;
	}
	public void setArticleAuthor(String articleAuthor) {
		this.articleAuthor = articleAuthor;
	}
	public String getArticleText() {
		return articleText;
	}
	public void setArticleText(String articleText) {
		this.articleText = articleText;
	}
	public String getArticleDate() {
		return articleDate;
	}
	public void setArticleDate(String articleDate) {
		this.articleDate = articleDate;
	}
	public int getPublish() {
		return articlePublish;
	}
	public void setPublish(int articlePublish) {
		this.articlePublish = articlePublish;
	}
	public Long getCateID() {//Lee Hawthorne
		return cateID;
	}
	public  void setCateID(Long categoryID) {//Lee Hawthorne
		this.cateID = categoryID;
	}
	public String getCategoryName() {//Lee Hawthorne
		return categoryName;
	}
	public void setCategoryName(String categoryName) {//Lee Hawthorne
		this.categoryName = categoryName;
	}
}
