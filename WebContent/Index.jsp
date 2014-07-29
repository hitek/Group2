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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/nav.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/reset.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/style.css" type="text/css"></link>
	<!--[if lt IE 9]>
  	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  	<![endif]-->
  	
</head>
<body>
<div id="wrapper">
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	
	<jsp:include page="header.jsp" />
	<%
		for(i=0;i<articles.size();i++){
			article = articles.get(i);
	%>
		<div class=article>
		<div id=articleheader>
    		<div id="title"><p>><%=article.getArticleTitle()%></p></div><div class="clear"></div> 
    			<p>Published by : <%=article.getArticleAuthor()%> on <%=article.getArticleDate()%> 
  			</div><div class="clear"></div> 
  			<div id="text"><%=article.getArticleText()%></div>
  			<div id=articlefooter> </div>
  		</div>
	<%		
		}
	%>
	</div>
</div>		
</body>
</html>