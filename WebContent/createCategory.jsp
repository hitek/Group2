<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
    
<% //******** Protected Page Check ***********
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser==null){
		response.sendRedirect("login.jsp");
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
//******************** add category *************************
	if(request.getMethod().equalsIgnoreCase("POST")){
		String categoryID = request.getParameter("categoryID");
 		String categoryName = request.getParameter("categoryName");
 		String owner = request.getParameter("owner");
 		int ownerID = currentUser.getUser_ID();
		
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setCategoryOwner(owner);
		category.setCategoryOwnerID(ownerID);
		if(categoryID!=""&&categoryID!=null){
			category.setCategoryID(Integer.parseInt(categoryID));
			int status = CategoryDAO.updateCategory(category);
		}
		else{
			int status = CategoryDAO.addCategory(category);
		}
		//response.sendRedirect("Author.jsp");
		//redirects back to author or admin pages based on usertype
				int userType = UserDAO.getUserType(currentUser.getUser_name());
				System.out.println("test current user " + userType);
				if(userType==2){
					response.sendRedirect("admin.jsp");
				}else if(userType==1){
					response.sendRedirect("Author.jsp");
				}
		return;
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
  	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/tinymce/tinymce.min.js"></script>
</head>
<body>
<div id="wrapper">
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	<jsp:include page="header.jsp" />
	<form action="" method="POST">
		<input type="hidden" name="categoryID" value=""> 
		<p>Category Name:<br/>
		<input type="text" name="categoryName" value=""/></p>
		<input type="hidden" name="owner" value="<%=currentUser.getUser_name() %>"/></p>
		<input type="hidden" name="ownerID" value=""/></p>
		<input type="submit" name="submit" value="Submit" />
		<input type="submit" name="submit" formaction="Author.jsp" value="Cancel"/>
		
	</form>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
	</div>
</body>
</html>