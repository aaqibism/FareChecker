<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Cpmpatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HomePage</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
	HttpSession h = request.getSession();
	String username=(String)h.getAttribute("username");
	if (username != null && !username.isEmpty()) {
		response.sendRedirect("profile.jsp");
	}
%>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark nav">
		<a class="navbar-brand" href="homepage.jsp">FareChecker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<ul class="navbar-nav mr-auto">
		    	<li class="nav-item active">
		        	<a class="nav-link" href="login.jsp">Login <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="register.jsp">Register</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="jumbotron jumbo">
		<h1 class="display-4" id="test">Welcome To FareChecker</h1>
		<p class="lead">This website will help you navigate the frustrating experience of finding the cheapest ride to your favorite places!</p>
	</div>

	<form id="directions" action="details.jsp" method="get">
		<div class="test">
			<div class="cntr">
				<div class="cntr-innr" id="locationField">
					<label class="search" for="startAdd">
						<input id="startAdd" type="text" placeholder=""/>
					</label>
					<p class="label">Starting From...<br>Defaults to current location</p>
					<h5 class="danger1">Enter a starting location</h5>
				</div>
			</div>
		</div>
		<div class="test1">
			<div class="cntr">
				<div class="cntr-innr" id="locationField2">
					<label class="search" for="endAdd">
						<input id="endAdd" type="text" placeholder=""/>
						<button type="submit" style="display: none;"></button>
					</label>
					<p class="label1">Going To...</p>
					<h5 class="danger">Enter a destination</h5>
				</div>
			</div>
		</div>
		<input type="hidden" id="startlat" value="">
		<input type="hidden" id="startlng" value="">
		<input type="hidden" id="endinglat" value="">
		<input type="hidden" id="endinglng" value="">
	</form>

	<div id="wrapper">
		<div id="map"></div>
	</div>
	
<script type='text/javascript' src="config.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type='text/javascript' src="homepage.js"></script>
</body>
</html>