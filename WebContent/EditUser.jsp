<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
    
<% //******** Protected Page Check ***********
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
//******************** add or update user *************************Lee Hawthorne
	if(request.getMethod().equalsIgnoreCase("POST")){
		String userID = request.getParameter("userID");
		String name = request.getParameter("name");
		String pass = request.getParameter("password");
		String type = request.getParameter("type");
		
		User user = new User();
		user.setUser_name(name);
		user.setUser_psword(pass);
		user.setUser_type(Integer.parseInt(type));
		if(userID!=""&&userID!=null){
			user.setUser_ID(Integer.parseInt(userID));
			int status = UserDAO.updateUser(user);
		}
		else{
			int status = UserDAO.addUser(user);
		}
		response.sendRedirect("AdminListUser.jsp");	
		return;
	}
%>
<%
//*************** get user info ****************************Lee Hawthorne
if(request.getMethod().equalsIgnoreCase("GET")){
	String userID = request.getParameter("userID");
	String name = "" ;
	String pass = "";
	int type = 0;
	if(userID!=""&&userID!=null){
		User user = UserDAO.getUser(userID);
		name = user.getUser_name();
		pass = user.getUser_psword();
		type = user.getUser_type();
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
	<script>
		tinymce.init({
    		selector: "textarea",
    		theme: "modern",
    		plugins: [
              "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
              "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
              "save table contextmenu directionality emoticons template paste textcolor autoresize"
        	 ],
    		width: "100%",
    		autoresize_min_height: "100px",
    		autoresize_max_height: "500px",
   			content_css: "css/content.css",
   			toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons", 
   		style_formats: [
     		]
 		}); 
</script>
</head>
<body>
<div id="wrapper">
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	<!-- add or update user form, Lee Hawthorne -->
	<form action="" method="POST">
		<%if(userID!=null&&userID!=""){//if userID is not empty, fill in data
		%>
		<input type="hidden" name="userID" value="<%=userID%>"> 
		<p>User Name:<br/>
		<input type="text" name="name" value="<%=name%>"/></p>
		<p>Password:<br/>
		<input type="password" name="password" value="<%=pass%>"/></p>
		<p>User type:<br/>
		<select name="type">
				<option value="<%=type%>">no change</option>
				<option value="0">User</option>
				<option value="1">Author</option>
				<option value="2">Admin</option>
		</select></p>
		<input type="submit" name="submit" value="Submit" />
		<input type="submit" name="submit" formaction="AdminListUser.jsp" value="Cancel"/>
		<%}
		else{//if userID is null or empty, leave fields blank to add a new user
		%>
		<input type="hidden" name="userID" value=""> 
		<p>User Name:<br/>
		<input type="text" name="name" value=""/></p>
		<p>Password:<br/>
		<input type="password" name="password" value=""/></p>
		<p>User type:<br/>
			<select name="type">
				<option value="0">User</option>
				<option value="1">Author</option>
				<option value="2">Admin</option>
			</select></p>
		<input type="submit" name="submit" value="Submit" />
		<input type="submit" name="submit" formaction="AdminListUser.jsp" value="Cancel"/>
		<%}%>
		
	</form>
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
	</div>
</body>
</html>
<%
}%>