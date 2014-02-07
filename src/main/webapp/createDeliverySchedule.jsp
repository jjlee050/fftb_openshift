<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Delivery Schedule</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>
<!-- Calendar -->
<link href='css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script type="text/javascript" src='javascript/calendar/fullcalendar.js'></script>
<!-- Clock Pick -->
<script type="text/javascript" src="javascript/clockpick.js"></script>
<link rel="stylesheet" href="css/clockpick.css" />
<!--  Validation  -->
<link rel="stylesheet" type="text/css" href="css/validation/screen.css" />
<link rel="stylesheet" type="text/css" href="css/validation/cmxform.css" />
<script src="javascript/validation/form-validate.js"></script>
<script src="javascript/validation/additional-methods.js"></script>
<!-- Lightbox -->
<link rel="stylesheet" type="text/css" href="css/colorbox.css" />
<script type="text/javascript" src="javascript/lightbox/jquery_colorbox.js"></script>
<style>
#date {
	margin-left: 2px;
}
</style>
<script>
	$(function() {
		$("#clockpick2").clockpick({
			valuefield : 'time',
			layout : 'horizontal'
		});
		
		$("table #noVehicleInfo").show();
		$("table #vehicleInfo").hide();
		$("table #noPackingListInfo").show();
		$("table #packingListInfo").hide();
		
		var width = $(".menu").width();
		$("#allocateVan").click(function() {
					window.open("allocateVan.jsp", '',
							'width='+width+',height=500,resizable=no');
					window.focus();
		});
		$("#selectListbn").click(
				function() {
					window.open("selectPackingList.jsp", '',
							'width='+width+',height=500,resizable=no');
					window.focus();
		});
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,today',
				center: 'title',
				right: 'month,basicWeek,basicDay,next',
			},
			contentHeight: 200,
			dayClick: function(date, allDay, jsEvent, view) {
				$("#date").val($.fullCalendar.formatDate(date,'dd/MM/yyyy'));
		    },
		    eventClick: function(calEvent, jsEvent, view){
		    	var date = $.fullCalendar.formatDate(calEvent.start,'dd/MM/yyyy');
		    	$("#date").val(date);
		    	var date2 = $.fullCalendar.formatDate(calEvent.start,'yyyy-MM-dd');
		    	var html = "<div style='padding:5px'><p>Schedule(s) to deliver on " + date + ":</p><ul>";
		    	<%for(int i=0;i<deliveryScheduleArr.size(); i+=1){
		    		Calendar calendar1 = GregorianCalendar.getInstance(); // creates a new calendar instance
		    		calendar1.setTime(deliveryScheduleArr.get(i).getTime());
		    		int hours = calendar1.get(Calendar.HOUR);
					int min = calendar1.get(Calendar.MINUTE);
					String curTime = "";
					if(calendar1.get(Calendar.AM_PM) == Calendar.PM){
						if(hours == 0){
							hours = 12;
						}
						curTime = String.format("%02d:%02d PM", hours, min);
					}
					else{
						curTime = String.format("%02d:%02d AM", hours, min);
					}%>
		    		if(date2 === "<%= deliveryScheduleArr.get(i).getDate() %>"){
		    		html += "<li style='list-style:none;margin-left:-3%;'><a href='viewDeliverySchedule.jsp?id=<%= deliveryScheduleArr.get(i).getScheduleID() %>'><b style='margin-bottom:5px;'><%= deliveryScheduleArr.get(i).getBeneficiary().getName() %></b></a><br/><br/><img src='image/beneficiaryProfileImage/<%= deliveryScheduleArr.get(i).getBeneficiary().getImage() %>' width='200' height='100'/>";
		    		html += "<div style='margin-top:-105px;position:relative;'><table style='margin-left:210px;'><tr><td colspan='2'><%= deliveryScheduleArr.get(i).getDescription() %></td></tr><tr><td> Status: </td><td> <%= deliveryScheduleArr.get(i).getStatus() %></td></tr><tr><td> Time: </td><td> <%= curTime %></td></tr><tr><td> Delivered By: </td><td><a href='viewVehicle.jsp?vehicleNo=<%= deliveryScheduleArr.get(i).getVehicle().getVehicleNo() %>'><%= deliveryScheduleArr.get(i).getVehicle().getVehicleNo() %></a></td></tr></table></div></li><br/><br/><br/><br/>";
		    		}
		    	<%}%>
		    	html += "</ul></div>";
		    	$(".fc-event").colorbox({html:html,width:"80%",height:"70%"});
		    },
		    weekMode: "liquid",
			editable: false,
			weekends: false,
			height: 400,
			events: [
						<% 
						ArrayList<String> datesStrings = new ArrayList<String>();
						ArrayList<Integer> datesIntegers = new ArrayList<Integer>();
						for(int i=0;i<deliveryScheduleArr.size(); i+=1){ 
							Calendar calendar = GregorianCalendar.getInstance(); // creates a new calendar instance
							Calendar calendar1 = GregorianCalendar.getInstance(); // creates a new calendar instance
							calendar.setTime(deliveryScheduleArr.get(i).getDate()); 
							calendar1.setTime(deliveryScheduleArr.get(i).getTime());
				    		int hours = calendar1.get(Calendar.HOUR);
							int min = calendar1.get(Calendar.MINUTE);
							String curTime = "";
							if(calendar1.get(Calendar.AM_PM) == Calendar.PM){
								if(hours == 0){
									hours = 12;
								}
								curTime = String.format("%02d:%02d PM", hours, min);
							}
							else{
								curTime = String.format("%02d:%02d AM", hours, min);
							}
							String date = format.format(calendar.getTime());
							datesStrings.add(date);
						}
						Collections.sort(datesStrings);
						for(int x=0;x<datesStrings.size();x++){
							datesIntegers.add(1);
						}
						
						int size = datesStrings.size();
					    int duplicates = 0;
	
					    for (int i = 0; i < size - 1; i++) {
					        for (int j = i + 1; j < size; j++) {
					            if (!datesStrings.get(j).equals(datesStrings.get(i)))
					                continue;
					            duplicates++;
					            datesIntegers.add(j,datesIntegers.get(i) + 1);
					            datesStrings.remove(j);
					            datesIntegers.remove(i);
					            j--;
					            size--;
					        }
					    } 
						Object datesArr[][] = new Object[datesIntegers.size()][2];
						for(int x=0;x<datesStrings.size();x++){
							datesArr[x][0] = datesStrings.get(x);
						}
						for(int x=0;x<datesIntegers.size();x++){
							datesArr[x][1] = datesIntegers.get(x);
						}
						
						for(int x=0;x<datesArr.length;x++){
							System.out.println(datesArr[x][0] + ": " + datesArr[x][1]);
						%>
						{
							id: <%= 1  %>,
							title: '<%= datesArr[x][1] + " schedule to deliver" %>',
							numberOfSchedule: <%= datesArr[x][1] %>,
							start: new Date("<%= datesArr[x][0] %>"),
							allDay: true,
						},
						<% }%>
			]
		});
		jQuery.validator.addMethod("checkDate", function(value, element) {
			var todayDate = new Date();
			//Format the date
			var dateString = $("#date").val();
			var date = new Date(dateString.substring(6,10),parseInt(dateString.substring(3,5)-1),dateString.substring(0,2));
			var selectedDate = new Date((date.getYear() + 1900),(date.getMonth()),date.getDate());
			if(selectedDate - todayDate <= 0){ 
				return false;
			}
			else{
				return true;
			}
		}, "Please select another date.");
		
		jQuery.validator.addMethod("checkVehicleIsAvailable", function(value, element) {
			var todayDate = new Date();
			// Format selected date
			var dateString = $("#date").val();
			var date = new Date(dateString.substring(6,10),parseInt(dateString.substring(3,5)-1),dateString.substring(0,2));
			var selectedDate = new Date((date.getYear() + 1900),(date.getMonth()),date.getDate());
			// Retrieve full schedule with vehicle no
			var scheduleArray = [];
			<% for(int i=0;i<deliveryScheduleArr.size(); i+=1){ 
			Calendar calendar = GregorianCalendar.getInstance(); // creates a new calendar instance
			Calendar calendar1 = GregorianCalendar.getInstance(); // creates a new calendar instance
			calendar.setTime(deliveryScheduleArr.get(i).getDate()); 
			calendar1.setTime(deliveryScheduleArr.get(i).getTime());
			int year= calendar.get(Calendar.YEAR);
			int month= calendar.get(Calendar.MONTH);
			int day = calendar.get(Calendar.DATE);
			int hours = calendar1.get(Calendar.HOUR);
			if(calendar1.get(Calendar.AM_PM) == Calendar.PM){
				if(hours == 0){
					hours = 12;
				}
			}
			int min = calendar1.get(Calendar.MINUTE);
			String curTime = String.format("%02d:%02d:00", hours, min);
			String date = (calendar.get(Calendar.MONTH) + 1) + " " + calendar.get(Calendar.DATE)+ ", " + calendar.get(Calendar.YEAR) + " " + curTime ;%>
				scheduleArray.push(["<%= deliveryScheduleArr.get(i).getVehicle().getVehicleNo() %>",<%= year %>,<%= month %>,<%= day %>,<%= hours %>,<%= min %>]);
			<% 
			} %>
			var vehicleNo = $("#vehicleNo").val();
			for(var i = 0;i<scheduleArray.length;i++){
				var morningSession = false;
				var afternoonSession = false;
				var hour = 0;
				var hour1 = 0;
				var min = 0;
				var min1 = 0;
				
				var selectedTime = $("#time12h").val();
				if(selectedTime.indexOf(":") === 1){
					hour = selectedTime.substring(0,1);
					min = selectedTime.substring(2,4);
				}
				else if(selectedTime.indexOf(":") === 2){
					hour = selectedTime.substring(0,2);
					min = selectedTime.substring(3,5);
				}

				if((hour >= 8) && (hour <=12)){
					morningSession = true;
				}
				else if((hour >= 1) && (hour <=6)){
					afternoonSession = true;
				}
				
				if(scheduleArray[i][0] === vehicleNo){
					var scheduleDate = new Date(scheduleArray[i][1],scheduleArray[i][2],scheduleArray[i][3]);

					hour1 = scheduleArray[i][4];
					min1 = scheduleArray[i][5];
					
					if(selectedDate - scheduleDate === 0){
						if(hour - hour1 === 0){
							morningSession = false;
							afternoonSession = false;
							return false;
						}
						else if(morningSession){
							if((hour1 >= 8) && (hour1 <= 12)){
								morningSession = false;
								afternoonSession = false;
								return false;
							}
						}
						else if(afternoonSession){
							if((hour1 >= 1) && (hour1 <= 6)){
								morningSession = false;
								afternoonSession = false;
								return false;
							}
						}
					}
				}
				else{
					if(morningSession){
						if((hour1 >= 8) && (hour1 <= 12)){
							morningSession = false;
							afternoonSession = false;
							return false;
						}
					}
					else if(afternoonSession){
						if((hour1 >= 1) && (hour1 <= 6)){
							morningSession = false;
							afternoonSession = false;
							return false;
						}
					}
				}
			}
			return true;
		}, "This vehicle is unavailable for delivery.");
		jQuery.validator.addMethod("checkName", function(value, element) {
			var name = "";
			  <%for(int i=0;i<beneficiaryArr.size();i++){%>
			  	if(value == "<%= beneficiaryArr.get(i).getName() %>"){
			  		name = value;
			  	}
			  <%}%>
			  return this.optional(element) || value == name;
		}, "This name does not exists.");
		jQuery.validator.addMethod("checkStatus", function(value, element) {
			var status = $(".vehicleStatus").text();
			var vehicleNo = $("#vehicleNo").text();
			<%for(int i=0;i<vehicleArr.size();i++){%>
			  	if(vehicleNo === "<%= vehicleArr.get(i).getVehicleNo() %>" ){
			  		if(status == "Maintenance"){
			  			return false;
			  		}
			  	}
			  <%}%>
			  return true;
		}, "This vehicle is under maintainenance.");
		$("#createDeliveryScheduleForm").validate({
			ignore: [],
		    rules: {
		    	beneficiaryName: {
		    		required: true,
		    		checkName: "",
		    	},
		    	vehicleNo: {
		            required:true,
		            checkVehicleIsAvailable: "",
		            checkStatus: "",
		        },
				packingListID: {
		            required:true,
		        },		
		        date: {
		        	required: true,
		        	date: true,
		        	checkDate: "",
		        },
		        time12h: {
		        	required: true,
		        	time12h: true,
		        },
		    },
		});
		
		var handleFileSelect = function(evt) {
		    var files = evt.target.files;
		    var file = files[0];

		    if (files && file) {
		        var reader = new FileReader();
		        reader.onload = function(readerEvt) {
		            var binaryString = readerEvt.target.result;
		            var fileName = document.getElementById('uploadBtnExcel').value.substr(12,document.getElementById('uploadBtnExcel').value.length);
		            var fileExtension = fileName.substr(fileName.length-5,5);
		            if(fileExtension === ".xlsx"){
		            	document.getElementById("excelPathBase64").value = btoa(binaryString);
						$(".uploadBtnExcelSubmit").click();
		            }
		            else{
		            	alert("Invalid file format. Please select another file.");
		            	return;
		            }
		        };
		        reader.readAsBinaryString(file);
		    }
		};

		if (window.File && window.FileReader && window.FileList && window.Blob) {
		    document.getElementById('uploadBtnExcel').addEventListener('change', handleFileSelect, false);
		} 
		else {
		    alert('The File APIs are not fully supported in this browser.');
		}
		
		$(".uploadBtnExcel").click(function(e){
			$("#uploadBtnExcel").click();
		});
		$("#copyExistingSchedule").click(function(e){
			<% if(deliveryScheduleArr.size() <= 0){ %>
				alert("No schedule to copy");
				e.preventDefault();
			<% } %>
		});
	});
</script>
</head>
<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		<div class="bodywithoutSide">
			<h3>Create Delivery Schedule</h3>
			<div id="calendar">
			</div>
			<form action="readingExcelFile" method="post" enctype="multipart/form-data" >
				<input type="file" name="excelPathName" id="uploadBtnExcel" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/>
				<button class="uploadBtnExcelSubmit" style="display:none;"></button>
				<input type="hidden" name="excelPathBase64" id="excelPathBase64"/>
			</form>
			<h4> 1) Choose 1 option below: </h4>
			<br/>
			<div class="addtionalButtonCol">
				<form action="copyFromExistingScheduleServlet" method="post" style="width:165px;display:inline-block;margin-left:5px;">
					<button id="copyExistingSchedule"> Copy </button>
				</form>
				<button class="uploadBtnExcel" formaction="#" type="button"> Upload </button>
			</div>
			<p> - or - </p>
			<h4> 2) Fill in the details below: </h4>
			<fieldset style="width:550px;">
				<legend><h4> Schedule Information </h4></legend>
				<form method="post" action="createDeliveryScheduleServlet" id="createDeliveryScheduleForm">
					<table class="scheduleTable" cellspacing="0" cellpadding="0">
						<tr>
							<td width="150">Name of beneficiary:</td>
							<td>
								<input list="beneficiaryNames" name="beneficiaryName" class="beneficiaryName">
								<datalist id="beneficiaryNames">
								<%for(int i=0;i<beneficiaryArr.size();i++){ %>
									<option value="<%= beneficiaryArr.get(i).getName() %>"><%= beneficiaryArr.get(i).getName() %></option>
								<%} %>
							</datalist></td>
						</tr>
						<tr>
							<td>Description:</td>
							<td><textarea name="desc" id="desc" cols="17" class="required"></textarea></td>
						</tr>
						<tr>
							<td>Status:</td>
							<td><select id="status" name="status">
									<option value="Confirmed Order">Confirmed Order</option>
									<option value="Packing">Packing</option>
									<option value="Pending for Delivery">Pending for
										Delivery</option>
									<option value="Delivering">Delivering</option>
									<option value="Delivered">Delivered</option>
							</select></td>
						</tr>
						<tr>
							<td>Date:</td>
							<td><input type="text" name="date" id="date" class="date" readonly/></td>
						</tr>
						<tr>
							<td>Time:</td>
							<td><input type="text" name="time" id="time12h" class="time12h" required readonly/><img src="image/clock.gif" width="15" height="15" id="clockpick2" /></td>
						</tr>
						<!-- Retrieve Packing list -->
						<tr>
							<td>Packing List:</td>
						</tr>
						<tr class="selectedList">
							<td colspan='2' id="packingListAdd">
							<fieldset style="width:255px;">
								<legend><h4> Packing List Information </h4></legend>
									<table>
										<tbody id="packingListInfo">
											<tr><td><b class="packingListID"></b></td></tr>
											<tr><td> Location: </td><td id="eventLocation"></td></tr>
											<tr><td> Type: </td><td id="eventType"></td></tr>
											<tr><td> Amount of Bags: </td><td id="amountOfBags" class="amountOfBags"></td></tr>
										</tbody>				
										<tbody id="noPackingListInfo">
											<tr><td><p> There is no packing list selected. </p></td></tr>
										</tbody>	
										<tbody>
											<tr class="selectList">
												<td colspan='2'><button id="selectListbn" type="button" formaction="#">Select Packing List</button><input type="hidden" name="packingListID" id="packingListID" class="packingListID"/></td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</td>
						</tr>
						<!-- Allocate Vans -->
						<tr class="allocated"><td colspan='2' id="vehicleAdd">
							<fieldset style="width:255px;">
								<legend><h4> Vehicle Information </h4></legend>
								<table>
									<tbody id="vehicleInfo">
										<tr><td><b class="vehicleNo"></b></td></tr>
										<tr><td> Model: </td><td id="model"></td></tr>
										<tr><td> Weight: </td><td id="weight"></td></tr>
										<tr><td> Status: </td><td id="status" class="vehicleStatus"></td></tr>
										<tr><td> Type: </td><td id="type"></td></tr>
									</tbody>				
									<tbody id="noVehicleInfo">
										<tr><td><p> There is no vehicle allocated. </p></td></tr>
									</tbody>					
									<tr class="notAllocated"><td colspan='2'><button id="allocateVan" type="button"formaction="#">Allocate Vehicle</button><input type="hidden" name="vehicleNo" id="vehicleNo" class="vehicleNo"/></td></tr>
								</table>
							</fieldset>
						</td></tr>
						<tr class="space"><td></td></tr>
					</table>
				</fieldset>
				<br/>
				<input type="Submit" name="submit" id="submitBtn" value="Submit" />
				<div class="buttonCol0">
					<a href="manageDeliverySchedule.jsp"><button type="button" formaction="#">Cancel</button></a>
				</div>
			</form>
		</div>
		<%@ include file="footer.html"%>
	</div>
</body>
</html>
