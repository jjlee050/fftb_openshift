<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Delivery Schedule</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css"/>
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<%
	int scheduleID = Integer.parseInt(request.getParameter("id"));
	Delivery_Schedule deliverySchedule = deliveryScheduleManager.getDeliverySchedule(scheduleID);
	
	int packingListID = deliverySchedule.getPackingList().getPackingListID();
	Packing_List packingList = null;
	for(int i=0;i<packingListArr.size();i++){
		if(packingListArr.get(i).getPackingListID() == packingListID){
			packingList = packingListArr.get(i);
		}
	}
	
	ArrayList<Packing_List_Food_Item> packingListFoodItemArr = packingList.unnamed_Packing_List_Food_Item_;
	ArrayList<Food> foodArr = new ArrayList<Food>();
	for(int i=0;i<packingListFoodItemArr.size();i++){
		foodArr.add(packingListFoodItemArr.get(i).getUnnamed_Food_());
	}
	for(int i=0;i<foodArr.size();i++){
		System.out.println(foodArr.get(i).getFoodID());
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		var type = "<%= deliverySchedule.getBeneficiary().getType() %>"
		if(type=="Self Collection Centre"){
			$(".selfCollectionCentreProfile").show();
			$(".schoolProfile").hide();
		}
		else{
			$(".selfCollectionCentreProfile").hide();
			$(".schoolProfile").show();
		}
		
		$('.foodTable').dataTable({
			 "bJQueryUI": true,
		     "sPaginationType": "full_numbers"
		});
		
		$("#deleteBtn").click(function(){
			var conf = confirm("Are you sure?");
			if(conf){
				window.open("deleteDeliveryScheduleDone.jsp","_self");
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
				<h3> View Delivery Schedule </h3>
				<div class="editDeleteCol">
					<a href="updateDeliverySchedule.jsp?id=<%= scheduleID %>"><button>Edit Schedule</button></a>
					<form action="deleteDeliveryScheduleServlet" method='post'>
						<input type="hidden" name="scheduleID" value="<%= scheduleID %>"/>
						<button id="deleteBtn">Delete Schedule</button>
					</form>
				</div>
				<div class="profile">
					<img src="image/beneficiaryProfileImage/<%= deliverySchedule.getBeneficiary().getImage() %>" width="250" height="100"/>
					<br/>
					<b> <%= deliverySchedule.getBeneficiary().getName() %> </b>
					<table class="viewBeneficiaryTable">
						<tbody class="requiredProfile">
							<tr><td>Type: </td><td><%= deliverySchedule.getBeneficiary().getType() %></td></tr>
							<tr><td>Address: </td><td><%= deliverySchedule.getBeneficiary().getAddress() %></td></tr>
							<tr><td>Number of Beneficiary: </td><td><%= deliverySchedule.getBeneficiary().getNumberOfBeneficiary() %></td></tr>
						</tbody>
						<tbody class="selfCollectionCentreProfile">
							<tr><td></td></tr>
							<tr><td colspan='2'><b>Contact Information: </b></td></tr>
							<tr><td></td></tr>
							<% if(deliverySchedule.getBeneficiary() instanceof Self_Collection_Centre){ %>
							<tr><td>Name: </td><td><%= ((Self_Collection_Centre) deliverySchedule.getBeneficiary()).getContactName() %></td></tr>
							<tr><td>Email: </td><td><%= ((Self_Collection_Centre) deliverySchedule.getBeneficiary()).getContactEmail() %></td></tr>
							<tr><td>Phone Number: </td><td><%= ((Self_Collection_Centre) deliverySchedule.getBeneficiary()).getContactPhone() %></td></tr>
							<% } %>
						</tbody>	
						<tbody class="schoolProfile">
							<tr><td></td></tr>
							<tr><td colspan='2'><b>School Information: </b></td></tr>
							<tr><td></td></tr>
							<% if(deliverySchedule.getBeneficiary() instanceof School){ %>
							<tr><td>Description:</td><td> <%= ((School) deliverySchedule.getBeneficiary()).getDescription() %> </td></tr>
							<% } %>
						</tbody>
					</table>
				</div>
				<div class="scheduleDetails">
					<div class="scheduleInformation">
						<p> <%= deliverySchedule.getDescription() %></p>
						<p> Status: <%= deliverySchedule.getStatus() %> </p>
						<p> Date and Time: <%= sdf.format(deliverySchedule.getDate()) + "\n\n" + stf.format(deliverySchedule.getTime()) %> </p>
							<fieldset style="width:96%;">
								<legend><h4> Packing List Information </h4></legend>
								<div class="foodInfo">
									<table class="foodTable">
										<thead>
											<tr><td> Name </td><td> Type </td><td> Weight </td><td> Vegetarian </td><td> Halal </td><td> Expiry Date </td><td> Quantity </td></tr>
										</thead>
										<tbody>
											<% for(int i=0;i<foodArr.size();i++){ %>
											<tr><td><%= foodArr.get(i).getName() %></td><td><%= foodArr.get(i).getType() %></td><td><%= foodArr.get(i).getWeight() %></td>
												<% if(foodArr.get(i).getVegetarian() == 1){ %>
												<td> Yes </td>
												<% } 
												   else{%>
												<td> No </td>
												<% } 
												   if(foodArr.get(i).getHalal() == 1){ %>												
												<td> Yes </td>
												<% } 
												   else{ %>
												<td> No </td>
												<% } %>
												<td><%= sdf.format(foodArr.get(i).getExpiryDate()) %></td>
											<% } %>
											<% for(int i=0;i<packingListFoodItemArr.size();i++){ %>												
												<td><%= packingListFoodItemArr.get(i).getQuantity() %></td>
											<% } %>	
										</tbody>
									</table>
								</div>
								<div class="packingListInfo">
									<table>
										<tr><td>Event Type: </td><td><%= packingList.getEventType() %></td></tr>
										<tr><td>Amount of Bags: </td><td><%= packingList.getAmountOfBags() %></td></tr>
									</table>
								</div>
							</fieldset>
					</div>
					<div class="vehicleInformation">
						<br/>
						<img src="image/vehicleImage/<%= deliverySchedule.getVehicle().getImage() %>" width="350" height="150"/>
						<table class="viewVehicleTable">
							<tr><td></td></tr>
							<tr><td colspan='2'><b>Vehicle Information: </b></td></tr>
							<tr><td></td></tr>
							<tr><td>Vehicle No:  </td><td><%= deliverySchedule.getVehicle().getVehicleNo() %></td></tr>
							<tr><td>Model: </td><td><%= deliverySchedule.getVehicle().getModel()%></td></tr>
							<tr><td>Weight: </td><td><%= deliverySchedule.getVehicle().getWeight()%></td></tr>
							<tr><td>Status: </td><td><%= deliverySchedule.getVehicle().getStatus()%></td></tr>
							<tr><td>Type: </td><td><%= deliverySchedule.getVehicle().getType()%></td></tr>
						</table>
					</div>
				</div>
			</div>
				
		<%@ include file="footer.html" %>
	</div>
</body>
</html>