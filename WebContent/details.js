function table()
{
	var endlat=33.9415889;//sessionStorage.getItem("endinglat");
	var endlng=-118.40852999999998;//sessionStorage.getItem("endinglng");
	var startlat = 34.0195027;//sessionStorage.getItem("startinglat");
	var startlng =  -118.28941230000001;//sessionStorage.getItem("startinglng"); 

	var xhr = new XMLHttpRequest();
	let origins=startlat+','+startlng+'&destinations='+endlat+'%2C'+endlng;
	let url= "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins="+origins+'&key='+API_KEY;
	console.log(url);

	xhr.open('GET', url,false);
	xhr.send();
	var x=JSON.parse(xhr.responseText);
	console.log(x.rows[0].elements[0].distance.text);
	xhr.open('POST', "test", false);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send("distance=" + JSON.stringify(x.rows[0].elements[0].distance.text) );
	if (xhr.responseText.trim().length > 0) {	
		var x=JSON.parse(xhr.responseText);
		console.log(x[0]);
		document.getElementById("uber").innerHTML="$"+x[0];
		document.getElementById("lyft").innerHTML="$"+x[1];
	}

}
