<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*,java.util.ArrayList"%>

<%//*************get article by articleID***************
    String articleID = request.getParameter("articleID");
    session.setAttribute("articleID", articleID);
	Article article;
	System.out.println(articleID);
	article = ArticleDAO.getArticle(articleID);
%>
<%//************Get Comments by articleID******************
	ArrayList<Comment> comments;
	Comment comment;
	int i;

	comments=CommentDAO.getArticleComments(Integer.parseInt(articleID));
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
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	 <a href="AuthorArtList.jsp">Back to Author</a>
	  	<jsp:include page="header.jsp" />
      <form action="" method="get">
         <p align = "center" class=ArclTitle><b><%=article.getArticleTitle() %></b></p><br/>
         <p align = "right"><%=article.getArticleAuthor() %></p><br/>
         <p class=ArclText><%=article.getArticleText() %></p>
         
         <%
         for(i=0;i<comments.size();i++){
				comment = comments.get(i);
         
         %>
         <p class = ArclComments><%=comment.getCommentAuthor() %></p><br/>
         <p class = ArclComments><%=comment.getCommentText() %></p>
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