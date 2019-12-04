<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Cpmpatible" content="IE-edge">
	<meta name="viewport" content="width - device-width, initial-scale=1">
	<title>Settings</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
	HttpSession h= request.getSession();
	String username = (String)h.getAttribute("username");
	if (username == null || username.isEmpty()) {
		//response.sendRedirect("login.jsp");
		//return;
	}
	
	String error = (String)request.getAttribute("error");
	if (error == null || error.isEmpty()) {
		error = "";
	}
%>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark nav">
		<a class="navbar-brand" href="profile.jsp">FareChecker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
		        	<a class="nav-link" href="logout.jsp">Log out</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="jumbotron jumbo">
		<h1 class="display-4" id="test">Settings</h1>
	</div>
	
	<div class='text-danger' style="margin:10px; text-align:center;"><%= error %></div>
	
	<div id="settingsForm">
		<form action="Settings" method="Post">
			<input type="text" class="form-control" name="currUsername" placeholder="Current Username">
			<input type="password" class="form-control" name="originalPassword" placeholder="Current Password">
			<input type="text" class="form-control" name="newPassword" placeholder="New Password">
			<input type="text" class="form-control" name="confirmPassword" placeholder="Confirm Password">
			<button type="submit" class="btn btn-primary">Change</button>						
		</form>
	</div>
	
<script type='text/javascript' src="config.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" 
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.11.2/js/all.js" data-auto-replace-svg="nest"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>
</body>
</html>