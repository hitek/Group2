<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
<%
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser == null){


%>
<div id="head">
<div id="banner"><h1>Group 2 Blog</h1></div>
<div class="nav">
<ul>
	<li class="active"><a href="Index.jsp">Home</a></li>
	<li><a href="login.jsp">Log-in</a>
	<li><a href="register.jsp">Register</a></li>
</ul>
</div> 
</div>

<%		
	}else if(currentUser.getUser_type()==2){
%>
<div id="head">
<div id="banner"><h1>Group 2 Blog</h1></div>
<div class="nav">
<ul>
	<li class="active"><a href="Index.jsp">Home</a></li>
	<li><a href="admin.jsp">Manage Articles</a>
	<li><a href="AdminListUser.jsp">Edit Users</a></li>
	<li><a href="listCategory.jsp">Delete Category</a></li>
	<li><a href="">Logout</a></li>
</ul>
</div> 
</div>	

<%		
	}else if(currentUser.getUser_type()==1){
%>
<div id="head">
<div id="banner"><h1>Group 2 Blog</h1></div>
<div class="nav">
<ul>
	<li class="active"><a href="Index.jsp">Home</a></li>
	<li><a href="admin.jsp">Manage Your Articles</a>
	<li><a href="">Logout</a></li>
</ul>
</div> 
</div>	
<%
	}else{
%>
<div id="head">
<div id="banner"><h1>Group 2 Blog</h1></div>
<div class="nav">
<ul>
	<li class="active"><a href="Index.jsp">Home</a></li>
	<li><a href="">Logout</a></li>
</ul>
</div> 
</div>	
<%
}
%>