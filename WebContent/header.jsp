<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
<%
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser==null){
%>
		<div id="header">
		<a href="login.jsp">Login</a>
		</div>
<%		
	}else{
%>
		<div id="header">
		Logged in as: <%=currentUser.getUser_name()%>
		</div>
<%
	}
%>
