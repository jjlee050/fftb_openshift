<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.*,ffth.model.*,java.util.*,java.text.SimpleDateFormat,java.io.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<jsp:include page="loginInformation.jsp" /> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Job</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>

<!-- Date Picker  -->
<script type="text/javascript" src="javascript/datepick.js"></script>
<script type="text/javascript" src="javascript/date.js"></script>
<link rel="stylesheet" href="css/datepick.css" />

<!-- Clock Pick -->
<script type="text/javascript" src="javascript/clockpick.js"></script>
<link rel="stylesheet" href="css/clockpick.css" />

<!--  Validation  -->
<link rel="stylesheet" type="text/css" href="css/validation/screen.css" />
<link rel="stylesheet" type="text/css" href="css/validation/cmxform.css" />
<script src="javascript/validation/form-validate.js"></script>
<script src="javascript/validation/additional-methods.js"></script>

<script>

$(function() {
	
	$(function() {
		$('#date').datePicker();
	});
	
	$("#clockpick1").clockpick({
		valuefield : 'timeStart',
		layout : 'horizontal'
	});
	
	$("#clockpick2").clockpick({
		valuefield : 'timeEnd',
		layout : 'horizontal'
	});
	
	
	var width = $(".menu").width();
	$("#selectSchedule").click(
			function(e) {
				window.open("selectSchedule.jsp", '',
						'width='+width+',height=500,resizable=no');
				window.focus();
	});

});

/* 	function validation(){
		var errorMsg = "";
		
		if(document.getElementById('title').value == ""){
			errorMsg += "Please enter the job title \n";
			document.getElementById('title').style.bordercolor = "red";
		}
		
		if(document.getElementById('date').value == ""){
			errorMsg += "Please enter the date of the job \n";
			document.getElementById('date').style.bordercolor = "red";
		}
		
		if(document.getElementById('startTime').value == ""){
			errorMsg += "Please enter the start time of the job \n";
			document.getElementById('startTime').style.bordercolor = "red";
		}
		
		if(document.getElementById('endTime').value == ""){
			errorMsg += "Please enter end time of the job \n";
			document.getElementById('endTime').style.bordercolor = "red";
		}
		
		if(document.getElementById('volunteersNeeded').value == ""){
			errorMsg += "Please enter the number of volunteers needed for the job \n";
			document.getElementById('volunteersNeeded').style.bordercolor = "red";
		}
		
		if(document.getElementById('desc').value == ""){
			errorMsg += "Please enter the description of the job \n";
			document.getElementById('desc').style.bordercolor = "red";
		}
		
		if(errorMsg != ""){	
			alert(errorMsg);
			return false;
		}
	}
	 */
	
	
	 
</script>

</head>
<body>
<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>

			<div class="body">
			<h2>Create Job</h2>
				<form action="createJobServlet" method="post" onsubmit="return validation()">
				<table>
				
				<tr>
				<td>
				<button id="selectSchedule" type="button" formaction="#">Select schedule</button>
				</td>
				</tr>
				
				
				<tr>
				<td>Schedule ID: </td> 
				<td>
				<input type="text" id="scheduleID" readonly required > 
				<input type="hidden" id="scheduleID" name="scheduleID" class="scheduleID"/>
				</td>
				</tr>
				
				<tr>
				<td>Beneficiary name: </td> 
				<td>
				<input type="text" id="beneficiaryName" readonly > 
				</td>
				</tr>
				
				<tr>
				<td>Delivery date: </td> 
				<td>
				<input type="text" id="deliveryDate" readonly > 
				</td>
				</tr>
				
				<tr><td></td><td></td></tr>
				
				
				<tr>
				<td>Title: </td> 
				<td><input type="text" id="jobTitle" name="title"> </td>
				</tr>
				<tr>
				<td>Date: </td>
				<td><input type="text" id="date" name="date" required readonly><img src="image/calender.png" width="15" height="15" id="datepick" /></td>
				</tr>
				<tr>
				<td>Start time: </td>
				<td><input type="text" name="timeStart" id="time12h" class="time12h" required readonly><img src="image/clock.gif" width="15" height="15" id="clockpick1" /></td> 
				</tr>
				<tr>
				<td>End time </td>
				<td><input type="text" name="timeEnd" id="time12h" class="time12h" required readonly><img src="image/clock.gif" width="15" height="15" id="clockpick2" /></td>
				</tr>
				<tr>
				<td>Volunteers needed: </td>
				<td><input type="text" id="volunteersNeeded" name="volunteersNeeded"> </td>
				</tr>
				<tr>
				<td>Description: </td>
				<td><textarea rows="10" cols="70" id="desc" name="desc"> </textarea> </td>
				</tr>
				</table>
				<input type="submit" value="submit"/>
				
				<label name="msg" id="msg"></label>
				
				</form>
			</div>
	
		<%@ include file="footer.html" %>
		</div>

</body>
</html>