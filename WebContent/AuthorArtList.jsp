<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
    
<%//*************get articles***************
	ArrayList<Article> articles;
	Article article;
	int i;
	String author = request.getParameter("author");
	session.setAttribute("author", author);//do we really need this in session?, and is it removed anywhere?
	articles=ArticleDAO.getArtByAuthor(author);//needs to be author instead of "author","author" will only search for the word author
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<jsp:include page="/includes/header.jsp" />
<div id="wrapper">
	<div id="page">
	  
	  <a href="Index.jsp">Back to Index</a><br><br>

		<form action="" method="get">
		<p>
		<%if(author.contains("edited by")){author=author.split(", edited by")[0];}//makes "edited by" thing I added for admins go away, Lee Hawthorne
		//Should be able to paste this anywhere you want just the author name to show up. Just change the author variable name to whatever you're using for author name
		%>
		All the articles by <%=author%><br><br>
		</p>
		<%
			String typeName="";
			int type=0;
			for(i=0;i<articles.size();i++){
				article = articles.get(i);
				
		%>
		<div class=ArticleList>
			<b><a href="ArticleDisplay.jsp?articleID=<%=article.getArticleID()%>"><%=article.getArticleTitle() %></a>
			<h6 align="right"><%=article.getArticleDate().substring(0, 10) %></h6>
			
		</div>
		<%		
		}
		%>		
		
		</form>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>	

</body>
</html>