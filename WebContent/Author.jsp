<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
<!-- 	This page will provide all the functions for authors to create,  -->
<!-- 	delete, and update articles, and also create categories.TR -->
<%//******** Protected Page Check ***********
	User currentUser = (User) session.getAttribute("currentUser");

	if(currentUser==null){
		response.sendRedirect("login.jsp");
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

<%//*************get articles***************TR
	ArrayList<Article> articles;
	Article article;
	int i;
	
	articles=ArticleDAO.getArticles();
	//*************get categories***************TR
	ArrayList<Category> categories;
	Category category;
	int j;
	categories=CategoryDAO.getCategories();
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
<div id="wrapper">
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	<jsp:include page="header.jsp" />
		<form action="AddArticle.jsp" method="get">
			<input type="hidden" name="articleID" value="">
			<input type="submit" name="submit" value="Add Article"/>
			<input type="submit" name="submit" formaction="createCategory.jsp" value="Create Category"/>
		</form>
		<form action="AddArticle.jsp" method="get">
		<%
		//***filling article array****TR
			for(i=0;i<articles.size();i++){
			article = articles.get(i);
			//****only shows articles created by the user that is actively logged on****TR
			if(currentUser.getUser_name().equals(article.getArticleAuthor())){
				int publish = article.getPublish();
				String pubStat;
					//****displays published status*****TR
					if(publish==1){
						pubStat="Published";
					}else{ pubStat="Private";
					}			
		%>	
		<div class=article>
		<div id="title"><p><input type="radio" name="articleID" value="<%=article.getArticleID()%>"><a href="ArticleDisplay.jsp?articleID=<%=article.getArticleID()%>"><%=article.getArticleTitle()%></p></div>
		<div id="author">posted by <a href="AuthorArtList.jsp?author=<%=article.getArticleAuthor()%>"><%=article.getArticleAuthor()%></a> on <%=article.getArticleDate().substring(0, 10) %><br></div>
			
			<div id="articlecontent"><%=article.getArticleText()%><br>
			<%
			//**********setting category name for current article*************TR
  				for(j=0;j<categories.size();j++){
					category = categories.get(j);
						if(category.getCategoryID()==article.getCateID()){
						%>
						Category:  <%=category.getCategoryName()%>
						<%					
				}}
  		%>			
			<br>Publish Status: <%=pubStat%></p><br>			
		</div>	
<%		
			}}
%>		
			<input type="submit" name="submit" value="Update"/>
			<input type="submit" name="submit" formaction="confirmDelete.jsp" value="Delete"/>
		</form>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>	
</body>
</html>
