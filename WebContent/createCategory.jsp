<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*"%>
    
<% //******** Protected Page Check ***********
	User currentUser = (User) session.getAttribute("currentUser");
	if(currentUser==null){
		response.sendRedirect("login.jsp");
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
//******************** add or update article *************************
	if(request.getMethod().equalsIgnoreCase("POST")){
		String categoryID = request.getParameter("categoryID");
 		String categoryName = request.getParameter("categoryName");
 		String owner = request.getParameter("owner");
 		int ownerID = currentUser.getUser_ID();
		
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setCategoryOwner(owner);
		category.setCategoryOwnerID(ownerID);
		if(categoryID!=""&&categoryID!=null){
			category.setCategoryID(Integer.parseInt(categoryID));
			int status = CategoryDAO.updateCategory(category);
		}
		else{
			int status = CategoryDAO.addCategory(category);
		}
		response.sendRedirect("Author.jsp");	
		return;
	}
%>
<%
//*************** get article info ****************************
if(request.getMethod().equalsIgnoreCase("GET")){
	String categoryID = request.getParameter("categoryID");
	String categoryName = "" ;
 	String owner = "";
 	int ownerID = currentUser.getUser_ID();
	if(categoryID!=""&&categoryID!=null){
		Category category = CategoryDAO.getCategory(categoryID);
		categoryName = category.getCategoryName();
 		owner = category.getCategoryOwner();
 		//ownerID = currentUser.getUser_ID();
	}
%>
<!DOCTYPE html>
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
	<div id="page">
	<form action="" method="POST">
		<%if(categoryID!=null&&categoryID!=""){%>
		<input type="hidden" name="categoryID" value="<%=categoryID%>"> 
		<p>Category Name:<br/>
		<input type="text" name="categoryName" value="<%=categoryName%>"/></p>
<!-- 		<p>Author:<br/> -->
		<input type="hidden" name="owner" value="<%=currentUser.getUser_name() %>"/></p>
		<input type="hidden" name="ownerID" value="<%=currentUser.getUser_ID()%>"/></p>
<!-- 		<p>Article text:<br/> -->
<%-- 		<textarea type="textarea" name="text" style="width: 400px; height: 200px;" ><%=text%></textarea></p> --%>
		<input type="submit" name="submit" value="Submit" />
		<%}
		else{%>
		<input type="hidden" name="categoryID" value=""> 
		<p>Category Name:<br/>
		<input type="text" name="categoryName" value=""/></p>
<!-- 		<p>Name:<br/> -->
		<input type="hidden" name="owner" value=""/></p>
		<input type="hidden" name="ownerID" value=""/></p>
<!-- 		<p>Article text:<br/> -->
<!-- 		<textarea name="text" style="width: 400px; height: 200px;" ></textarea></p> -->
		<input type="submit" name="submit" value="Submit" />
		<%}%>
		
	</form>
	</div>
	</div>
</body>
</html>
<%
}%>