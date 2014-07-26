<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
    
<% //******** Protected Page Check ***********
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser==null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	String message = (String) session.getAttribute("message");
	if(message==null){
		message="";
	}else{
		session.removeAttribute("message");
	}
	%>/
    
	<%
//******************** add or update article *************************
	if(request.getMethod().equalsIgnoreCase("POST")){
		String articleID = request.getParameter("articleID");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String text = request.getParameter("text");
		
		Article article = new Article();
		article.setArticleTitle(title);
		article.setArticleAuthor(author);
		article.setArticleText(text);
		if(articleID!=""&&articleID!=null){
			article.setArticleID(Integer.parseInt(articleID));
			int status = ArticleDAO.updateArticle(article);
		}
		else{
			int status = ArticleDAO.addArticle(article);
		}
		response.sendRedirect("admin.jsp");	
		return;
	}
%>
<%
//*************** get article info ****************************
if(request.getMethod().equalsIgnoreCase("GET")){
	String articleID = request.getParameter("articleID");
	String title = "" ;
	String author = "";
	String text = "";
	if(articleID!=""&&articleID!=null){
		Article article = ArticleDAO.getArticle(articleID);
		title = article.getArticleTitle();
		author = article.getArticleAuthor();
		text = article.getArticleText();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Article</title>
</head>
<body>
	<form action="" method="POST">
		<%if(articleID!=null&&articleID!=""){%>
		<input type="hidden" name="articleID" value="<%=articleID%>"> 
		<p>Article title:<br/>
		<input type="text" name="title" value="<%=title%>"/></p>
		<p>Name:<br/>
		<input type="text" name="author" value="<%=author%>"/></p>
		<p>Article text:<br/>
		<textarea name="text" style="width: 400px; height: 200px;" ><%=text%></textarea></p>
		<input type="submit" name="submit" value="Submit" />
		<%}
		else{%>
		<input type="hidden" name="articleID" value=""> 
		<p>Article title:<br/>
		<input type="text" name="title" value=""/></p>
		<p>Name:<br/>
		<input type="text" name="author" value=""/></p>
		<p>Article text:<br/>
		<textarea name="text" style="width: 400px; height: 200px;" ></textarea></p>
		<input type="submit" name="submit" value="Submit" />
		<%}%>
		
	</form>
</body>
</html>
<%
}%>