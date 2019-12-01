let startAdd;
let favAdd;
let endAdd;
let mymap;
let geocoder;
let startinglat;
let startinglng;
let userinfo;
let currLoc;
let traffic; //Do we want this?
let transit; //Do we want this?
let configmap = {
fullscreenControl: false,
center: {lat:10, lng:20}, //default coordinates in case user denies location
zoom: 17, //how much you want to center in on user location
types: ['locality']
}

let src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyBzzdSiMPX8WIoLQRLrwEyashCVd2zbqf8&libraries=places&callback=initMap";
(function(d){
    let file = src;
    let ref = d.getElementsByTagName('script')[0];
    let js = d.createElement('script');
    js.src = file;
    ref.parentNode.insertBefore(js, ref);
}(document));

function initMap() {
geocoder = new google.maps.Geocoder();
mymap = new google.maps.Map(document.getElementById('map'),configmap);
navigator.geolocation.getCurrentPosition(sucessful_location, nolocation, configmap);//gets return for cases above

endAdd = new google.maps.places.Autocomplete(
document.getElementById('endAdd'), {types: ['establishment','geocode']});
startAdd=new google.maps.places.Autocomplete(
document.getElementById('startAdd'), {types: ['establishment','geocode']});
favAdd=new google.maps.places.Autocomplete(
document.getElementById('favAdd'), {types: ['establishment','geocode']});
endAdd.addListener('place_changed', function() {});
startAdd.addListener('place_changed', function() {});
favAdd.addListener('place_changed', function() {});




}


function sucessful_location(position)
{
userinfo = new google.maps.InfoWindow({
content: "<div id='popup'><h4>You Are Here</h4></div>"
});
currLoc = { lat: position.coords.latitude, lng: position.coords.longitude };
startinglat = position.coords.latitude; //currLoc.lat;
startinglng = position.coords.longitude;//currLoc.lng;
userinfo.setPosition({lat: startinglat, lng: startinglng}); //display current location on the map
userinfo.open(mymap)
let circle = new google.maps.Circle({center: currLoc, radius: position.coords.accuracy});
startAdd.setBounds(circle.getBounds());
endAdd.setBounds(circle.getBounds());
}

function nolocation()
{
userinfo = new google.maps.InfoWindow({
content: "<div id='popup'><h4>Can't Get Your Location</h4></div>"
});
currLoc = { lat: 0, lng: 0 };
startinglat = 0;
startinglng = 0;
userinfo.setPosition({lat:0, lng:0});
userinfo.open(mymap);
}

//should get cord. of final destination based on user input for adrs 
document.querySelector("#favoriteform").onsubmit = function (event) {
	event.preventDefault(); //REMOVE THIS TO SUBMIT
	let favoriteadd = document.getElementById('favAdd').value;
	let name= document.getElementById('nameoffav').value;
	let button= document.getElementsByName("topornot");
	for(i = 0; i < button.length; i++) { 
        if(button[i].checked) 
        {
        	
        	button= button[i].value;
        	break;
        }
       
    } 
	if( favoriteadd.length > 0 && name.length>0)
	{

		geocoder.geocode( { 'address': favoriteadd}, function(results, status) {
		if (status == 'OK') {
		let markersec = new google.maps.Marker({
		position: results[0].geometry.location
		});
		document.querySelector("#favlat").value = markersec.position.lat();
		document.querySelector("#favlng").value = markersec.position.lng();
		console.log("Favorite: "+ markersec.position.lat() + " " + markersec.position.lng());
		var xhttp= new XMLHttpRequest();

		xhttp.open("GET", "addfav?lat=" + markersec.position.lat()+
				"&lng=" +  markersec.position.lng()+"&name="+name, false);
		
		xhttp.send();	
		return true;
		} 
		

		});
		

		
	}
	else 
	{
		event.preventDefault(); //REMOVE THIS TO SUBMIT
		document.querySelector("#error").innerHTML = '<p style="color:red"> Please enter a location and a name</p>';
		document.querySelector("#startlng").value = startinglng;
		console.log("STARTING: "+ startinglat + " " + startinglng);
	}

	
	
	
	
	
	
}
document.querySelector("#enterfavorite").onsubmit = function (event) {
	//event.preventDefault(); //REMOVE THIS TO SUBMIT
	let secondaddd = document.getElementById('startAdd').value;
	if( secondaddd.length > 0)
	{
		console.log("MADEIT");
	geocoder.geocode( { 'address': secondaddd}, function(results, status) {
	if (status == 'OK') {
	let markersec = new google.maps.Marker({
	map: mymap,
	position: results[0].geometry.location
	});
	mymap.panTo(markersec.position);
	startinglat = markersec.position.lat();
	startinglng= markersec.position.lng();
	console.log("STARTINGHERE: "+ markersec.position.lat() + " " + markersec.position.lng());
	let favaddentered= document.getElementById('enterfavresult').value;
	if(favaddentered.length > 0)
	{
		console.log("STARTING3: "+ startinglat + " " + startinglng);
		var xhttp= new XMLHttpRequest();
		let nameoffavorite=document.getElementById('enterfavresult').value;
		xhttp.open("GET", "getLocation?name=" +nameoffavorite+"&startlat="+startinglat+
				"&startlng="+startinglng, false);
		xhttp.send();
		
		
		//if successful set it as ending lat and lng and redirect to details.jsp else return error message
		if (xhttp.responseText.trim().length > 23) {	
			document.getElementById("errorFav").innerHTML= xhttp.responseText;
			
			return false;
		}
		else 
		{
			return true;
		}
	}
	else
	{
		document.getElementById("errorFav").innerHTML='<p style="color:red"> Please enter a name</p>';
		return false;
		
	}
	} 
	});
	} 
	else
	{
		let favaddentered2= document.getElementById('enterfavresult').value;
		if(favaddentered2.length > 0)
		{
			console.log("STARTING3: "+ startinglat + " " + startinglng);
			var xhttp= new XMLHttpRequest();
			let nameoffavorite=document.getElementById('enterfavresult').value;
			xhttp.open("GET", "getLocation?name=" +nameoffavorite+"&startlat="+startinglat+
					"&startlng="+startinglng, false);
			xhttp.send();
			
			
			//if successful set it as ending lat and lng and redirect to details.jsp else return error message
			if (xhttp.responseText.trim().length > 23) {	
				document.getElementById("errorFav").innerHTML= xhttp.responseText;
				
				return false;
			}
			else
			{
				return true;
			}
		}
		else
		{
			document.getElementById("errorFav").innerHTML='<p style="color:red"> Please enter a name</p>';
			return false;
			
		}
		
		
	}
	
	//get fav lat and lng from database
	

	
}
document.querySelector("#directions").onsubmit = function (event) {
//event.preventDefault(); //REMOVE THIS TO SUBMIT
let secondadd = document.getElementById('startAdd').value;
let address = document.getElementById('endAdd').value;
console.log(address);
console.log(secondadd);
if( secondadd.length > 0)
{
geocoder.geocode( { 'address': secondadd}, function(results, status) {
if (status == 'OK') {
let markersec = new google.maps.Marker({
map: mymap,
position: results[0].geometry.location
});
mymap.panTo(markersec.position);
document.querySelector("#startlat").value = markersec.position.lat();
document.querySelector("#startlng").value = markersec.position.lng();
console.log("STARTING: "+ markersec.position.lat() + " " + markersec.position.lng());
} 
});
} else {
document.querySelector("#startlat").value = startinglat;
document.querySelector("#startlng").value = startinglng;
console.log("STARTING: "+ startinglat + " " + startinglng);
}

if (address.length > 0) {
if (document.querySelector("#startlat").value == "0" && document.querySelector("#startlng").value == "0")
{
$(".danger1").css("display", "block");
}
geocoder.geocode( { 'address': address}, function(results, status) {
if (status == 'OK') {
let marker = new google.maps.Marker({
map:mymap,
position: results[0].geometry.location
});
 mymap.panTo(marker.position);
document.querySelector("#endinglat").value = marker.position.lat();
document.querySelector("#endinglng").value = marker.position.lng();
console.log("Ending: " + marker.position.lat() + " " + marker.position.lng());
} 
});
} else {
$(".label1").css("margin-top", "5px");
$(".danger").css("display", "block");
}
}


document.querySelector("#endAdd").onkeypress = function() {
if (document.querySelector(".danger").style.display == "block")
{
$(".label1").css("margin-top", "35px");
$(".danger").toggle();
}
}

document.querySelector("#startAdd").onkeypress = function() {
if (document.querySelector(".danger1").style.display == "block")
{
$(".danger1").toggle();
}
}

$("#startAdd").on('focus', function () {
$(this).parent('label').addClass('active');
});

$("#startAdd").on('blur', function () {
if($(this).val().length == 0) {
$(this).parent('label').removeClass('active');
}
});

$("#endAdd").on('focus', function () {
$(this).parent('label').addClass('active');
});

$("#endAdd").on('blur', function () {
if($(this).val().length == 0) {
$(this).parent('label').removeClass('active');
}
});

$('#endAdd').keypress(function(event) {
    if (event.keyCode == 13 || event.which == 13) {
$("#directions").submit();
    }
});
