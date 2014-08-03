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
		
		response.sendRedirect("listCategory.jsp");
		return;
	}
%>
<%
//*************** get category info, Lee Hawthorne ****************************
if(request.getMethod().equalsIgnoreCase("GET")){
	String categoryID = request.getParameter("categoryID");
	String name = "" ;
	if(categoryID!=""&&categoryID!=null){
		Category category = CategoryDAO.getCategory(categoryID);
		name = category.getCategoryName();
	}
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
		<body>
<div id="wrapper">
<!-- TRagsdale modified to remove duplicate header bar on page -->
<%-- <jsp:include page="/includes/header.jsp" /> --%>
	<div id="page">
	
	<!-- delete confirm, Lee Hawthorne -->
	<form action="" method="POST">
	<p> Are you sure you want to delete this category?:</p>
		<input type="hidden" name="categoryID" value="<%=categoryID%>">
		<p>Name:<%=name%></p>
		<input type="submit" name="submit" value="Yes I'm sure"/>
		<input type="submit" name="submit" onclick="categoryList.jsp" value="No"/>
	</form>
	<%}%>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>	
</body>
</html>