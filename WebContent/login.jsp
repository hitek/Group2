<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
<%
	String message = (String) session.getAttribute("message");
	if(message==null){
		message="";
	}else{
		session.removeAttribute("message");
	}

	if(request.getMethod().equalsIgnoreCase("post")){
	//********* check username password combination********
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = UserDAO.authenticate(username, password);
		//redirects users to the appropriate home page
		if(user!=null){
			session.setAttribute("currentUser",user);
			int userType = UserDAO.getUserType(username);
			System.out.println("test current user " + userType);
			if(userType==0){
				response.sendRedirect("admin.jsp");
			}else if(userType==1){
				response.sendRedirect("Author.jsp");
			}else if(userType==2){
				response.sendRedirect("Index.jsp");
			}
			
		}else{
			session.setAttribute("message", "Invalid username/password combination");
			response.sendRedirect("login.jsp");
		}
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login Page</title>
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
    	<h1>Log-in</h1><br>
		<form action="" method="POST">
			<input type="text" name="username" placeholder="Username">
			<input type="password" name="password" placeholder="Password">
    		<input type="submit" name="sumbit" class="login login-submit" value="Login">
    		<input type="submit" name="sumbit" formaction="Index.jsp" class="login login-cancel" value="Cancel">
    		<span class="message"><%=message%></span>
		</form>
		<div class="login-help">
    		<a href="register.jsp">[ Register ]</a>
 	 	</div>
 	 	</div>
		</page>
	</wrapper>
	 <script src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>
</body>
</html>