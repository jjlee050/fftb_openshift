<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Vehicle</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<script>
$(document).ready(function() {
	$('.manageVehicleTable').dataTable({
		 "bJQueryUI": true,
	     "sPaginationType": "full_numbers"
	});
});
</script>
</head>
<body>
<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
			<div class="sideBar">
				<ul class="secondaryNavigation">
					<h1> Overview </h1>
					<li><a href="showSummaryOfDeliverySchedule.jsp"> Schedule of the month </a> </li>
					<li><a href="manageBeneficiary.jsp"> Manage Beneficiary </a></li>
					<li><a href="manageDeliverySchedule.jsp"> Manage Delivery Schedule </a></li>
					<li><a href="manageVehicle.jsp"> Manage Vehicle </a></li>
				</ul>
			</div>
			<div class="body">
				<h1> Manage Vehicle </h1>
				<a href="createVehicle.jsp"><button class="createVehicle"> Create Vehicle </button></a>
				<hr/>
				<table class="manageVehicleTable">
					<thead>
						<tr><td>Vehicle No </td><td>Model </td><td>Weight </td><td>Status </td><td>Type </td></tr>
					</thead>
					<tbody>
						 <% for(int i=0;i<vehicleArr.size();i++){%>
						<tr><td><a href="viewVehicle.jsp?vehicleNo=<%= vehicleArr.get(i).getVehicleNo() %>"><%= vehicleArr.get(i).getVehicleNo() %></a></td><td> <%= vehicleArr.get(i).getModel() %></td><td> <%= vehicleArr.get(i).getWeight() %> </td><td><%= vehicleArr.get(i).getStatus() %> </td><td><%= vehicleArr.get(i).getType() %> </td></tr>
						<% } %>
					</tbody>
				</table>
			</div>
		<%@ include file="footer.html" %>
		</div>
</body>
</html>