<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Allocate Vans</title>
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
		$('.allocateVanTable').dataTable({
			 "bJQueryUI": true,
		     "sPaginationType": "full_numbers",
		   	 "fnDrawCallback": function () {
		    		 page = this.fnPagingInfo().iPage+1;
		     }
		});
		$(".selectBtn").click(function() {
			var rowIndex = parseInt($('table input:radio:checked').val());
			rowIndex += 1;
			var correctRowIndex = (page * 10) - (((page*10)-10) + ((page * 10) - rowIndex)) ;
			var vehicleNo = "";
			var model = "";
			var weight = "";
			var status = "";
			var type = "";
			if(rowIndex >= 0){
				$('.allocateVanTable tr:eq('+correctRowIndex+')').each(function() {
					vehicleNo = $(this).find("td").eq(1).html();
				    model = $(this).find("td").eq(2).html();
				    weight = $(this).find("td").eq(3).html();
				    status = $(this).find("td").eq(4).html();
				    type = $(this).find("td").eq(5).html();
				});
				$(window.opener.document).find(".allocated").show();
				$(window.opener.document).find(".allocatedHeading").show();
				$(window.opener.document).find(".space").show();
				$(window.opener.document).find("#vehicleNo").attr("value",vehicleNo);
				$(window.opener.document).find(".vehicleNo").html(vehicleNo);
				$(window.opener.document).find("#vehicleAdd #model").html(model);
				$(window.opener.document).find("#vehicleAdd #weight").html(weight);
				$(window.opener.document).find("#vehicleAdd #status").html(status);
				$(window.opener.document).find("#vehicleAdd #type").html(type);
				$(window.opener.document).find("table #noVehicleInfo").hide();
				$(window.opener.document).find("table #vehicleInfo").show();
				/*$(window.opener.document).find("#vehicleAdd").append("<table>");
				$(window.opener.document).find("#vehicleAdd").append("<tr><td><b>"+ vehicleNo +"</b></td></tr>");
				$(window.opener.document).find("#vehicleAdd").append("<tr><td> Model: </td><td>"+model+" </td></tr>");
				$(window.opener.document).find("#vehicleAdd").append("<tr><td> Weight: </td><td>"+weight+" </td></tr>");
				$(window.opener.document).find("#vehicleAdd").append("<tr><td> Status: </td><td>"+status+" </td></tr>");
				$(window.opener.document).find("#vehicleAdd").append("<tr><td> Type: </td><td>"+type+" </td></tr>");
				$(window.opener.document).find("#vehicleAdd").append("<tr><td colspan='2'><button id='allocateVan' type='button' formaction='#'> Allocate Van </button></td></tr>");
				$(window.opener.document).find("#vehicleAdd").append("</table>");*/
				window.close();
			}
			else{
				alert("Please select a vehicle.");
			}
		});
	});
</script>
</head>
<body>
	<p>Select one of the vehicle below:</p>
	<table class="allocateVanTable">
		<thead>
			<tr>
				<td class="radioBtn"></td>
				<td>Vehicle No</td>
				<td>Model</td>
				<td>Weight</td>
				<td>Status</td>
				<td>Type</td>
			</tr>
		</thead>
		<tbody>
			<% for(int i=0;i<vehicleArr.size();i++){%>
			<tr>
				<td class="radioBtn"><input type="radio" name="radio" value="<%= i %>"></td>
				<td id="vehicleNo"><%= vehicleArr.get(i).getVehicleNo() %></td>
				<td id="model"><%= vehicleArr.get(i).getModel() %></td>
				<td id="weight"><%= vehicleArr.get(i).getWeight() %></td>
				<td id="status"><%= vehicleArr.get(i).getStatus() %></td>
				<td id="type"><%= vehicleArr.get(i).getType() %></td>
			</tr>
			<% }%>
		</tbody>
	</table>
	<br/>
	<button class="selectBtn">Select</button>
</body>
</html>