<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Vehicle</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!--  Validation  -->
<link rel="stylesheet" type="text/css" href="css/validation/screen.css" />
<link rel="stylesheet" type="text/css" href="css/validation/cmxform.css" />
<script src="javascript/validation/form-validate.js"></script>
<script src="javascript/validation/additional-methods.js"></script>
<script>
$(document).ready(function(){
	$("#vehicleImage").hide();
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#vehicleImage').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$("#uploadVehicleImg").change(function(){
		$("#vehicleImage").show();
	    readURL(this);
	});
	$("#createVehicleForm").validate();
});
</script>
</head>
<body>
<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		<div class="bodywithoutSide">
			<h3>Create Vehicle</h3>
			<h4> Fill in the details below: </h4>
			<fieldset style="width:550px;">
				<legend><h4> Vehicle Information </h4></legend>
				<form method="post" action="createVehicleServlet" enctype="multipart/form-data" id="createVehicleForm">
					<table class="createVehicleTable">
						<tr><td>Vehicle No: </td><td><input type="text" id="vehicleNo" name="vehicleNo" class="required"  pattern="^[A-Z]{1,3}[0-9]{4}[A-Z]{0,1}$"/></td></tr>
						<tr><td>Model: </td><td><input type="text" name="model" class="required"/></td></tr>
						<tr><td>Weight: </td><td><input type="number" name="weight" min="1000" max="50000" step="500" class="required"/></td></tr>
						<tr><td>Status: </td><td>
							<select id="status" name="status">
								<option value="Available"> Available </option>
								<option value="Maintenance"> Maintenance </option>
							</select>
						</td></tr>
						<tr><td>Type: </td><td>
							<select id="type" name="type">
								<option value="Mini-van"> Mini-van </option>
								<option value="Van"> Van </option>
								<option value="Lorry"> Lorry </option>
								<option value="Truck"> Truck </option>
							</select>
						</td></tr>
						<tr><td>Image: </td><td><input type="file" name="img" id="uploadVehicleImg" class="required" accept="image/*"/></td></tr>
						<tr><td colspan='2'><input type="image" name="vehicleImage" id="vehicleImage" src="#" width="240" height="100"/></td></tr>
					</table>
				</fieldset>
				<br/>
				<input type="Submit" name="submit" id="submitBtn" value="Submit"/>
				<div class="buttonCol4">
					<a href="manageVehicle.jsp"><button type="button" formaction='#'> Cancel </button></a>
				</div>
			</form>
		</div>
		<%@ include file="footer.html"%>
	</div>
</body>
</html>