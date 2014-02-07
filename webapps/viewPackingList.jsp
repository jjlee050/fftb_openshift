<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Packing List</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/guoWeiStyle.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>
<script>
function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}
$(document).ready(function(){
	$(".selectButton").click(function(){
		window.open("selectPackingList.jsp", '',
				'width=600,height=450,resizable=no');
		window.focus();
		location.reload();
	});
	
	$(".checkShortages").click(function(){
		var amountOfBags=$("#amountOfBags").html();
		$(".selectedList tr.beverages").each(function () {
			   var quantity=$(this).find("td").eq(2).html();
			   var quantityAvailable=$(this).find("td").eq(3).html();
			   var totalNeeded=parseInt(quantity)*parseInt(amountOfBags);
			   var shortages=parseInt(quantityAvailable)-parseInt(totalNeeded);
			   
			   if(shortages<0){
				   shortages=Math.abs(shortages);
				   $("#shortagesDefault").remove();
				   $("#shortages").append("<tr><td>"+$(this).find("td").eq(0).html()+"</td><td>"+$(this).find("td").eq(1).html()+"</td><td>Beverage</td><td>"+shortages+"</td><</tr>");
			   }
			});
		$(".selectedList tr.cannedFood").each(function () {
			var quantity=$(this).find("td").eq(2).html();
			var quantityAvailable=$(this).find("td").eq(3).html();
			var totalNeeded=parseInt(quantity)*parseInt(amountOfBags);
			var shortages=parseInt(quantityAvailable)-parseInt(totalNeeded);
		   
			if(shortages<0){
				shortages=Math.abs(shortages);
				$("#shortagesDefault").remove();
				$("#shortages").append("<tr><td>"+$(this).find("td").eq(0).html()+"</td><td>"+$(this).find("td").eq(1).html()+"</td><td>Canned Food</td><td>"+shortages+"</td><</tr>");
				}
		});
		
		$(".selectedList tr.generalFood").each(function () {
			   var quantity=$(this).find("td").eq(2).html();
			   var quantityAvailable=$(this).find("td").eq(3).html();
			   var totalNeeded=parseInt(quantity)*parseInt(amountOfBags);
			   var shortages=parseInt(quantityAvailable)-parseInt(totalNeeded);
			   //shortages=Math.abs(parseInt(shortages));
			   
			   if(shortages<0){
				   shortages=Math.abs(shortages);
				   $("#shortagesDefault").remove();
				   $("#shortages").append("<tr><td>"+$(this).find("td").eq(0).html()+"</td><td>"+$(this).find("td").eq(1).html()+"</td><td>General Food</td><td>"+shortages+"</td><</tr>");
			   }
			});
	});
	
});
</script>
</head>
<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		<div class="sideBar">
			<h2> Additional Options </h2>
			<ul>
				<li><button class="selectButton"> Select Packing List</button></li><br/>
				<li><button class="checkShortages">Check Shortages</button></li>
			</ul>
			<h2>Shortages:</h2>
			<table id="shortages" style="border:1px solid black;">
			<tr>
			<th>Name</th>
			<th>Weight</th>
			<th>Type</th>
			<th>Short By</th>
			</tr>
			<tr id="shortagesDefault">
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			</tr>
			</table>
		</div>
		<div class="body">
			<h2>View Packing List</h2>
				<table cellspacing="20">
				<tr>
					<td>Packing List ID:</td>
					<td id="listID"></td>
				</tr>
					<tr>
						<td>Event Location:</td>
						<td id="eventLocation"></td>
					</tr>
					<tr>
						<td>Event Type:</td>
						<td id="eventType"></td>
					</tr>
					<tr>
						<td>Amount of Bags:</td>
						<td id="amountOfBags"></td>
					</tr>
					
				</table>
				<br /> <br />
				<table border=1 cellspacing=0 class="selectedList">
				<tr><th colspan="3">Main Packing List</th></tr>
					<tr>
						<th> Name </th>
						<th> Weight </th>
						<th> Quantity </th>
					</tr>
					<tr>
						<th colspan='3'>Beverages:</th>
					</tr>
					
						<tr id='beveragesDefault' class='beverages'>
							<td class="beveragesName">-</td>
							<td class="beveragesWeight">-</td>
							<td class="beveragesQuantity">-</td>
							
						</tr>
					
					<tr id="cannedFoodHead">
						<th colspan='3'>Canned Food:</th>
					</tr>
					
						<tr id='cannedFoodDefault' class='cannedFood'>
							<td class="cannedFoodName">-</td>
							<td class="cannedFoodWeight">-</td>
							<td class="cannedFoodQuantity">-</td>
							
						</tr>
					
					<tr id="generalFoodHead">
						<th colspan='3'>General Food:</th>
					</tr>
						<tr id='generalFoodDefault' class='generalFood'>
							<td class="generalFoodName">-</td>
							<td class="generalFoodWeight">-</td>
							<td class="generalFoodQuantity">-</td>
							
						</tr>
					<tr id="end" style="display:none;"></tr>
				</table><br/>
				
		</div>


		<%@ include file="footer.html"%>
	</div>
</body>
</html>