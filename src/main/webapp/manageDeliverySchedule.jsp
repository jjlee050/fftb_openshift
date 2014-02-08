<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Delivery Schedule</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css"/>
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/numberSort.js"></script>
<script>
$(document).ready(function() {
	$('.manageDeliveryScheduleTable').dataTable({
		 "bJQueryUI": true,
	     "sPaginationType": "full_numbers",
	     "aoColumns": [
	                   { "sType": "natural" },
	                   null,
	                   null,
	                   null,
	                   null,
	                   null,
	               ]
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
				<h1> Manage Delivery Schedule </h1>
				<a href="createDeliverySchedule.jsp"><button class="createSchedule"> Create Schedule </button></a>
				<hr/>
				<table class="manageDeliveryScheduleTable">
					<thead>
						<tr><td>Schedule ID</td><td>Beneficiary Name</td><td>Vehicle No</td><td>Status</td><td>Delivery Date</td><td>Delivery Time</td></tr>
					</thead>
					<tbody>
						<% for(int i=0;i<deliveryScheduleArr.size();i++){%>
						<tr><td><a href="viewDeliverySchedule.jsp?id=<%= deliveryScheduleArr.get(i).getScheduleID() %>"><%= deliveryScheduleArr.get(i).getScheduleID() %></a></td><td><%= deliveryScheduleArr.get(i).getBeneficiary().getName() %></td><td><%= deliveryScheduleArr.get(i).getVehicle().getVehicleNo() %></td><td><%= deliveryScheduleArr.get(i).getStatus() %></td><td><%= sdf.format(deliveryScheduleArr.get(i).getDate()) %></td><td><%= stf.format(deliveryScheduleArr.get(i).getTime()) %></td></tr>
						<% } %>
					</tbody>
				</table>
			</div>
		
		
		<%@ include file="footer.html" %>
		</div>
</body>
</html>