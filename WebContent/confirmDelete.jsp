<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
    
<%//******** Protected Page Check ***********
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
%>
    
<%
	//********** delete article ***************
	if(request.getMethod().equalsIgnoreCase("POST")){
		String articleID = request.getParameter("articleID");
		
		int status = ArticleDAO.deleteArticle(Integer.parseInt(articleID));
		
		response.sendRedirect("admin.jsp");	
		return;
	}
%>
<%
//********** get article info ************************
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
<title>Confirm Delete</title>
</head>
<body>
	<form action="" method="POST">
	<p> Are you sure you want to delete this article?:</p>
		<input type="hidden" name="articleID" value="<%=articleID%>">
		<p>Article title:<%=title%></p>
		<p>Name:<%=author%></p>
		<p>Article text:<%=text%></p>
		<input type="submit" name="submit" value="Yes I'm sure"/>
		<input type="submit" name="submit" formaction="admin.jsp" value="No"/>
	</form>
</body>
</html>
<%}%>