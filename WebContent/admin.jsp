<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
<%//******** Protected Page Check ***********
	User currentUser = (User) session.getAttribute("currentUser");

	ArrayList<Category> categories;
	Category category;
	int j;

	categories=CategoryDAO.getCategories();
	
	if(currentUser==null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	if(currentUser.getUser_type()==1){
		response.sendRedirect("Author.jsp");//Lee Hawthorne
		return;
	}
	if(currentUser.getUser_type()==0){
		response.sendRedirect("Index.jsp");//Lee Hawthorne
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
		<!-- sort, Lee Hawthorne -->
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
			<%//**********get article************
				for(i=0;i<articles.size();i++){
				article = articles.get(i);
			%>
		<!-- display article -->
		<div class=article>
		
		<div id=articleheader>
    		<div id="title"><p><input type="radio" name="articleID" value="<%=article.getArticleID()%>"><a href="ArticleDisplay.jsp?articleID=<%=article.getArticleID()%>"><%=article.getArticleTitle()%></p></a></div>
    		<div id="author"><p>Published by : <a href="AuthorArtList.jsp?author=<%=article.getArticleAuthor()%>"><%=article.getArticleAuthor()%></a> on <%=article.getArticleDate().substring(0, 10) %></div> 
 			
  			<div id="articlecontent"><%=article.getArticleText()%></div>
  			 <%
  			//**********setting category name for current article*************TR
 				for(j=0;j<categories.size();j++){
 					category = categories.get(j);
 					if(category.getCategoryID()==article.getCateID()){
 						%>
 							Category:  <%=category.getCategoryName()%><br>
 						<%
 				}}
			%><br>
  		</div>
		<%		
		}
		%>
		<div id=articlefooter>		
			<input type="submit" name="submit" value="update"/>
			<input type="submit" name="submit" formaction="confirmDelete.jsp" value="delete"/>
		</form>
		</div>
	</div>	

</div>	
</body>
</html>