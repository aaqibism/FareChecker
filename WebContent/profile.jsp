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
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron jumbo">
		<h1 class="display-4">Welcome To FareChecker</h1>
		<p class="lead">This website will help you navigate the frustrating experience of finding the cheapest ride to your favorite places!</p>
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


<br>
<div id="enterFav">
	<div id="errorFav"></div>
	<form name="myform" action="details.jsp" id="enterfavorite" class="form-inline" method="get">

		   <input type="text"  style="position:relative; height:39px;left:30px; top:10px; width:350px;" id="enterfavresult" placeholder="Have a favorite saved? Enter name.">

			<input type="submit" style="position:relative; left:50px;  top:10px;" id="submitfav" value="Find favorite"> 
		
			<input type="hidden" id="startflat" value="">
			<input type="hidden" id="startflng" value="">
			<input type="hidden" id="endingflat"value="">
			<input type="hidden" id="endingflng"value="">
		
		
			
	</form>

</div>

<br>
<div class="container">

	<form name="myform" id="favoriteform" class="form-inline" method="get">
			<div id="error">
			</div>
			<div class="form-group row" >
					<div class="test2">
						<div class="cntr">
							<div class="cntr-innr" id="locationField3">
								<label class="search" for="favAdd">
									<input id="favAdd" type="text" style=" border:1px solid #d66; "placeholder="Enter favorite address"/>
									<!-- <input type="submit" style="display: none;" /> -->
									<!-- <button type="submit" style="display: none;"></button> -->
								</label>
								<h6 class="danger">Enter a favorite</h5>
							</div>
						</div>
					</div>
			
		   		 <input type="text"  style="position:relative; height:39px;left:60px; top:10px; width:350px;" id="nameoffav" placeholder="What is the name of your favorite location?">
		  		 
		  		
			</div>
			
			<input type="hidden" id="favlat" value="">
			<input type="hidden" id="favlng" value="">
			<input type="submit" style="position:relative; left:90px; top:10px;" id="submitform" value="Submit Favorite"> 
			
			
	
	</form>








</div>





<div id="wrapper">
		<div id="map"></div>
</div>


 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>
<script type='text/javascript' src="profile.js"></script>

</body>
</html>
