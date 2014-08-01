<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
    
<%//******** Protected Page Check ***********
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser==null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	if(currentUser.getUser_type()!=2){
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
	//********** delete user ***************
	if(request.getMethod().equalsIgnoreCase("POST")){
		String userID = request.getParameter("userID");
		
		int status = UserDAO.removeUser(Integer.parseInt(userID));
		
		response.sendRedirect("AdminListUser.jsp");	
		return;
	}
%>
<%
//*************** get user info ****************************
if(request.getMethod().equalsIgnoreCase("GET")){
	String userID = request.getParameter("userID");
	String name = "" ;
	String pass = "";
	String typeName="";
	int type = 0;
	if(userID!=""&&userID!=null){
		User user = UserDAO.getUser(userID);
		name = user.getUser_name();
		pass = user.getUser_psword();
		type = user.getUser_type();
	}
	if(type==2){typeName="admin";}
	else{
		if(type==1){typeName="author";}
			else{
				if(type==0){typeName="user";}
					else{typeName="error";}
				}
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
<!-- confirm delete, Lee Hawthorne -->
</head>
<body>
<div id="wrapper">
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	<form action="" method="POST">
	<p> Are you sure you want to delete this user?:</p>
		<input type="hidden" name="userID" value="<%=userID%>">
		<p>User_Name:<%=name%></p>
		<p>Password:<%=pass%></p>
		<p>Type:<%=typeName%></p>
		<input type="submit" name="submit" value="Yes I'm sure"/>
		<input type="submit" name="submit" formaction="AdminListUser.jsp" value="No"/>
	</form>
</div>
<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
</div>
</body>
</html>
<%}%>