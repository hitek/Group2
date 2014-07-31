<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*, java.util.ArrayList"%>
<%
String message = "Username is already taken, please try again";

ArrayList<User> users;
User userName;
users = UserDAO.getUsers();
int i;
boolean userNameTaken = false;


	if(request.getMethod().equalsIgnoreCase("POST")){
		for(i=0; i<users.size(); i++){
			userName = users.get(i);
			if(request.getParameter("username").equals(userName.getUser_name())){
				session.setAttribute("message", "Username is already taken, try again");
				userNameTaken = true;
			}
		}
		
		if(userNameTaken == false){
			String user_name = request.getParameter("username");
			String user_psword = request.getParameter("password");
			int user_type = Integer.parseInt(request.getParameter("userType"));
			
			User user = new User();
			user.setUser_name(user_name);
			user.setUser_psword(user_psword);
			user.setUser_type(user_type);
				
			int status = UserDAO.addUser(user);
				
			response.sendRedirect("Index.jsp");	
			return;
		}			
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Register Page</title>
	<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/nav.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/reset.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/style.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/login.css" type="text/css"></link>
	<!--[if lt IE 9]>
  	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  	<![endif]-->
</head>
<body>
	<wrapper>
	<jsp:include page="/includes/header.jsp" />
		<page>
		<div class="login-card">
    	<h1>Register</h1><br>
		<form action="" method="POST">
			Username
			<input type="text" name="username" required>
			Password
    		<input type="password" name="password" required>
    		Retype Password
    		<input type="password" name="password" required>
<!--     		The value 0 will set this as a normal user. -->
    		<input type="hidden" name="userType" value=0>  
    		<input type="submit" name="sumbit" class="login login-submit" value="Register">
<%          
	if(userNameTaken == true){
%>
    		<span class="message" style="color: red"><%=message %></span>
<%
	}
%>
		</form>
		<div class="login-help">
    		<a href="login.jsp">[ Log-In ]</a>
 	 	</div>
 	 	<div="sidebar">
			<jsp:include page="/includes/sidebar.jsp" /></div>
		<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
 	 	</div>
		</page>
	</wrapper>
	 <script src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>
</body>
</html>