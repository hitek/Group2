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
		String articleID = request.getParameter("articleID");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String text = request.getParameter("text");
		String publish = request.getParameter("publish");
		
		Article article = new Article();
		article.setArticleTitle(title);
		article.setArticleAuthor(author);
		article.setArticleText(text);
		article.setPublish(Integer.parseInt(publish));
		if(articleID!=""&&articleID!=null){
			article.setArticleID(Integer.parseInt(articleID));
			int status = ArticleDAO.updateArticle(article);
		}
		else{
			int status = ArticleDAO.addArticle(article);
		}
		//redirects back to author or admin pages based on usertype
		if(currentUser.getUser_type()==2){
			response.sendRedirect("admin.jsp");
		}else if(currentUser.getUser_type()==1){
			response.sendRedirect("Author.jsp");
		}

		return;
	}
%>
<%
//*************** get article info ****************************
if(request.getMethod().equalsIgnoreCase("GET")){
	String articleID = request.getParameter("articleID");
	String title = "" ;
	String author = "";
	String text = "";
	String publish = "";
	if(articleID!=""&&articleID!=null){
		Article article = ArticleDAO.getArticle(articleID);
		title = article.getArticleTitle();
		author = article.getArticleAuthor();
		text = article.getArticleText();
		publish = Integer.toString(article.getPublish());
		if(author.contains("edited by")){author=author.split(", edited by")[0];}
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
	<jsp:include page="header.jsp" />
	<form action="" method="POST">
		<%if(articleID!=null&&articleID!=""){%>
		<input type="hidden" name="articleID" value="<%=articleID%>"> 
		<p>Article Title:<br/>
		<input type="text" name="title" value="<%=title%>"/></p>
		<%if(currentUser.getUser_type()!=2){%>
		<input type="hidden" name="author" value="<%=currentUser.getUser_name()%>"/></p>
		<%}else{%>
		<input type="hidden" name="author" value="<%=author%>, edited by <%=currentUser.getUser_name()%>"/></p>
		<%}%>
		<p>Article Text:<br/>
		<textarea type="textarea" name="text" style="width: 400px; height: 200px;" ><%=text%></textarea></p>
		<p>Publish:<br/>
		<select name="publish">
				<option value="<%=publish%>">no change</option>
				<option value="0">Private</option>
				<option value="1">Publish</option>
		</select></p>
		<input type="submit" name="submit" value="Submit" />
		<%if(currentUser.getUser_type()!=2){%>
		<input type="submit" name="submit" formaction="Author.jsp" value="Cancel"/>
		<%}else{%>
		<input type="submit" name="submit" formaction="admin.jsp" value="Cancel"/>
		<%}%>
		<%}
		else{%>
		<input type="hidden" name="articleID" value=""> 
		<p>Article Title:<br/>
		<input type="text" name="title" value=""/></p>
		<input type="hidden" name="author" value="<%=currentUser.getUser_name()%>"/></p>
		<p>Article Text:<br/>
		<textarea name="text" style="width: 400px; height: 200px;" ></textarea></p>
		<p>Publish:<br/>
		<select name="publish">
				<option value="<%=publish%>">no change</option>
				<option value="0">Private</option>
				<option value="1">Publish</option>
		</select></p>
		<input type="submit" name="submit" value="Submit" />
		<%if(currentUser.getUser_type()!=2){%>
		<input type="submit" name="submit" formaction="Author.jsp" value="Cancel"/>
		<%}else{%>
		<input type="submit" name="submit" formaction="admin.jsp" value="Cancel"/>
		<%}%>
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