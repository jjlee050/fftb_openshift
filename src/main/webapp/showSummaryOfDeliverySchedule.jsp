<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Show Summary of Delivery Schedule </title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!--  Calendar -->
<link href='css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script type="text/javascript" src='javascript/calendar/fullcalendar.js'></script>
<!-- Lightbox -->
<link rel="stylesheet" type="text/css" href="css/colorbox.css" />
<script type="text/javascript" src="javascript/lightbox/jquery_colorbox.js"></script>
<script>
$(document).ready(function() {
	$(".scheduleInfo").hide();
	$('#summaryCalendar').fullCalendar({
		header: {
			left: 'today',
			center: 'title',
			right: 'month',
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
				<h1> Schedule for this month: </h1>
				<div id="summaryCalendar">
				</div>
			</div>
		<%@ include file="footer.html" %>
</div>
</body>
</html>
