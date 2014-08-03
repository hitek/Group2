<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="beans.*,data.*,java.util.ArrayList"%>

<%
User currentUser = (User) session.getAttribute("currentUser");

//*************get article by articleID***************
String articleID = request.getParameter("articleID");
	session.setAttribute("articleID", articleID);//do we really need this in session?, and is it removed anywhere?
	Article article;
	System.out.println("articleID:"+articleID);
	article=ArticleDAO.getArticle(articleID);

%>
<%//************Get Comments by articleID******************
	int displayDeleteButton=0;//if 0 doesn't display delete comment button, if a radio button appears it's set to 1, Lee Hawthorne
	ArrayList<Comment> comments;
	Comment comment;
	int i;

	comments=CommentDAO.getArticleComments(Integer.parseInt(articleID));
%>

<%//************Post Comments to Comment table*************** 
	if(request.getMethod().equalsIgnoreCase("POST")){
		String commentAuthor = currentUser.getUser_name();
		String authorID = Integer.toString(currentUser.getUser_ID());
		String commentText = request.getParameter("text");
		String commentID = request.getParameter("commentID");
		String commentArtID = request.getParameter("articleID");
		
		Comment commentPost = new Comment();
		commentPost.setCommentAuthor(commentAuthor);
		commentPost.setCommentAuthorID(authorID);
		commentPost.setCommentText(commentText);
		commentPost.setCommentArticleID(Integer.parseInt(commentArtID));
		
		System.out.println(commentArtID);
		
		if(request.getParameter("submit").equals("Post")){
			int status = CommentDAO.addComment(commentPost);
		}
		//************* delete comment, Lee Hawthorne****************************
		if(request.getParameter("submit").equals("Delete Comment")){
			CommentDAO.deleteComment(Integer.parseInt(commentID));
		}
		//************* update comment, Lee Hawthorne****************************
		if(request.getParameter("submit").equals("Update Comment")){
			comment=CommentDAO.getComment(commentID);
			comment.setCommentText(request.getParameter("text"));
			CommentDAO.updateComment(comment);
		}
		response.sendRedirect("ArticleDisplay.jsp?articleID=" + article.getArticleID());
		
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
  	<script type="text/javascript" src="<%=request.getContextPath()%>/javascript/tinymce/tinymce.min.js"></script>
	<script>
		tinymce.init({
    		selector: "textarea",
    		theme: "modern",
    		plugins: [
              "advlist autolink link lists charmap print preview hr anchor pagebreak spellchecker",
              "searchreplace wordcount visualblocks visualchars code insertdatetime nonbreaking",
              "save table directionality paste textcolor autoresize"
        	 ],
    		width: "100%",
    		autoresize_min_height: "100px",
    		autoresize_max_height: "500px",
   			content_css: "css/content.css",
   		style_formats: [
     		]
 		}); 
	</script>
</head>
<body>
<jsp:include page="/includes/header.jsp" />
<div id="wrapper">
	<div id="page">

      <form action="" method="post">
		<div id="articleheader">
		<div id="title"><%=article.getArticleTitle() %></div>
        <div id="author">Author: <%=article.getArticleAuthor() %></div>
        </div>
        <div id="articlecontent"><%=article.getArticleText() %></div>
      </form>
      
         <div id="commentsbox">
         <%
         for(i=0;i<comments.size();i++){
        	 	comment = new Comment();
				comment = comments.get(i);
				if(currentUser != null){
         %>
         
        <div class = ArclComments><%if(currentUser.getUser_type()==2||Integer.parseInt(comment.getCommentAuthorID())==currentUser.getUser_ID()){//radio buttons only for admin and comment author%>
		<input type="radio" name="commentID" value="<%=comment.getCommentID()%>">
		<%displayDeleteButton=1;}%>
         <%=comment.getCommentText() %></div>
         <div class = ArclComments>By: <%=comment.getCommentAuthor() %></div>
         <%
         }
         }
         if(currentUser == null){
        	 for(i=0;i<comments.size();i++){
         	 	comment = new Comment();
 				comment = comments.get(i);

         %>
        <div class = ArclComments>
         <%=comment.getCommentText() %></div>
         <div class = ArclComments>By: <%=comment.getCommentAuthor() %></div>
		<%
         }}
         if(displayDeleteButton==1){
         %>
         <input type="hidden" name="submitType" value="delete">
         <input type="hidden" name="articleID" value="<%=article.getArticleID()%>">
         <%if(currentUser.getUser_type()==2){%>
         	<p>Add or Update Comment</p>
			<textarea name="text" type="textarea" style="width: 600px; height: 100px;"></textarea>
			<input type="submit" name="submit" formaction="ArticleDisplay.jsp" value="Post"/>
			<input type="submit" name="submit" formaction="ArticleDisplay.jsp" value="Update Comment"/>
			<input type="submit" name="submit" formaction="ArticleDisplay.jsp" value="Delete Comment"/>
		<%}
		if(currentUser.getUser_type()!=2){%>
			<input type="submit" name="submit" formaction="ArticleDisplay.jsp" value="Delete Comment"/>
		<%}
       	}%>
       
 <%
 if(currentUser != null){
 if(currentUser.getUser_type()==0 || currentUser.getUser_type() == 1){%>
	
  	<form action="" method="post">
  		<div id="commentheader"><p>Add Comment</p></div>
		<input type="hidden" name="submitType" value="Post">
		<div id="commentauthor"><p>Author: <%=currentUser.getUser_name() %></p></div>
		<textarea name="text" type="textarea" style="width: 600px; height: 100px;"></textarea>
		<div id="commentfooter">
		<input type="submit" name="submit" value="Post" />
		<input type="submit" name="submit" formaction="Index.jsp" value="Cancel"/>
		<div id="commentfooter">
	</form>
		 </div>
	<%}}%>
</div>
</div>
</body>
</html>