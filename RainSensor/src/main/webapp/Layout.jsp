<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IoT</title>
<meta name="viewport" content="width=width-device,initial-scale=1" />
<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
href="Raining.css" />
<link rel="stylesheet"
href="Layout.css" />
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" ></script>

</head>

<!-- check the Comments for more info -->

<body>
	<div class="header">
		<h1>Rain Sensor</h1>
	</div>
	<div id="section-left">
		<div id="result">
			
		</div>			
	</div>
	<div id="section-right">
		<img class="image" src="./images/rainy.png">
		<div class="rain front-row"></div>
	  	<div class="rain back-row"></div>
	  	<div class="splat"></div>
	</div>
</body>

<script>
$(document).ready(function(){
	 
 loadData();

 function loadData(){
	 $.ajax({
	 type:'GET',
	 contentType: "application/json",
	 dataType: 'json',
	 url: 'http://localhost:8080/RainSensor/raindata',
	 success: function(data){
	 var str="";
	
	 str+='<table class="table table-dark">';
	 str+='<thead>';
	 str+='<tr>';
	 str+='<th></th>';
	 str+='<th>#</th>';
	 str+='<th>Raining</th>';
	 str+='<th>Humidity</th>';
	 str+='<th>Time At</th>';
	 str+='</tr>';
	 str+='</thead>';
	 str+='<tbody>';
	 
	 $.each(data, function(i, item){
	 str+='<tr>';
	 str+='<td></td>';
  	 str+='<td>'+item.ID+'</td>';
  	 str+='<td>'+item.raining+'</td>';
  	 str+='<td>'+item.humidity+'</td>';
  	 str+='<td>'+item.timeAt+'</td>';
	 str+='</tr>';
	 
	 })
	 str+='</tbody>';
     str+='</table>';
	 console.log(data);
	 console.log(str);
	 
	 $("#result").append(str);
	
	 },
	 error: function(data){
	 alert("error");
	 }
	 })
 	}
})


var makeItRain = function() {
	  //clear out everything
	  $('.rain').empty();

	  var increment = 0;
	  var drops = "";
	  var backDrops = "";

	  while (increment < 100) {
	    //couple random numbers to use for various randomizations
	    //random number between 98 and 1
	    var randoHundo = (Math.floor(Math.random() * (98 - 1 + 1) + 1));
	    //random number between 5 and 2
	    var randoFiver = (Math.floor(Math.random() * (5 - 2 + 1) + 2));
	    //increment
	    increment += randoFiver;
	    //add in a new raindrop with various randomizations to certain CSS properties
	    drops += '<div class="drop" style="left: ' + increment + '%; bottom: ' + (randoFiver + randoFiver - 1 + 100) + '%; animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"><div class="stem" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div><div class="splat" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div></div>';
	    backDrops += '<div class="drop" style="right: ' + increment + '%; bottom: ' + (randoFiver + randoFiver - 1 + 100) + '%; animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"><div class="stem" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div><div class="splat" style="animation-delay: 0.' + randoHundo + 's; animation-duration: 0.5' + randoHundo + 's;"></div></div>';
	  }

	  $('.rain.front-row').append(drops);
	  $('.rain.back-row').append(backDrops);
	}
	makeItRain();
</script>

</body>
</html>