<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.VehicleManager,ffth.model.Vehicle,java.util.*,ffth.data.DeliveryScheduleManager,ffth.model.Delivery_Schedule,java.util.*,java.text.SimpleDateFormat;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Copy From Existing Schedule</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/numberSort.js"></script>
<% 
	DeliveryScheduleManager deliveryScheduleManager = new DeliveryScheduleManager();
	ArrayList<Delivery_Schedule> deliveryScheduleArr = deliveryScheduleManager.getAllDeliverySchedules();
	
	VehicleManager vehicleManager = new VehicleManager();
 	ArrayList<Vehicle> vehicleArr = vehicleManager.getAllVehicles();
	
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat stf = new SimpleDateFormat("h:mm a");
 %>
<script>
$(document).ready(function(){
	$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
	{
	    return {
	        "iStart":         oSettings._iDisplayStart,
	        "iEnd":           oSettings.fnDisplayEnd(),
	        "iLength":        oSettings._iDisplayLength,
	        "iTotal":         oSettings.fnRecordsTotal(),
	        "iFilteredTotal": oSettings.fnRecordsDisplay(),
	        "iPage":          oSettings._iDisplayLength === -1 ?
	            0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
	        "iTotalPages":    oSettings._iDisplayLength === -1 ?
	            0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
	    };
	};
	var page = parseInt(0);
	var oTable = $('.copyScheduleTable').dataTable({
		 "bJQueryUI": true,
	     "sPaginationType": "full_numbers",
		 "fnDrawCallback": function () {
	    		 page = this.fnPagingInfo().iPage+1;
	     },
	     "aaSorting": [[ 1, "asc" ]],
	     "aoColumns": [
	                   { "bSortable": false },
	                   { "bSortable": false },
	                   { "bSortable": false },
	                   { "bSortable": false },
	                   { "bSortable": false },
	                   { "bSortable": false },
	                   { "bSortable": false },
		   ] 
	});
	
	$(".selectBtn").click(function(){
		var rowIndex = parseInt($('table input:radio:checked').val());
		rowIndex += 1;
		var correctRowIndex = (page * 10) - (((page*10)-10) + ((page * 10) - rowIndex));
		var beneficiaryName = "";
		var vehicleNo = "";
		var model = "";
		var weight = "";
		var vehicleStatus = "";
		var type = "";
		var description = "";
		var status = "";
		var date = "";
		var time = "";
		if(rowIndex >= 0){
			$('.copyScheduleTable tr:eq('+correctRowIndex+')').each(function() {
				beneficiaryName = $(this).find("td").eq(2).html();
				vehicleNo = $(this).find("td #vehicleNo").val();
				model = $(this).find("td #model").val();
				weight = $(this).find("td #weight").val();
				vehicleStatus = $(this).find("td #vehicleStatus").val();
				type = $(this).find("td #type").val();
				description = $(this).find("td #description").val();
			    status = $(this).find("td").eq(4).html();
			    date = $(this).find("td").eq(5).html();
			    time = $(this).find("td").eq(6).html();
			});
			$(window.opener.document).find(".beneficiaryName").attr("value",beneficiaryName);
			$(window.opener.document).find("#desc").attr("value",description);
			$(window.opener.document).find("#status").attr("value",status);
			$(window.opener.document).find("#date").attr("value",date);
			$(window.opener.document).find("#time12h").attr("value",time);
			$(window.opener.document).find("#vehicleNo").attr("value",vehicleNo);
			$(window.opener.document).find(".vehicleNo").html(vehicleNo);
			$(window.opener.document).find("#vehicleAdd #model").html(model);
			$(window.opener.document).find("#vehicleAdd #weight").html(weight);
			$(window.opener.document).find("#vehicleAdd .vehicleStatus").html(vehicleStatus);
			$(window.opener.document).find("#vehicleAdd #type").html(type);
			$(window.opener.document).find("table #noVehicleInfo").hide();
			$(window.opener.document).find("table #vehicleInfo").show();
			window.close();
		}
		else{
			alert("Please select a schedule.");
		}
	});
});
</script>
</head>
<body>
	<p> Select one of the schedule below:</p>
	<table class="copyScheduleTable">
		<thead>
			<tr><td class="radioBtn"></td><td>Schedule ID</td><td>Beneficiary Name</td><td>Vehicle No</td><td>Status</td><td>Delivery Date</td><td>Delivery Time</td></tr>
		</thead>
		<tbody>				
			<% for(int i=0;i<deliveryScheduleArr.size();i++){%>
			<tr><td class="radioBtn"><input type="hidden" name="description" id="description" value="<%=deliveryScheduleArr.get(i).getDescription()%>"><input type="radio" name="radio" value="<%= i %>"></td><td id="scheduleID"> <%= deliveryScheduleArr.get(i).getScheduleID() %> </td><td id="beneficiaryName"><%= deliveryScheduleArr.get(i).getBeneficiary().getName() %></td><td id="vehicleNo"><%= deliveryScheduleArr.get(i).getVehicle().getVehicleNo() %>
			<input type="hidden" name="vehicleNo" id="vehicleNo" value="<%= deliveryScheduleArr.get(i).getVehicle().getVehicleNo() %>">
				<input type="hidden" name="model" id="model" value="<%= deliveryScheduleArr.get(i).getVehicle().getModel() %>">
				<input type="hidden" name="weight" id="weight" value="<%= deliveryScheduleArr.get(i).getVehicle().getWeight() %>">
				<input type="hidden" name="vehicleStatus" id="vehicleStatus" value="<%= deliveryScheduleArr.get(i).getVehicle().getStatus() %>">
				<input type="hidden" name="type" id="type" value="<%= deliveryScheduleArr.get(i).getVehicle().getType() %>">
			</td><td id="status"><%= deliveryScheduleArr.get(i).getStatus() %></td><td id="date"><%= sdf.format(deliveryScheduleArr.get(i).getDate()) %></td><td id="time"><%= stf.format(deliveryScheduleArr.get(i).getTime()) %></td></tr>
			<% } %>
		</tbody>
	</table>
	<br/>
	<button class="selectBtn"> Select </button>
</body>
</html>