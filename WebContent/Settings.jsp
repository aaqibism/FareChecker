<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Cpmpatible" content="IE-edge">
<meta name="viewport" content="width - device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Settings</title>

</head>
<body>
<%
	String errorUser = (String) session.getAttribute("errorUser");
	String errorPass = (String) session.getAttribute("errorPass");

	if(errorUser == null){
		errorUser = "";
	}
	if(errorPass == null){
		errorPass = "";
	}
%>
<table>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark nav">
		<a class="navbar-brand" href="profile.jsp">FareChecker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<ul class="navbar-nav mr-auto">
		    	<li class="nav-item active">
		        	<a class="nav-link" href="Settings.jsp">Settings <span class="sr-only">(current)</span></a>
				</li>
			</ul>
		</div>
	</nav>
	<h3> Setting</h3>
	<table style="width:100%">
	
	 <tr>
    	<th>User</th>
    	<th>Password</th> 

  	</tr>
		<form method ="POST" action="Settings" name="login"> 
		 	<tr>
		 	<th> 
			 	<br> New Username : <input id ="textbox" type="password" name="newUsername"><br/><br/> 
		         <%= errorUser %></div>  
	         </th>
	         <th>
	         New Email : <input id ="textbox" type="password" name ="newEmail" ><br/> 
	         <%= errorPass %></div>  
	         </th>
	        </tr>
	         <tr>
		         <th>
		         <br> Current Password : <input id ="textbox" type="password" name="originalPassword"><br/><br/> 
		         <%= errorUser %></div>  
		         </th>
		        <th> 
		         New Password : <input id ="textbox" type="password" name ="newPassword" ><br/> 
		         <%= errorPass %></div>  
		         Confirm Password : <input id ="textbox" type="password" name ="confirmPassword" ><br/> 
		         </th>
		        
	         </tr>
	        <input id ="textbox" type =submit value="Change"> 
		</form> 

</table>
<script type='text/javascript' src="config.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" 
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.11.2/js/all.js" data-auto-replace-svg="nest"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>
</body>
</html>