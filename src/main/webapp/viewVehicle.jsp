<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Vehicle</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css"/>
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<%
	String vehicleNo = request.getParameter("vehicleNo");
	Vehicle vehicle = vehicleManager.getVehicle(vehicleNo);
	
	ArrayList<Delivery_Schedule> deliveryScheduleArrTable = new ArrayList<Delivery_Schedule>();
	for(int i=0;i<deliveryScheduleArr.size();i++){
		if(deliveryScheduleArr.get(i).getVehicle().getVehicleNo().equals(null)){
			vehicleNo = "";
		}
		else if((deliveryScheduleArr.get(i).getActive() == 1) && (deliveryScheduleArr.get(i).getVehicle().getVehicleNo().equals(vehicleNo))) {
			deliveryScheduleArrTable.add(deliveryScheduleArr.get(i));
		}
	}
 %>
<script type="text/javascript">
	$(document).ready(function(){
		var oTable = $('.manageDeliveryScheduleTable').dataTable({
			 "bJQueryUI": true,
		     "sPaginationType": "full_numbers",
		});
		$(".relatedSchedule").css("margin-top","-330px");
		$("#deleteBtn").click(function(){
			var conf = confirm("Are you sure?");
			if(!conf){
				
			}
			else{
				if(oTable.fnGetData().length > 0){
					alert("You cannot delete vehicle that has schedule left to deliver.");
				}
				else{
					$("#deleteBtn").attr("formaction","deleteVehicleServlet");		
				}
			}
		});
	});
</script>
</head>
<body>
<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
			<div class="bodywithoutSide">
				<h3>View Vehicle</h3>
				<div class="editDeleteCol">
					<a href="updateVehicle.jsp?vehicleNo=<%=vehicleNo%>"><button>Edit Vehicle</button></a>
					<form method='post'>
						<input type="hidden" name="vehicleNo" value="<%= vehicleNo %>"/>
						<button id="deleteBtn">Delete Vehicle</button>
					</form>
				</div>
				<div class="vehicleProfile">
					<br/>
					<img src="image/vehicleImage/<%= vehicle.getImage() %>" width="250" height="100"/>
					<table class="viewVehicleTable">
						<tr><td></td></tr>
						<tr><td colspan='2'><b>Vehicle Information: </b></td></tr>
						<tr><td></td></tr>
						<tr><td>Vehicle No:  </td><td><%= vehicle.getVehicleNo() %></td></tr>
						<tr><td>Model: </td><td><%= vehicle.getModel()%></td></tr>
						<tr><td>Weight: </td><td><%= vehicle.getWeight()%></td></tr>
						<tr><td>Status: </td><td><%= vehicle.getStatus()%></td></tr>
						<tr><td>Type: </td><td><%= vehicle.getType()%></td></tr>
					</table>
				</div>
				<div class="relatedSchedule">
					<table class="manageDeliveryScheduleTable">
						<thead>
							<tr><td>Schedule ID</td><td>Beneficiary Name</td><td>Vehicle No</td><td>Status</td><td>Delivery Date</td><td>Delivery Time</td></tr>
						</thead>
						<tbody>
							<% for(int i=0;i<deliveryScheduleArrTable.size();i++){%>
							<tr><td><%= deliveryScheduleArrTable.get(i).getScheduleID() %></td><td><%= deliveryScheduleArrTable.get(i).getBeneficiary().getName() %></td><td><%= deliveryScheduleArrTable.get(i).getVehicle().getVehicleNo() %></td><td><%= deliveryScheduleArrTable.get(i).getStatus() %></td><td><%= sdf.format(deliveryScheduleArrTable.get(i).getDate()) %></td><td><%= stf.format(deliveryScheduleArrTable.get(i).getTime()) %></td></tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		<%@ include file="footer.html" %>
		</div>
</body>
</html>