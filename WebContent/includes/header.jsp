<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en" class="no-js csstransforms csstransforms3d csstransitions webkit chrome win js" style="height: auto;">
<head>
	<title>My Blog</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/header.css" type="text/css"></link>
	<link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Header
		    ================================================== -->
		<div id="header">
			<div class="left-part">
				<a class="logo" href="#"><img alt="" src="images/logo.png"></a>
			</div>
			<div class="right-part">
				<div class="menu-box">
					<ul class="menu">
						<li><a href="index.html"><span>Home</span></a></li>
						<li><a href="about.html"><span>About</span></a></li>
						<li class="drop"><a class="active" href="blog.html"><span>blog</span></a>
							<ul class="drop-down">
								<li><a href="blog.html"><span>Blog</span></a></li>
								<li><a href="blog-sidebar.html"><span>Blog with sidebar</span></a></li>
								<li><a href="single-post.html"><span>Single Post</span></a></li>
							</ul>
						</li>
						<li><a href="contact.html"><span>Contact</span></a></li>
					</ul>				
				</div>
				<div class="contact-info-box">
					<h1>Contact Info</h1>
					<p>
						<span><i class="fa fa-envelope-o"></i>teknovagrant@gmail.com</span>
						<span><i class="fa fa-phone"></i>1234 - 5678 - 9012</span>
					</p>
				</div>
			</div>
		</div><!-- End Header -->
</body>
</html>