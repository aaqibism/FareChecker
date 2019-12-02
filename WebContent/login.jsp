<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">

<script>
function validate_login()
{
	var xhttp= new XMLHttpRequest();

	xhttp.open("GET", "LoginServlet?username=" + document.login.username.value+"&password="+document.login.password.value, false);
	
	xhttp.send();		
	if (xhttp.responseText.trim().length > 0) {	
		document.getElementById("errorhere").innerHTML= xhttp.responseText;
		
		return false;
	}
	return true;

}
</script>


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
	
</style>
<!-- JSP checking for existing error message -->

<!-- JSP end -->
	<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark nav">
		<a class="navbar-brand" href="homepage.jsp">FareChecker</a>
	</nav>
	
		<div id = "form">
			<div class="jumbotron jumbo">
			<h1 class = "display-4">Login</h1>
			</div>
			<div id="errorhere"></div>
			<form name="login" action="profile.jsp" method="get" onsubmit="return validate_login();">
				<input type="text" class = "form-control inputbar" name="username" placeholder = "Username"/><br> 
				<input type="text" class = "form-control inputbar" name="password" placeholder = "Password"/><br>
				<input id = "Button" type="submit" class = "btn btn-primary" name="registerSubmit" value="Login" />
			</form>
		</div>
	</body>
</html>
