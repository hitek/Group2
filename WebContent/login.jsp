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
		User user = ArticleDAO.authenticate(username, password);
		if(user!=null){
			session.setAttribute("currentUser",user);
			response.sendRedirect("admin.jsp");
		}else{
			session.setAttribute("message", "Invalid username/password combination");
			response.sendRedirect("login.jsp");
		}
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Login Page</title>
</head>
<body>
	<form action="" method="POST">
		<p>Username:<br/>
		<input type="text" name="username" /></p>
		<p>Password:<br/>
		<input type="password" name="password" /></p>
		<input type="submit" name="submit" value="Login" /><span class="message"><%=message%></span>
	</form>
</body>
</html>