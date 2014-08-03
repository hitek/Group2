package beans;

public class Category {
	private int categoryID;
	private String categoryName;
	private int categoryOwnerID;
	private String categoryOwner;
	private int categoryParentCateID;
	private String categoryParentCate;
	
	
	public int getCategoryID() {//Lee Hawthorne
		return categoryID;
	}
	public  void setCategoryID(int categoryID) {//Lee Hawthorne
		this.categoryID = categoryID;
	}
	
	public String getCategoryName() {//Lee Hawthorne
		return categoryName;
	}
	public void setCategoryName(String categoryName) {//Lee Hawthorne
		this.categoryName = categoryName;
	}
	
	public int getCategoryOwnerID() {//Lee Hawthorne
		return categoryOwnerID;
	}
	public void setCategoryOwnerID(int categoryOwnerID) {//Lee Hawthorne
		this.categoryOwnerID = categoryOwnerID;
	}
	
	public String getCategoryOwner() {//Lee Hawthorne
		return categoryOwner;
	}
	public void setCategoryOwner(String categoryOwner) {//Lee Hawthorne
		this.categoryOwner = categoryOwner;
	}
	
	public int getCategoryParentCateID() {//Lee Hawthorne
		return categoryParentCateID;
	}
	public void setCategoryParentCateID(int categoryParentCateID) {//Lee Hawthorne
		this.categoryParentCateID = categoryParentCateID;
	}
	
	public String getCategoryParentCate() {//Lee Hawthorne
		return categoryParentCate;
	}
	public void setCategoryParentCate(String categoryParentCate) {//Lee Hawthorne
		this.categoryParentCate = categoryParentCate;
	}
}
