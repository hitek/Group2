<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
<%
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser==null){
%>
		<div id="cssmenu">
			<ul>
   				<li class='active'><a href="Index.jsp"><span>Index</span></a></li>
   				<li><a href="login.jsp"><span>Log-In</span></a></li>
   				<li class='last'><a href="register.jsp"><span>Register</span></a></li>
			</ul>
		</div>
<%		
	}else{
%>
		<div id="cssmenu">
			<ul>
   				<li class='active'><a href="Index.jsp"><span>Home</span></a></li>
   				<li><a href="admin.jsp"><span>List Articles</span></a></li>
   				<li class='last'><a href="AdminListUser.jsp"><span>Add Articles</span></a></li>
   				<li class='last'><a href="EditUser.jsp"><span>Update Article</span></a></li>
			</ul>
		</div>
<%
	}
%>
