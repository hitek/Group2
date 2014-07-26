<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
	
<%
%>
	
<%

	ArrayList<Article> articles;
	Article article;
	int i;
	
	articles=ArticleDAO.getArticles();
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Index</title>
	<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/reset.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/style.css" type="text/css"></link>
	<!--[if lt IE 9]>
  	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  	<![endif]-->
  	
</head>
<body>
<div id="wrapper">
	<div id="page">
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
	</div>
</dive>		
</body>
</html>