<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log out</title>
<% 
	HttpSession h = request.getSession();	
	session.invalidate(); 
	response.sendRedirect("homepage.jsp");
%>
</head>
<body>

</body>
</html>