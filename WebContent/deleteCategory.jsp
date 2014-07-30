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

<%
	//********** delete category ***************
	if(request.getMethod().equalsIgnoreCase("POST")){
		String categoryID = request.getParameter("categoryID");
		
		int status = CategoryDAO.deleteCategory(Integer.parseInt(categoryID));
		
		response.sendRedirect("admin.jsp");
		return;
	}
%>

<%//*************get category***************
	ArrayList<Category> categories;
	Category category;
	int i;
	
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
	<jsp:include page="header.jsp" /><br>
		<form action="" method="POST">
		<%
			for(i=0;i<categories.size();i++){
			category = categories.get(i);
		%>
		<div class=category>
		<p class=CatDelete><input type="radio" name="categoryID" value="<%=category.getCategoryID()%>"><b><%=category.getCategoryName()%></b></p>
		</div>
<%		
		}
%>		
			<input type="submit" name="submit" value="Delete"/>
			<input type="submit" name="submit" formaction="admin.jsp" value="Cancel"/>
		</form>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>	
</body>
</html>