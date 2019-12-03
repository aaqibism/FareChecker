<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Cpmpatible" content="IE-edge">
	<meta name="viewport" content="width - device-width, initial-scale=1">
	<title>Login</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">
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
		<form name="login" id="login" action="profile.jsp" method="post">
			<input type="text" class = "form-control inputbar" id="username" name="username" placeholder = "Username"/><br> 
			<input type="password" class = "form-control inputbar" id="password" name="password" placeholder = "Password"/><br>
			<button id="Button" type="submit" class = "btn btn-primary">Login</button> 
		</form>
	</div>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
/*function validate_login()
{
	var xhttp= new XMLHttpRequest();

	xhttp.open("GET", "LoginServlet?username=" + document.login.username.value+"&password="+document.login.password.value, false);
	
	xhttp.send();		
	if (xhttp.responseText.trim().length > 0) {	
		document.getElementById("errorhere").innerHTML= xhttp.responseText;
		console.log("yes");
		return false;
	}
	return true;

}*/

function ajaxPost(postData, returnFunction){
	console.log(postData);
	var xhr = new XMLHttpRequest();
	xhr.open('POST', "LoginServlet", false);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send(postData);
	xhr.onreadystatechange = function(){
		if (xhr.readyState == XMLHttpRequest.DONE) {
			if (xhr.status == 200) {
				console.log("what");
				returnFunction( xhr.responseText );
			} else {
				alert('AJAX Error.');
				console.log(xhr.status);
			}
		}
	}
};

document.querySelector("#login").onsubmit = function(event) {
	event.preventDefault();
	let username = document.querySelector("#username").value.trim();
	let password = document.querySelector("#password").value.trim();
	console.log(username);
	console.log(password);
	ajaxPost("username=" + username + "&password=" + password, function(result) {
		if (result.length > 0) {
			console.log(result);
			document.getElementById("errorhere").innerHTML= result;
			console.log("yes");
			event.preventDefault();
		}
	});
}

</script>
</body>
</html>
