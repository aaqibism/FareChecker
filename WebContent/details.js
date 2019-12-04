function table()
{
	var xhr = new XMLHttpRequest();

	xhr.open('POST', "test", false);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send("startinglat=" + hi + "&endinglat=" + term+"&endinglng="+terms+"&startinglng="+his);
	if (xhr.responseText.trim().length > 0) {	
		console.log("yes");
		var x=JSON.parse(xhr.responseText);
		console.log(x[0]);
		document.getElementById("uber").innerHTML="$"+x[0];
		document.getElementById("lyft").innerHTML="$"+x[1];

		
	}
}
