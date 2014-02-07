<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Packing List</title>
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
	$(".importButton").click(function(){
		window.open("importPackingList.jsp", '',
				'width=600,height=450,resizable=no');
		window.focus();
		location.reload();
	});
	$(".selectPackingListItemBeverages").click(function(){
		//setCookie("beverage",-1,-1);
		var i=getCookie("beverage");
		if(i==null){
			setCookie("beverage",1,3);
		}
		//alert(getCookie("beverage"));
		window.open("selectPackingListItem.jsp?foodType=Beverage", '',
				'width=600,height=450,resizable=no');
		window.focus();
	});
	$(".selectPackingListItemCannedFood").click(function(){
		//setCookie("cannedFood",-1,-1);
		var i=getCookie("cannedFood");
		if(i==null){
			setCookie("cannedFood",1,3);
		}
		window.open("selectPackingListItem.jsp?foodType=Canned Food", '',
				'width=600,height=450,resizable=no');
		window.focus();
	});
	$(".selectPackingListItemGeneralFood").click(function(){
		//setCookie("generalFood",-1,-1);
		var i=getCookie("generalFood");
		if(i==null){
			setCookie("generalFood",1,3);
		}
		window.open("selectPackingListItem.jsp?foodType=General Food", '',
				'width=600,height=450,resizable=no');
		window.focus();
	});
	$(".submitBn").click(function(){
		setCookie("beverage",-1,-1);
		setCookie("cannedFood",-1,-1);
		setCookie("generalFood",-1,-1);
	});
	
	$(document).on('click', ".deleteRow",function(){
		if(confirm("Do you want to delete this row?")){
	    	$(this).closest ('tr').remove ();
		}
		else{
			
		}
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
				<li><button class="importButton"> Import Packing List</button></li>
			</ul>
		</div>
		<div class="body">
			<h2>Create Packing List</h2>
			<form method="post" action="createPackingListServlet">
				<table cellspacing="20">
					<tr>
						<td>Event Location:</td>
						<td><input type="text" name="eventLocation" id="eventLocation"></td>
					</tr>
					<tr>
						<td>Event Type:</td>
						<td><input type="radio" name="eventType" value="School" id="School">School</input><input
							type="radio" name="eventType" value="Self-Collection" id="Self-Collection">Self-Collection</input></td>
					</tr>
					<tr>
						<td>Amount of Bags:</td>
						<td><input type="text" name="amountOfBags" id="amountOfBags"></td>
					</tr>
					<tr>
						<td>Items in each bags:</td>
						<td><button class="selectPackingListItemBeverages" type="button">Beverages</button>
							<button class="selectPackingListItemCannedFood" type="button">Canned Food</button>
							<button class="selectPackingListItemGeneralFood" type="button">General Food</button></td>
					</tr>
				</table>
				<br /> <br />
				<table border=1 cellspacing=0 class="selectedList">
				<tr><th colspan="4">Main Packing List</th></tr>
					<tr>
						<th> Name </th>
						<th> Weight </th>
						<th> Quantity </th>
						<th> Action </th>
					</tr>
					<tr>
						<th colspan='4'>Beverages:</th>
					</tr>
					
						<tr id='beveragesDefault' class='beverages'>
							<td class="beveragesName">-<input type='hidden' name='beveragesName' id="beveragesName"></td>
							<td class="beveragesWeight">-<input type='hidden' name='beveragesWeight' id="beveragesWeight"></td>
							<td><input type='number' style='width:55%;' class='beveragesQuantity'  min=0 max=99 step=1 name='beveragesQuantity' value=0></td>
							<td><button class='deleteRow' type="button">Delete</button></td>
						</tr>
					
					<tr id="cannedFoodHead">
						<th colspan='4'>Canned Food:</th>
					</tr>
					
						<tr id='cannedFoodDefault' class='cannedFood'>
							<td class="cannedFoodName">-<input type='hidden' name='cannedFoodName' id="cannedFoodName"></td>
							<td class="cannedFoodWeight">-<input type='hidden' name='cannedFoodWeight' id="cannedFoodWeight"></td>
							<td><input type='number' style='width:55%;' class='cannedFoodQuantity'  min=0 max=99 step=1 name='cannedFoodQuantity' value="0"></td>
							<td><button class='deleteRow' type="button">Delete</button></td>
						</tr>
					
					<tr id="generalFoodHead">
						<th colspan='4'>General Food:</th>
					</tr>
						<tr id='generalFoodDefault' class='generalFood'>
							<td class="generalFoodName">-<input type='hidden' name='generalFoodName' id="generalFoodName"></td>
							<td class="generalFoodWeight">-<input type='hidden' name='generalFoodWeight' id="generalFoodWeight"></td>
							<td><input type='number' style='width:55%;' class='generalFoodQuantity'  min=0 max=99 step=1 name='generalFoodQuantity' value="0"></td>
							<td><button class='deleteRow' type="button">Delete</button></td>
						</tr>
					<tr id="end" style="display:none;"></tr>
				</table><br/>
				<table border=1 cellspacing=0 class="alternateList">
				<tr><th colspan="4">Alternate Packing List</th></tr>
					<tr>
						<th> Name </th>
						<th> Weight </th>
						<th> Quantity </th>
						<th> Action </th>
					</tr>
					<tr>
						<th colspan='4'>Beverages:</th>
					</tr>
					
						<tr id='alternateBeveragesDefault' class='beverages'>
							<td class="beveragesName">-<input type='hidden' name='beveragesName' id="beveragesName"></td>
							<td class="beveragesWeight">-<input type='hidden' name='beveragesWeight' id="beveragesWeight"></td>
							<td><input type='number' style='width:55%;' class='beveragesQuantity'  min=0 max=99 step=1 name='beveragesQuantity' value=0></td>
							<td><button class='deleteRow'>Delete</button></td>
						</tr>
					
					<tr id="alternateCannedFoodHead">
						<th colspan='4'>Canned Food:</th>
					</tr>
					
						<tr id='alternateCannedFoodDefault' class='cannedFood'>
							<td class="cannedFoodName">-<input type='hidden' name='cannedFoodName' id="cannedFoodName"></td>
							<td class="cannedFoodWeight">-<input type='hidden' name='cannedFoodWeight' id="cannedFoodWeight"></td>
							<td><input type='number' style='width:55%;' class='cannedFoodQuantity'  min=0 max=99 step=1 name='cannedFoodQuantity' value="0"></td>
							<td><button class='deleteRow'>Delete</button></td>
						</tr>
					
					<tr id="alternateGeneralFoodHead">
						<th colspan='4'>General Food:</th>
					</tr>
						<tr id='alternateGeneralFoodDefault' class='generalFood'>
							<td class="generalFoodName">-<input type='hidden' name='generalFoodName' id="generalFoodName"></td>
							<td class="generalFoodWeight">-<input type='hidden' name='generalFoodWeight' id="generalFoodWeight"></td>
							<td><input type='number' style='width:55%;' class='generalFoodQuantity'  min=0 max=99 step=1 name='generalFoodQuantity' value="0"></td>
							<td><button class='deleteRow'>Delete</button></td>
						</tr>
					<tr id="end" style="display:none;"></tr>
				</table>
				<br /> <input type="submit" name="submit" value="Submit" id="submitBn">
				<button type="reset" value="Reset">Reset</button>
			</form>
		</div>


		<%@ include file="footer.html"%>
	</div>
</body>
</html>