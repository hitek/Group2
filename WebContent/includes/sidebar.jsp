<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
<%
	ArrayList<Article> articles;
	Article article;
	int i = 0;
	
	articles=ArticleDAO.getArticles();
%>
 
<div id="sidebar">
	<div id="sidebarheader"><h2>Latest Articles</h2></div>
	<div id="sidebarmain">
	<% /*
		for(i=0;i<10;i++){
			article = articles.get(i);
	%>
		<ul>
			<li><a href="ArticleDisplay.jsp"><%=article.getArticleTitle()%></a></li>
		</ul></div>
	<%		
		}*/
	%>
</div>
