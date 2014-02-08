<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="ffth.data.*,ffth.model.*,java.util.*"
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Schedule</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />

<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<% 
	/* Cookie[] cookies=request.getCookies();
	Cookie cookie=null;
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("type")){
				cookie=cookies[i];
			}
		}
	} */
	
	BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
	ArrayList<Beneficiary> beneficiaryArr = beneficiaryManager.getAllBeneficiarys();
	
	DeliveryScheduleManager scheduleManager = new DeliveryScheduleManager();
 	ArrayList<Delivery_Schedule> scheduleArr = scheduleManager.getAllDeliverySchedules();
 
 %>
 
<script>
/* function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
} */
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
		$('.selectScheduleTable').dataTable({
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
			var scheduleID = "nothing";
			var deliveryDate = "nothing";
			var beneficiaryName = "";
			//var status = "";
			//var type = "";
			if(rowIndex >= 0){
				$('.selectScheduleTable tr:eq('+correctRowIndex+')').each(function() {
					scheduleID = $(this).find("td").eq(1).html();
					beneficiaryName = $(this).find("td").eq(2).html();
				    deliveryDate = $(this).find("td").eq(3).html();
				    //status = $(this).find("td").eq(4).html();
				    //type = $(this).find("td").eq(5).html();
				}); 
				//$(window.opener.document).find(".allocated").show();
				//$(window.opener.document).find(".allocatedHeading").show();
				//$(window.opener.document).find(".space").show();
				$(window.opener.document).find("#scheduleID").attr("value",scheduleID);
				$(window.opener.document).find(".scheduleID").html(scheduleID);
				
				$(window.opener.document).find("#deliveryDate").attr("value",deliveryDate);
				$(window.opener.document).find("#deliveryDate").html(deliveryDate);
				
				$(window.opener.document).find("#beneficiaryName").attr("value",beneficiaryName);
				$(window.opener.document).find(".beneficiaryName").html(beneficiaryName);		
				
				//$(window.opener.document).find("#vehicleAdd #status").html(status);
				//$(window.opener.document).find("#vehicleAdd #type").html(type);
			
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
	<p>Select one of the item below:</p>
	<table class="selectScheduleTable">
		<thead>
			<tr>
				<td class="radioBtn"></td>
				<td>Schedule ID</td>
				<td>Beneficiary name</td>
				<td>Date</td>
				<td>Time</td>
				<td>Description</td>
				<td>Status</td>
			</tr>
		</thead>
		<tbody>
			<% for(int i=0;i<scheduleArr.size();i++){%>
			<tr>
				<td class="radioBtn"><input type="radio" name="radio" value="<%= i %>"></td>
				<td id="Item Name"><%= scheduleArr.get(i).getScheduleID() %></td>
				<td id="Item Name"><%= beneficiaryArr.get(i).getName() %></td>
				<td id="Item Name"><%= scheduleArr.get(i).getDate() %></td>
				<td id="Item Name"><%= scheduleArr.get(i).getTime() %></td>
				<td id="Item Name"><%= scheduleArr.get(i).getDescription() %></td>
				<td id="Item Name"><%= scheduleArr.get(i).getStatus() %></td>
				
			</tr>
			<%}%>
		</tbody>
	</table>
	<br/>
	<button class="selectBtn">Select</button>
</body>
</html>