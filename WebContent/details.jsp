<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Details</title>
</head>
<body>

<script>
let term=sessionStorage.getItem("endinglat");
let terms=sessionStorage.getItem("endinglng");

console.log("Ending lat: "+ term);
console.log("Ending lng: "+ terms);

let hi = sessionStorage.getItem("startinglat");
let his = sessionStorage.getItem("startinglng");

console.log("Starting lat: "+ hi);
console.log("Starting lng: "+ his);    
</script>
</body>
</html>