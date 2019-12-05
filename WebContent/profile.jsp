<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="backend.getLocation"%>     
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Cpmpatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<title>Profile</title>
	<% //meant to help getLocation.java figure out who is currently logged in
		HttpSession h= request.getSession();
		String username=(String)h.getAttribute("username");
		if (username == null || username.isEmpty()) {
			response.sendRedirect("homepage.jsp");
		}
		getLocation mine= new getLocation(username);
		mine.getlocations();
	%>
</head>
<body>


	<nav class="navbar navbar-expand-lg bg-dark navbar-dark nav">
		<a class="navbar-brand" href="profile.jsp">FareChecker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<ul class="navbar-nav mr-auto">
	    		<li class="nav-item active">
		        	<a class="nav-link" href="logout.jsp">Log out<span class="sr-only">(current)</span></a>
				</li>
		    	<li class="nav-item active">
		        	<a class="nav-link" href="Settings.jsp">Settings<span class="sr-only">(current)</span></a>
				</li>
			</ul>
		</div>
	</nav>
	 
	<div class="jumbotron jumbo">
		<h1 class="display-4">Welcome To FareChecker</h1>
		<p class="lead">This website will help you navigate the frustrating experience of finding the cheapest ride to your favorite places!</p>
	</div>
	
	<div id="table">
		<table id="favorite" class="table">
			<thead><tr><th width="100%">Favorites</th></tr></thead>	
		</table>
		<div id="body"> 
		<table class="table table-hover">
		<thead>
			<tr>
				<th width="10%" scope="col">#</th>
				<th width="15%" scope="col">Name</th>
				<th width="45%" scope="col">Address</th>
				<th width="25%" scope="col">Delete</th>
    		</tr>
		</thead>
		<%int index=0; %>
		
		</table>
		
			<table class="table table-hover">
			<script>
			var size=<%=mine.holder.size()%>;
			var complete=[];
			var url="";
			
			</script>
			<%String html="";%>
				<tbody id="fill">
				<%for(int i=0;i<mine.holder.size();i++){ %>
				   <script>
				   complete.push(<%=mine.holder.get(i).lat%>);
				   complete.push(<%=mine.holder.get(i).lng%>);
				   var indexx=<%=i%>;
				   var nameee='<%=mine.holder.get(i).name%>';
				   url+='<tr id="hello'+indexx+'"><th width="10%" scope="row">'+(indexx+1)+'</th> <td width="15%">'+nameee+'</td> <td width="45%">'+' replaceme '+'</td> <td width="25%"><button class="btn btn-danger" onclick="remove(' +indexx +','+"'"+nameee+"'"+');">Delete</button></td> </tr>';
				   </script>
				   <%} %>
				
				
				
				
		
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="favorite">
		<div id="plus">
			<i class="fas fa-plus"></i>
			<h6>Add a New Favorite<h6>
		</div>
		<form name="myform" id="favoriteform" action="profile.jsp" method="post">
			<input type=text id="locationName" class="form-control" placeholder="Name of Location">
			<input type=text id="locationAddress" class="form-control" placeholder="Address">
			<input id = "Buttonfav" type="submit" class = "btn btn-primary" name="registerSubmit" value="Submit" />
			
		</form>
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
		<input type="hidden" id="endinglat"value="">
		<input type="hidden" id="endinglng"value="">
	</form>

<div id="wrapper">
		<div id="map"></div>
</div>

<script type='text/javascript' src="config.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" 
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.11.2/js/all.js" data-auto-replace-svg="nest"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>
<script type='text/javascript' src="profile.js"></script>
<script>testing();</script>
</body>
</html>

