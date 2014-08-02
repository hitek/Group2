<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*,java.util.ArrayList"%>

<%//*************get articles***************
	ArrayList<Category> categories;
	Category category;
	int i;
	
	categories =CategoryDAO.getCategories();
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
	<jsp:include page="header.jsp" />
	<form action="" method="post">
	
	<table border="0" >
    
         <%
         for(i=0;i<categories.size();i++){
				category = categories.get(i);
         %>
         <tr>
         <%
         for(int j=0;j<4;j++) {
         %>
         <td width="250px" height = "50%" >
         <a href="ArticleDisplay.jsp?categoryID=<%=category.getCategoryID() %> " ><%= category.getCategoryName()%></a>
         </td>
         <%
         }
         %>
         </tr>
         <%
         }
         %>
    </table>
    </form>
    </div>
 </div>

</body>
</html>