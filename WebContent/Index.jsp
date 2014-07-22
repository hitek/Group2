<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
	
<%
%>
	
<%
//Zack Moore
	ArrayList<Article> articles;
	Article article;
	int i;
	
	articles=ArticleDAO.getArticles();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Index</title>
	<link href="adminStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<a href="login.jsp">login</a><br>
<%
		for(i=0;i<articles.size();i++){
			article = articles.get(i);
%>
		<div class=article>
		<p class=ArclTitle><b><%=article.getArticleTitle()%></b></p>
			<p class=ArclText><%=article.getArticleText()%><br>
			posted by <%=article.getArticleAuthor()%> on <%=article.getArticleDate()%></p><br>
		</div>
<%		
		}
%>		
</body>
</html>