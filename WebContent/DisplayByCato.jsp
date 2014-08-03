<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*,java.util.ArrayList"%>

<%//*************get articles***************Steve Li
	ArrayList<Category> categories;
	Category category;
	int i;
	
	categories =CategoryDAO.getCategories();
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
  	
</head>
<body>
<div id="wrapper">
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	<jsp:include page="header.jsp" />
	<form action="" method="post">
        <br />
         <b>Categories:</b>
         <br/>
	 <div class=article>
		<div id=articleheader>
	
    
         <%
         int parentID;
         for(i=0;i<categories.size();i++){
				category = categories.get(i);
				parentID= category.getCategoryParentCateID();
         %>
       
         
        
         <%
         if (parentID==0) {
         %>
        <br />
         <a href="DisplayByCate2.jsp?categoryID=<%=category.getCategoryID() %> " ><%= category.getCategoryName()%></a> 
        <br />
         <%
         }}
         %>
      
         </div>
         </div>
    
    </form>
    </div>
 </div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
		
</body>
</html>