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
	ArrayList<User> users;
	User user;
	int i;

	users=UserDAO.getUsers();
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
		<form action="EditUser.jsp" method="get">
			<input type="hidden" name="userID" value="">
			<input type="submit" name="submit" value="Add User"/>
		</form>
		<form action="EditUser.jsp" method="get">
		<%
			String typeName="";
			int type=0;
			for(i=0;i<users.size();i++){
				user = users.get(i);
				type=user.getUser_type();
				if(type==2){typeName="admin";}
				else{
					if(type==1){typeName="author";}
						else{
							if(type==0){typeName="user";}
								else{typeName="error";}
							}
				}
		%>
		<div class=User>
			<p class=ArclTitle><input type="radio" name="userID" value="<%=user.getUser_ID()%>">
			<b>UserName:</b><%=user.getUser_name()%> <b>UserType:</b><%=typeName%>
			<b>Password:</b><%=user.getUser_psword()%></p>
		</div>
		<%		
		}
		%>		
			<input type="submit" name="submit" value="Update"/>
			<input type="submit" name="submit" formaction="confirmUserDelete.jsp" value="Delete"/>
			<input type="submit" name="submit" formaction="admin.jsp" value="Cancel"/>
		</form>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>	
</body>
</html>