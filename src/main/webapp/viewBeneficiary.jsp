<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Beneficiary</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css"/>
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<%
	int beneficiaryID = Integer.parseInt(request.getParameter("id"));
	Beneficiary beneficiary = beneficiaryManager.getBeneficiary(beneficiaryID);
		
	ArrayList<Delivery_Schedule> deliveryScheduleArrTable = new ArrayList<Delivery_Schedule>();
	for(int i=0;i<deliveryScheduleArr.size();i++){
		if((deliveryScheduleArr.get(i).getActive() == 1) && (deliveryScheduleArr.get(i).getBeneficiary().getBeneficiaryID() == beneficiaryID )){
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
		var type = "<%= beneficiary.getType() %>";
		if(type=="Self Collection Centre"){
			$(".selfCollectionCentreProfile").show();
			$(".relatedSchedule").css("margin-top","-392px");
			$(".schoolProfile").hide();
		}
		else{
			$(".selfCollectionCentreProfile").hide();
			$(".relatedSchedule").css("margin-top","-347px");
			$(".schoolProfile").show();
		}
		$("#deleteBtn").click(function(){
			var conf = confirm("Are you sure?");
			if(!conf){
				
			}
			else{
				if(oTable.fnGetData().length > 0){
					alert("You cannot delete beneficiary that has schedule left to deliver.");
				}
				else{
					$("#deleteBtn").attr("formaction","deleteBeneficiaryServlet");
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
				<h3>View Beneficiary</h3>
				<div class="editDeleteCol">
					<a href="updateBeneficiary.jsp?id=<%= beneficiaryID %>"><button>Edit Beneficiary</button></a>
					<form method='post'>
						<input type="hidden" name="beneficiaryID" value="<%= beneficiaryID %>"/>
						<button id="deleteBtn">Delete Beneficiary</button>
					</form>
				</div>
				<div class="profile">
					<img src="image/beneficiaryProfileImage/<%= beneficiary.getImage() %>" width="250" height="100"/>
					<br/>
					<b> <%= beneficiary.getName() %> </b>
					<table class="viewBeneficiaryTable">
						<tbody class="requiredProfile">
							<tr><td>Type: </td><td><%= beneficiary.getType() %></td></tr>
							<tr><td>Address: </td><td><%= beneficiary.getAddress() %></td></tr>
							<tr><td>Number of Beneficiary: </td><td><%= beneficiary.getNumberOfBeneficiary() %></td></tr>
						</tbody>
						<tbody class="selfCollectionCentreProfile">
							<tr><td></td></tr>
							<tr><td colspan='2'><b>Contact Information: </b></td></tr>
							<tr><td></td></tr>
							<% if(beneficiary instanceof Self_Collection_Centre){ %>
							<tr><td>Name: </td><td><%= ((Self_Collection_Centre) beneficiary).getContactName() %></td></tr>
							<tr><td>Email: </td><td><%= ((Self_Collection_Centre) beneficiary).getContactEmail() %></td></tr>
							<tr><td>Phone Number: </td><td><%= ((Self_Collection_Centre) beneficiary).getContactPhone() %></td></tr>
							<% } %>
						</tbody>	
						<tbody class="schoolProfile">
							<tr><td></td></tr>
							<tr><td colspan='2'><b>School Information: </b></td></tr>
							<tr><td></td></tr>
							<% if(beneficiary instanceof School){ %>
							<tr><td>Description:</td><td> <%= ((School) beneficiary).getDescription() %> </td></tr>
							<% } %>
						</tbody>
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