<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
<%//******** Protected Page Check ***********
	//User currentUser = (User) session.getAttribute("currentUser");
	//if(currentUser==null){
	//	response.sendRedirect("login.jsp");
	//	return;
	//}
	
	//String message = (String) session.getAttribute("message");
	//if(message==null){
	//	message="";
	//}else{
	//	session.removeAttribute("message");
	//}
%>

<%//************Get Users******************
	ArrayList<User> Users;
	User User;
	int i;
	
	Users=UserDAO.getUsers();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Index</title>
	<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/reset.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/style.css" type="text/css"></link>
	<!--[if lt IE 9]>
  	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  	<![endif]-->
  	
</head>
<body>
<div id="wrapper">
	<div id="page">
		<form action="EditUser.jsp" method="get">
			<input type="hidden" name="UserID" value="">
			<input type="submit" name="submit" value="Add User"/>
		</form>
		<form action="EditUser.jsp" method="get">
		<%
			for(i=0;i<Users.size();i++){
			User = Users.get(i);
		%>
		<div class=User>
			<p class=ArclTitle><input type="radio" name="UserID" value="<%=User.getUser_ID()%>">
			<b>UserName:<%=User.getUser_name()%> UserType:<%=User.getUser_type()%></b></p>
		</div>
		<%		
		}
		%>		
			<input type="submit" name="submit" value="update"/>
			<input type="submit" name="submit" formaction="confirmUserDelete.jsp" value="delete"/>
		</form>
	</div>
</div>	
</body>
</html>