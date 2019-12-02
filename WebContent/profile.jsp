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
<title>Profile</title>
</head>
<body>

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
		</table>
		
			<table class="table table-hover">
				<tbody>
				<tr>
					<th width="10%" scope="row">1</th>
					<td width="15%">Home</td>
					<td width="45%">3115 Orchard Ave, Los Angeles, CA 90007</td>
					<td width="25%"><button class="btn btn-danger">Delete</button></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>School</td>
					<td>University of California, Los Angeles, CA 90007</td>
					<td><button class="btn btn-danger">Delete</button></td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Work</td>
					<td>840 Childs Way, Los Angeles, CA 90089</td>
					<td><button class="btn btn-danger">Delete</button></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="favorite">
		<div id="plus">
			<i class="fas fa-plus"></i>
			<h6>Add a New Favorite<h6>
		</div>
		<form name="myform" id="favoriteform" method="get">
			<input type=text id="locationName" class="form-control" placeholder="Name of Location">
			<input type=text id="locationAddress" class="form-control" placeholder="Address">
			<button type="submit" class="btn btn-primary">Submit</button>
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
						<!-- <input type="submit" style="display: none;" /> -->
						<!-- <button type="submit" style="display: none;"></button> -->
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



<!-- <div id="enterFav">
	<div id="errorFav"></div>
	<form name="myform" action="details.jsp" id="enterfavorite" class="form-inline" method="get">
		   <input type="text" class="form-control" id="enterfavresult" placeholder="Have a favorite saved? Enter name.">
			<button type="submit" class="btn btn-primary" id="submitfav">Find favorite</button> 
			<input type="hidden" id="startflat" value="">
			<input type="hidden" id="startflng" value="">
			<input type="hidden" id="endingflat"value="">
			<input type="hidden" id="endingflng"value="">
	</form>
</div>

<div class="container">

	<form name="myform" id="favoriteform" class="form-inline" method="get">
			<div id="error">
			</div>
			<div class="form-group row" >
					<div class="test2">
						<div class="cntr">
							<div class="cntr-innr" id="locationField3">
								<label class="search" for="favAdd">
									<input id="favAdd" class="form-control" type="text" style=" border:1px solid #d66; "placeholder="Enter favorite address"/>
								</label>
								<h6 class="danger">Enter a favorite</h5>
							</div>
						</div>
					</div>
			
		   		 <input type="text" class="form-control" style="position:relative; height:39px;left:60px; top:10px; width:350px;" id="nameoffav" placeholder="What is the name of your favorite location?">
		  		 
		  		
			</div>
			
			<input type="hidden" id="favlat" value="">
			<input type="hidden" id="favlng" value="">
			<input type="submit" style="position:relative; left:90px; top:10px;" id="submitform" value="Submit Favorite"> 
			
			
	
	</form>








</div> -->





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

</body>
</html>
