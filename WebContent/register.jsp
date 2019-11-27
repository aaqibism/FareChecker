<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">
</head>
<style>
	#form{
		text-align: center;
	}
	.inputbar{
		width: 30%;
		margin: 10px 0;
		text-align: center;
		padding: 10px 10px;
		display: inline-block;
	}
	
	.Button{
		margin: 10px 0;
	}
	
</style>
<!-- JSP checking for existing error message -->

<!-- JSP end -->
	<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark nav">
		<a class="navbar-brand" href="homepage.jsp">FareChecker</a>
	</nav>
	
		<div id = "form">
			<div class="jumbotron jumbo">
			<h1 class = "display-4">Register</h1>
			</div>
			<form name="login" method="GET" action="RegisterServlet">
				<input type="text" class = "form-control inputbar" name="username" placeholder = "Username"/><br> 
				<input type="text" class = "form-control inputbar" name="password1" placeholder = "Password"/><br>
				<input type="text" class = "form-control inputbar" name="password2" placeholder = "Confirm Password"/><br> 
				<input id = "Button" type="submit" class = "btn btn-primary" name="registerSubmit" value="Sign Up" />
			</form>
		</div>
	</body>
</html>