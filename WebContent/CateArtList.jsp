<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
    
<%//*************get articles***************
	ArrayList<Article> articles;
	Article article;
	int i;
	String categoryID = request.getParameter("categoryID");
	if(categoryID == null){
		response.sendRedirect("Index.jsp");
		return;
	}
	session.setAttribute("categoryID", categoryID);
	articles=ArticleDAO.getArtByAuthor(categoryID);
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
		
		<%
			String typeName="";
			int type=0;
			for(i=0;i<articles.size();i++){
				article = articles.get(i);
				
		%>
		
		<%
		User currentUser = (User) session.getAttribute("currentUser");
		System.out.println(currentUser);
		if(currentUser != null){
		%>
		<div class=ArticleList>
			<b><a href="ArticleDisplay.jsp?articleID=<%=article.getArticleID()%>"><%=article.getArticleTitle() %></a>
			<h6 align="right"><%=article.getArticleDate().substring(0, 10) %></h6>
			
		</div>
		<%	
			}else{
		%>
				<div class=ArticleList>
			<b><a href="register.jsp"><%=article.getArticleTitle() %></a>
			<h6 align="right"><%=article.getArticleDate().substring(0, 10) %></h6>
			
		</div>
		<%
			}
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