<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="backend.getLocation"%>    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Cpmpatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Details</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Barlow:500|Raleway&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="styles.css">
	<% //meant to help getLocation.java figure out who is currently logged in
		HttpSession h= request.getSession();
		String username=(String)h.getAttribute("username");
		getLocation mine = null;
		if (username != null && !username.isEmpty()) {
			mine = new getLocation(username);
			mine.getlocations();
		}
	%>
<script type='text/javascript' src="config.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" 
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.11.2/js/all.js" data-auto-replace-svg="nest"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>

</head>
<body onload=testing();>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark nav">
		<a class="navbar-brand" href="profile.jsp">FareChecker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<ul class="navbar-nav mr-auto">
	    	<% if(username != null && !username.isEmpty()) { %>
	    		<li class="nav-item active">
		        	<a class="nav-link" href="logout.jsp">Log out<span class="sr-only">(current)</span></a>
				</li>
		    	<li class="nav-item active">
		        	<a class="nav-link" href="Settings.jsp">Settings<span class="sr-only">(current)</span></a>
				</li>
			<% } %>
			<% if(username == null || username.isEmpty()) { %>
				<li class="nav-item active">
		        	<a class="nav-link" href="login.jsp">Login <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="register.jsp">Register</a>
				</li>
			<% } %>			
			</ul>
		</div>
	</nav>
	
	
	
	<div id="details">
		<table id="lyftUber" class="table table-bordered">
			<thead><tr><th width="100%">Comparison</th></tr></thead>	
		</table>

		<table class="table table-bordered">
		<thead>
			<tr>
				<th width="50%" scope="col"><img src="uber.png" style="width:100px;"><br>Uber</th>
				<th width="50%" scope="col"><img src="lyft1.png" style="width:100px;"><br>Lyft</th>
    		</tr>
		</thead>		
		</table>
		
		<table class="table table-bordered">
			<script>
			</script>
			<tbody id="comparison">
				<tr>
			      <td id="uber"></td>
			      <td id="lyft"></td>
			    </tr>
			</tbody>
		</table>
	</div>
	<% if(username != null && !username.isEmpty()) { %>
	<div id="table">
		<script type="text/javascript"></script>
	<% if(username != null && !username.isEmpty()) { %>	
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
	<%} %>
	<% if(username != null && !username.isEmpty()) { %>	
			<table class="table table-hover">
			<script>
			var size=<%=mine.holder.size()%>;
			var complete=[];
			var url="";
			
			</script>
			<%String html="";%>
	<%} %>
	<% if(username != null && !username.isEmpty()) { %>							
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
	<%} %>
			</table>
		</div>
	</div>
	<%} %>
	
	<% if(username != null && !username.isEmpty()) { %>		
	
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
	
	<% } %>
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
<script type='text/javascript' src="profile.js"></script>
<script type='text/javascript' src="details.js"></script>
<script>
var term=sessionStorage.getItem("endinglat");
var terms=sessionStorage.getItem("endinglng");
console.log("Ending lat: "+ term);
console.log("Ending lng: "+ terms);
var hi = sessionStorage.getItem("startinglat");
var his = sessionStorage.getItem("startinglng");
console.log("Starting lat: "+ hi);
console.log("Starting lng: "+ his);    
table();
</script>
</body>
</html>
