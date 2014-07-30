<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
    
<%//*************get articles***************
	ArrayList<Article> articles;
	Article article;
	int i;
	String author = request.getParameter("author");
	session.setAttribute("author", author);
	articles=ArticleDAO.getArtByAuthor("author");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	  
	  <a href="Index.jsp">Back to Index</a>
	    	<jsp:include page="header.jsp" />
		<form action="" method="get">
		<p>
		All the articles by <%=author%>
		</p>
		<%
			String typeName="";
			int type=0;
			for(i=0;i<articles.size();i++){
				article = articles.get(i);
				
		%>
		<div class=ArticleList>
			<b><a href="ArticleDisplay.jsp?articleID=<%=article.getArticleID()%>"><%=article.getArticleTitle() %></a></b>
			<h6 align="right"><%=article.getArticleDate().substring(0, 10) %></h6>
			
		</div>
		<%		
		}
		%>		
		
		</form>
	</div>
</div>	

</body>
</html>