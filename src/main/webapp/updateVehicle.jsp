<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Vehicle</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!--  Validation  -->
<link rel="stylesheet" type="text/css" href="css/validation/screen.css" />
<link rel="stylesheet" type="text/css" href="css/validation/cmxform.css" />
<script src="javascript/validation/form-validate.js"></script>
<script src="javascript/validation/additional-methods.js"></script>
<%	
	String vehicleNo = request.getParameter("vehicleNo");
	Vehicle vehicle = vehicleManager.getVehicle(vehicleNo);	
%>
<script>
	$(document).ready(function(){
		<%
			System.out.println(vehicle.getStatus());
			if(vehicle.getStatus().equals("Maintenance")){
		%>
			$("#status").attr("value","Maintenance");
		<%}
			else{%>
			$("#status").attr("value","Available");
		<%}%>
		<%
			if(vehicle.getType().equals("Mini-van")){
		%>
			$("#type").val("Mini-van");
		<%}
			else if(vehicle.getType().equals("Van")){%>
			$("#type").val("Van");
		<%}
			else if(vehicle.getType().equals("Lorry")){%>
			$("#type").val("Lorry");
		<%}
			else{%>
			$("#type").val("Truck");	
		<%}%>
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
		$("#cancelBtn").click(function(){
			parent.history.back();
		});
		$("#updateVehicleForm").validate();
	});
</script>
</head>
<body>
<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		<div class="bodywithoutSide">
			<h3>Update Vehicle</h3>
			<h4> Fill in the details below: </h4>
			<fieldset style="width:550px;">
				<legend><h4> Vehicle Information </h4></legend>
				<form method="post" action="updateVehicleServlet" enctype="multipart/form-data" id="updateVehicleForm">
					<table class="updateVehicleTable">
						<tr><td>Vehicle No: </td><td><%= vehicleNo %><input type="hidden" name="vehicleNo" value="<%= vehicleNo %>"/></td></tr>
						<tr><td>Model: </td><td><input type="text" name="model" class="required" value="<%= vehicle.getModel() %>"/></td></tr>
						<tr><td>Weight: </td><td><input type="number" name="weight" min="1000" max="50000" step="500" class="required" value="<%= vehicle.getWeight() %>"/></td></tr>
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
						<tr><td>Image: </td><td><input type="file" name="img" id="uploadVehicleImg" accept="image/*"/></td></tr>
						<tr><td colspan='2'><input type="image" name="vehicleImage" id="vehicleImage" src="image/vehicleImage/<%= vehicle.getImage() %>" width="240" height="100"/></td></tr>
					</table>
				</fieldset>
				<br/>
				<input type="Submit" name="submit" id="submitBtn" value="Submit"/>
				<div class="buttonCol4">
					<a href="manageVehicle.jsp"><button id="cancelBtn" type='button' formaction='#'> Cancel </button></a>
				</div>
			</form>
		</div>
		<%@ include file="footer.html"%>
	</div>
</body>
</html>