<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.*,ffth.model.*,java.util.*"
    import="ffth.model.Volunteer,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job details</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="javascript/jquery.js"></script>

<%
JobManager jobManager = new JobManager();

int jobIDPassed = Integer.parseInt(request.getParameter("id"));
Job job = new Job();	
job = jobManager.getJob(jobIDPassed);

//Display beneficiary
int scheduleID = job.getScheduleID();
Beneficiary beneficiary = new Beneficiary();
BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
beneficiary = beneficiaryManager.getBeneficiary(scheduleID);

//user stuff
String theUsername = String.valueOf(session.getAttribute("savedUserName"));
System.out.println(theUsername);

int userID = 0;

boolean login = false;
if (theUsername.equals("null")){
	System.out.println("not logged in");
	login = false;	
}
else{
	UserManager userManager = new UserManager();
	userID = userManager.getUserID(theUsername).getUserID();
	login = true;
}

//Check if booked
System.out.println(userID);
System.out.println(jobIDPassed);
boolean booked = jobManager.checkBooked(userID, jobIDPassed);
System.out.println("Booked = " + booked);

 %>
 
 <script type="text/javascript"> 	
  	
 $(document).ready(function(){
	if (<%=login%> == false){
		alert("not logged in");
		document.getElementById('bookButton').disabled = true;
		document.getElementById('slotLabel').innerHTML = "Please login to book a volunteer job";	
		document.getElementById('slotLabel').style.color = "red";
	}
		
	else if (<%=job.getSlot() %> == 0){
		document.getElementById('bookButton').disabled = true;
		document.getElementById('slotLabel').innerHTML = "Sorry, out of slots";
		document.getElementById('slotLabel').style.color = "red";
	}
	
	else if (<%=booked %> == true){
		document.getElementById('bookButton').disabled = true;
		document.getElementById('slotLabel').innerHTML = "You have already booked this job";
		document.getElementById('slotLabel').style.color = "red";
	}
		
		//IF ALREADY BOOKED

	
});

 
 </script>


</head>
<body>
	<div class="menu">
	
	<%! String name="theName"; %>
	
		&nbsp;
		<%@ include file="header.html" %>
		<%@ include file="loginInformation.jsp" %>
			
			<div class="body">
			
			<form action="createBookRecordServlet" method="post">
			
			<input type="hidden" name="job" value="<%=jobIDPassed%>" />
			<input type="hidden" name="user" value="<%=userID%>" />
			
			<h2><%=job.getType() %></h2>
			<table>
			<tr>
			<td>Date: </td>
			<td><%=job.getDate() %></td>
			</tr>
			<tr>
			<td>Time: </td>
			<td><%=job.getStartTime() %> to <%=job.getEndTime() %></td>
			</tr>
			<tr>
			<td>Slots left: </td>
			<td><%=job.getSlot() %></td>
			
			<tr>
			<td>Job description: </td>
			<td><%=job.getDescription() %></td>
			</tr>
			
			<tr>
			<td>Beneficiary name: </td>
			<td><%=beneficiary.getName() %></td>
			</tr>
			
			<tr>
			<td>Image</td>
			<td><img src="image/beneficiaryProfileImage/<%= beneficiary.getImage() %>" width="250" height="100"/></td>
			</tr>
			
			<tr>
			<td><a href="#" onclick="history.go(-1);return false;"><button>Back</button></a></td>
			<td><input type="submit" value="Help out" id="bookButton"/> <label id="slotLabel"></label></td>
			</tr>
			
			</table>
			
			</form>
			
			</div>
		
		
		<%@ include file="footer.html" %>
		</div>

</body>
</html>