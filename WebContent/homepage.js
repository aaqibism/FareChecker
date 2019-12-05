let startAdd;
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

let src = "https://maps.googleapis.com/maps/api/js?key=" + API_KEY + 
			"&libraries=places&callback=initMap";
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

	// traffic = new google.maps.TrafficLayer({
	// 	autoRefresh: true,
	// 	map: mymap
	// });

	// transit = new google.maps.TransitLayer();
	// transit.setMap(mymap);

	endAdd = new google.maps.places.Autocomplete(
		document.getElementById('endAdd'), {types: ['establishment','geocode']});
	startAdd=new google.maps.places.Autocomplete(
		document.getElementById('startAdd'), {types: ['establishment','geocode']});
	
	endAdd.addListener('place_changed', function() {});
	startAdd.addListener('place_changed', function() {});
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
	userinfo.open(mymap);
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
document.querySelector("#directions").onsubmit = function (event) {
	event.preventDefault(); //REMOVE THIS TO SUBMIT
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
				sessionStorage.setItem("startinglat", startinglat );
				sessionStorage.setItem("startinglng",startinglng );
			} 
		});
	} else {
		document.querySelector("#startlat").value = startinglat;
		document.querySelector("#startlng").value = startinglng;
		console.log("STARTING: "+ startinglat + " " + startinglng);
		sessionStorage.setItem("startinglat", startinglat );
		sessionStorage.setItem("startinglng",startinglng );
	}

	if (address.length > 0) {
		if (document.querySelector("#startlat").value == "0" && document.querySelector("#startlng").value == "0")
		{
			$(".danger1").css("display", "block");
			return false;
		}
		geocoder.geocode( { 'address': address}, function(results, status) {
			if (status == 'OK') {
				let marker = new google.maps.Marker({
					map: mymap,
					position: results[0].geometry.location
				});
				// mymap.panTo(marker.position);
				document.querySelector("#endinglat").value = marker.position.lat();
				document.querySelector("#endinglng").value = marker.position.lng();
				sessionStorage.setItem("endinglat",marker.position.lat() );
				sessionStorage.setItem("endinglng",marker.position.lng() );
				

				console.log("Ending: " + marker.position.lat() + " " + marker.position.lng());
			} 
		});
	} else {
		$(".label1").css("margin-top", "5px");
		$(".danger").css("display", "block");
		return false;
	}
	setTimeout(function () {
        directions.submit();
    }, 2000);
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

