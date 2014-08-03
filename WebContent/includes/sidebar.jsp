<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
<%
	ArrayList<Article> articles;
	Article article;
	int i = 0;
	
	articles=ArticleDAO.getArticles();
%>
 
<div id="sidebar">

</div>
