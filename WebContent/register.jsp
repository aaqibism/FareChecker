<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Cpmpatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Register</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">	
<script>
function register()
{
	var xhttp= new XMLHttpRequest();

	xhttp.open("GET", "RegisterServlet?username=" + document.login.username.value+"&password1="+document.login.password1.value+"&password2="+document.login.password2.value, false);
	
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
		width: 50%;
		margin: 10px;
		text-align: center;
		padding: 10px;
		display: inline-block;
	}
	
	.text-danger {
		display:none;
		margin:10px;
	}
	
	.btn {
		margin:10px;
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
		<div class="text-danger"></div>				
		<form name="register" id="register" method="post" action="profile.jsp">
			<input type="text" class = "form-control inputbar" id="username" name="username" placeholder = "Username"/><br> 
			<input type="text" class = "form-control inputbar" id="password1" name="password1" placeholder = "Password"/><br>
			<input type="text" class = "form-control inputbar" id="password2" name="password2" placeholder = "Confirm Password"/><br> 
			<button type="submit" class = "btn btn-primary">Register</button>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
function ajaxPost(postData) {
	console.log(postData);
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "RegisterServlet", false);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send(postData);
	if (xhr.responseText.trim().length > 0) {	
		console.log(xhr.responseText);
		document.querySelector(".text-danger").innerHTML= xhr.responseText;
		console.log("Error");
		return false;
	}
	return true;
};

document.querySelector("#register").onsubmit = function() {
	let username = document.querySelector("#username").value.trim();
	let password1 = document.querySelector("#password1").value.trim();
	let password2 = document.querySelector("#password2").value.trim();

	console.log(username);
	console.log(password1);
	console.log(password2);
	if(!ajaxPost("username=" + username + "&password1=" + password1 + "&password2=" + password2)) {
		$(".text-danger").css("display", "block");
		return false;
	}
	return true;
}

document.querySelector("#username").onkeypress = function() {
	$(".text-danger").css("display", "none");
}

document.querySelector("#password1").onkeypress = function() {
	$(".text-danger").css("display", "none");
}

document.querySelector("#password2").onkeypress = function() {
	$(".text-danger").css("display", "none");
}
</script>
</body>
</html>
