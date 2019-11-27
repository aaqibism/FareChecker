<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
		<meta charset="UTF-8">
		<title>Setting Page </title>
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
</head>
<body>
<table>
	
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
</body>
</html>