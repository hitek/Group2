<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*,java.util.ArrayList"%>

<%
User currentUser = (User) session.getAttribute("currentUser");

//*************get categories by cateID***************Steve Li

String categoryID = request.getParameter("categoryID");
	if(categoryID == null){
		response.sendRedirect("Index.jsp");
		return;
	}
	session.setAttribute("catogeryID",categoryID);
	ArrayList<Category> categories;
	Category category = new Category();
	int i;
	System.out.println("catogeryID:"+categoryID);
	categories=CategoryDAO.getCategoryByparentID(categoryID);

%>
<%
//*************get articles by cateID***************Steve Li
    ArrayList<Article> articles;
	Article article;
	
	articles = ArticleDAO.getArtBycateID(Integer.parseInt(categoryID));


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
  <form action="" method="GET">
         <br />
         <b>Categories:</b>
         <br/>
      <div class = cate>
  <!-- **************************display categories;********************* -->
      
         <%
         for(i=0;i<categories.size();i++){
				category = categories.get(i);
         
         %>
         <br />
          <a href="DisplayByCate2.jsp?categoryID=<%=category.getCategoryID() %> " ><%=category.getCategoryName()%></a><br />
         <%
         }
         %>
       </div>
       <br />
         <b>Articles:</b>
         <br />
       <div class = art>
         <%
         for(i=0;i<articles.size();i++){
				article = articles.get(i);      
         %>
 <!-- **************************display articles;********************* -->
         <br />
          <a href="ArticleDisplay.jsp?articleID=<%=article.getArticleID() %>" ><%=article.getArticleTitle()%></a><br />
         <%
         }
         %>
       </div>
  </form>
  </div>
 </div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
		
</body>
</html>