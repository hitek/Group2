<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="beans.*,data.*,java.util.ArrayList" %>
	
<%
%>
	
<%
	String sortType=request.getParameter("sortType");//sort, Lee Hawthorne
	ArrayList<Article> articles;
	Article article;
	int i;
	
	//*******sort, Lee Hawthorne*******************
	if(("").equals(sortType) || sortType==null || sortType.equals("article_date")){articles=ArticleDAO.getArticles();}
	else{articles=ArticleDAO.getArticlesSort(sortType);}
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
<body link="black">
<jsp:include page="/includes/header.jsp" />
	<div id="page">
	
	<!-- sort, Lee Hawthorne -->
		<form action="" method="get">
			Sort:
			<select name="sortType">
				<option value="article_date">Date</option>
				<option value="cate_ID">Category</option>
				<option value="article_author">Author</option>
				<option value="article_title">Title</option>
			</select>
			<input type="submit" name="submit" value="Submit"/>
		</form>
	<%
		for(i=0;i<articles.size();i++){
			article = articles.get(i);
	%>
		<div class=article>
		<div id=articleheader>
		<%
		User currentUser = (User) session.getAttribute("currentUser");
			if(currentUser == null){
		%>
		<br/><div id="title"><a style="font-weight:bold; font-size:15pt" href="register.jsp"><%=article.getArticleTitle()%></a></div><div class="clear"></div> 
    			<p>Published by : <%=article.getArticleAuthor()%> on <%=article.getArticleDate()%> 
  			</div><div class="clear"></div> 
  			<div id="text"><%=article.getArticleText()%></div>
  			<div id=articlefooter> </div>
  		</div>
		<%
			}else{
		%>
    		<br/><div id="title"><a style="font-weight:bold; font-size:15pt" href="ArticleDisplay.jsp?articleID=<%=article.getArticleID()%>"><%=article.getArticleTitle()%></a></div><div class="clear"></div> 
    			<p>Published by : <%=article.getArticleAuthor()%> on <%=article.getArticleDate()%> 
  			</div><div class="clear"></div> 
  			<div id="text"><%=article.getArticleText()%></div>
  			<div id=articlefooter> </div>
  		</div>
	<%		
			}
		}
	%>
	
	</div>
	<div="sidebar">
	<jsp:include page="/includes/sidebar.jsp" /></div>
	<div id="footer"><jsp:include page="/includes/footer.jsp" /></div>
	
</div>		
</body>
</html>