<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.BeneficiaryManager,ffth.model.Beneficiary,java.util.*"
    import="ffth.data.JobManager, ffth.model.Job, java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@include file="loginInformation.jsp" %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobs available</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css"/>

<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/numberSort.js"></script>

<script>


</script>

<% 
	JobManager jobManager = new JobManager();
	ArrayList<Job> jobArr = jobManager.getAllJobs();
	
	String theUsername = String.valueOf(session.getAttribute("savedUserName"));
	System.out.println(theUsername);
	
 %>
<script>
 $(document).ready(function() {
	$('.manageJobTable').dataTable({
		 "bJQueryUI": true,
	     "sPaginationType": "full_numbers",
	     "aoColumns": [
	                   { "sType": "natural" },
	                   null,
	                   null,
	                   null,
	                   null,
	                   null,
	                   null
	               ]
	});
}); 
</script>
</head>
<body>
<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
		
		<%! String name="theName"; %>
		
			<div class="sideBar"></div>
			<div class="body">
				<h1> Volunteer Jobs available </h1>
				<a href="createJob.jsp"><button class="createJob"> Create Job </button></a>
				<hr/>
				<table class="manageJobTable">
					<thead>
						<tr><td>Job ID </td><td> Job title </td><td> Date </td><td> Start Time </td><td> End Time </td><td> Slots </td><td> Description </td></tr>
					</thead>
					<tbody>
					 	<% for(int i=0;i<jobArr.size();i++){ %>
						<tr><td><a href="viewJobDetails.jsp?id=<%= jobArr.get(i).getJobID() %>"><%= jobArr.get(i).getJobID() %></a></td><td><%= jobArr.get(i).getType() %></td><td><%= jobArr.get(i).getDate() %></td><td><%= jobArr.get(i).getStartTime() %></td><td><%= jobArr.get(i).getEndTime() %></td><td><%= jobArr.get(i).getSlot() %></td><td><%= jobArr.get(i).getDescription() %></td></tr>
						<% } %>
					</tbody>
				</table>
			</div>
		
		<%@ include file="footer.html" %>
		</div>
</body>
</html>