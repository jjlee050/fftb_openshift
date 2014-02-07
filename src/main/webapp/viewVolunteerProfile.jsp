<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.BeneficiaryManager,ffth.model.Beneficiary,java.util.*"
    import="ffth.data.UserManager,ffth.model.User,java.util.*"
    import="ffth.model.Volunteer,java.util.*"
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>


<%
//int userID = 2;

UserManager userManager = new UserManager();
String namePassed = request.getParameter("username");
int userID = userManager.getUserID(namePassed).getUserID();
	
	User user = new User(); 
	Volunteer volunteer = new Volunteer();
	
	user = userManager.getUser(userID);
	volunteer = userManager.getVolunteer(userID);
 %>

</head>
<body>
<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
		<%@ include file="loginInformation.jsp" %>
		
			<div class="bodywithoutSide">
				<h3>View Profile</h3>
				<table cellpadding="5">
				<tr>
				<td rowspan="7"><img src="image/userProfileImage/<%= user.getImageFile() %>" width="250" height="250"/></td>
				<td><strong>Username:</strong> <%=user.getUserName() %></td>
				</tr>
				<tr>
				
				<td><strong>Name:</strong> <%=volunteer.getName() %></td>
				</tr>
				<tr>
				<td><strong>Gender:</strong> <%=volunteer.getGender() %></td>
				</tr>
				<tr>
				<td><strong>Date of birth:</strong> <%=volunteer.getDateOfBirth() %></td>
				</tr>
				<tr>
				<td><strong>Contact number:</strong> <%=volunteer.getContactNo() %></td>
				</tr>
				<tr>
				<td><strong>Email:</strong> <%=volunteer.getEmail() %></td>
				</tr>
				<tr>
				<td><strong>Joined as volunteer at</strong> <%= volunteer.getDateOfRegistration() %></td>
				</tr>
				
				<tr>
				<td><a href="main.jsp"><button>Back</button></a> <a href="updateVolunteer.jsp?id=<%= userID %>"><button>Edit Profile</button></a> <a href="changePassword.jsp?id=<%= userID %>"><button>Change password</button></a> <a href="viewBookedJobs.jsp?id=<%= userID %>"><button>View Booked Jobs</button></a></td>
				<td>
				
				<form method='post'>
						<input type="hidden" name="userID" value="<%= userID %>"/>
						<button id="deleteBtn">Delete Profile</button>
					</form>
				
				
				</td>
				</tr>
				
				</table>
				
				
				<%-- <div class="editDeleteCol">
					<a href="updateBeneficiary.jsp?id=<%= userID %>"><button>Edit Profile</button></a>
					<form method='post'>
						<input type="hidden" name="beneficiaryID" value="<%= userID %>"/>
						<button id="deleteBtn">Delete Profile</button>
					</form>
				</div> --%>
				
				
				<%-- <div class="profile">
					<img src="image/beneficiaryProfileImage/<%= beneficiary.getImage() %>" width="250" height="100"/>
					<br/>
					<b> <%= beneficiary.getName() %> </b>
					<table class="viewBeneficiaryTable">
						<tbody class="requiredProfile">
							<tr><td>Type: </td><td><%= beneficiary.getType() %></td></tr>
							<tr><td>Address: </td><td><%= beneficiary.getAddress() %></td></tr>
							<tr><td>Number of Beneficiary: </td><td><%= beneficiary.getNumberOfBeneficiary() %></td></tr>
						</tbody>
							
						
					</table>
				</div> --%>
				
			</div>
		
		
		<%@ include file="footer.html" %>
		</div>

</body>
</html>