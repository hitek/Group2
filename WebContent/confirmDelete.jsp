<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
    
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
    
<%
	//********** delete article ***************
	if(request.getMethod().equalsIgnoreCase("POST")){
		String articleID = request.getParameter("articleID");
		
		int status = ArticleDAO.deleteArticle(Integer.parseInt(articleID));
		
		//response.sendRedirect("admin.jsp");	
		int userType = UserDAO.getUserType(currentUser.getUser_name());
		System.out.println("test current user " + userType);
		if(currentUser.getUser_type()==2){
			response.sendRedirect("admin.jsp");
		}else if(currentUser.getUser_type()==1){
			response.sendRedirect("Author.jsp");
		}
		return;
	}
%>
<%
//********** get article info ************************
if(request.getMethod().equalsIgnoreCase("GET")){
	String articleID = request.getParameter("articleID");
	String title = "" ;
	String author = "";
	String text = "";
	if(articleID!=""&&articleID!=null){
		Article article = ArticleDAO.getArticle(articleID);
		title = article.getArticleTitle();
		author = article.getArticleAuthor();
		text = article.getArticleText();
	}
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
	<form action="" method="POST">
	<p> Are you sure you want to delete this article?:</p>
		<input type="hidden" name="articleID" value="<%=articleID%>">
		<p>Article title:<%=title%></p>
		<p>Name:<%=author%></p>
		<p>Article text:<%=text%></p>
		<input type="submit" name="submit" value="Yes I'm sure"/>
		<%if(currentUser.getUser_type()==2){%>
		<input type="submit" name="submit" formaction="admin.jsp" value="No"/>
		<%}else{%>
		<input type="submit" name="submit" formaction="Author.jsp" value="No"/>
		<%}%>
	</form>
</div>
<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>
</body>
</html>
<%}%>