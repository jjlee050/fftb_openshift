<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Beneficiary</title>
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
	$('.manageBeneficiaryTable').dataTable({
		 "bJQueryUI": true,
	     "sPaginationType": "full_numbers",
	     "aoColumns": [
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
				<h1> Manage Beneficiary </h1>
				<a href="createBeneficiary.jsp"><button class="createBeneficiary"> Create Beneficiary </button></a>
				<hr/>
				<table class="manageBeneficiaryTable">
					<thead>
						<tr><td> Name </td><td>Number of Beneficiary</td><td>Type</td><td>Address</td></tr>
					</thead>
					<tbody>
					 	<% for(int i=0;i<beneficiaryArr.size();i++){ %>
						<tr><td><a href="viewBeneficiary.jsp?id=<%= beneficiaryArr.get(i).getBeneficiaryID() %>"><%= beneficiaryArr.get(i).getName() %></a></td><td><%= beneficiaryArr.get(i).getNumberOfBeneficiary() %></td><td><%= beneficiaryArr.get(i).getType() %></td><td><%= beneficiaryArr.get(i).getAddress() %></td></tr>
						<% } %>
					</tbody>
				</table>
			</div>
		
		<%@ include file="footer.html" %>
		</div>
</body>
</html>