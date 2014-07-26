<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
<%
	if(request.getMethod().equalsIgnoreCase("POST")){
		String user_name = request.getParameter("username");
		String user_psword = request.getParameter("password");
		
		User user = new User();
		user.setUser_name(user_name);
		user.setUser_psword(user_psword);
		
		int status = UserDAO.addUser(user);
		
		response.sendRedirect("Index.jsp");	
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Register Page</title>
	<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/reset.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/style.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/login.css" type="text/css"></link>
	<!--[if lt IE 9]>
  	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  	<![endif]-->
</head>
<body>
	<wrapper>
		<page>
		<div class="login-card">
    	<h1>Register</h1><br>
		<form action="" method="POST">
			Username
			<input type="text" name="username">
			Password
    		<input type="password" name="password">
    		<input type="submit" name="sumbit" class="login login-submit" value="Register">
    		<span class="message"></span>
		</form>
		<div class="login-help">
    		<a href="login.jsp">[ Log-In ]</a>
 	 	</div>
 	 	</div>
		</page>
	</wrapper>
	 <script src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>
</body>
</html>