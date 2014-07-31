<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
<%//******** Protected Page Check ***********
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser==null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	if(currentUser.getUser_type()==1){
		response.sendRedirect("Author.jsp");//Lee Hawthorne
		return;
	}
	if(currentUser.getUser_type()==0){
		response.sendRedirect("index.jsp");//Lee Hawthorne
		return;
	}
	
	String message = (String) session.getAttribute("message");
	if(message==null){
		message="";
	}else{
		session.removeAttribute("message");
	}
%>

<%//*************get articles***************
	String sortType=request.getParameter("sortType");//sort, Lee Hawthorne
	ArrayList<Article> articles;
	Article article;
	int i;
	
	//*******sort, Lee Hawthorne*******************
		if(("").equals(sortType) || sortType==null || sortType.equals("article_date")){articles=ArticleDAO.getArticles();}
		else{articles=ArticleDAO.getArticlesSort(sortType);}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Index</title>
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
		<form action="AddArticle.jsp" method="get">
			<input type="hidden" name="articleID" value="">
			<input type="submit" name="submit" value="Add Article"/>
		</form>
		<form action="" method="get">
			Sort:
			<select name="sortType">
				<option value="article_date">Date</option>
				<option value="cate_ID">Category</option>
				<option value="article_author">Author</option>
				<option value="article_title">Title</option>
			</select>
			<input type="submit" name="submit" value="Submit"/>
		</form>
		<form action="AddArticle.jsp" method="get">
		<!-- sort, Lee Hawthorne -->
		<%
			for(i=0;i<articles.size();i++){
			article = articles.get(i);
		%>
		
		<div class=article>
		<div id=articleheader>
    		<div id="title"><input type="radio" name="articleID" value="<%=article.getArticleID()%>"><a href="ArticleDisplay.jsp?articleID=<%=article.getArticleID()%>">><%=article.getArticleTitle()%></a></div><div class="clear"></div> 
    			<p>Published by : <%=article.getArticleAuthor()%> on <%=article.getArticleDate()%> 
  			</div><div class="clear"></div> 
  			<div id="text"><%=article.getArticleText()%></div>
  			<div id=articlefooter> </div>
  		</div>
		<%		
		}
		%>		
			<input type="submit" name="submit" value="update"/>
			<input type="submit" name="submit" formaction="confirmDelete.jsp" value="delete"/>
		</form>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>	
</body>
</html>