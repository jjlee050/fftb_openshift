<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.UserManager,ffth.model.User,ffth.model.Volunteer,java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update volunteer details</title>

<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>
<!--  Validation  -->
<link rel="stylesheet" type="text/css" href="css/validation/screen.css" />
<link rel="stylesheet" type="text/css" href="css/validation/cmxform.css" />
<script src="javascript/validation/form-validate.js"></script>
<script src="javascript/validation/additional-methods.js"></script>

<%
	int userID = Integer.parseInt(request.getParameter("id"));
	System.out.println(userID);
	
	UserManager userManager = new UserManager();
	User user = new User();
	user = userManager.getUser(userID);
	
	Volunteer volunteer = new Volunteer();
	volunteer = userManager.getVolunteer(userID);
	
	//Create arraylist
	//UserManager userManager = new UserManager();
	ArrayList<User> userArr = userManager.getAllUsers();
%>

<script type="text/javascript">
	$(document).ready(function(){

		function readURL(input) {
			if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $('#userImage').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		$("#uploadUserImg").change(function(){
			$("#userImage").show();
		    readURL(this);
		});
		
		$("#updateUserForm").validate({
			  rules: {
				    name: {
				      required: true,
				      checkName: "",
				    }
			  }
		});
	});
</script>


</head>
<body>

<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		<div class="bodywithoutSide">
			<h3>Update volunteer details</h3>
				<form method="post" action="updateUserServlet" enctype="multipart/form-data" id="updateUserForm">
					<input type="hidden" name="userID" value=<%= userID %> />
					<table class="updateUserTable">
						<tbody class="requiredInformation">
							<tr><td></td></tr>
							
							<tr><td>Name: </td><td><%= volunteer.getName() %></td></tr>
							<tr><td>Email: </td><td><input type="text" name="email" class="required" value="<%= volunteer.getEmail() %>"/></td></tr>
							<tr><td>Contact number: </td><td><input type="text" name="contactNo" class="required" value="<%= volunteer.getContactNo() %>"/></td></tr>
							<tr><td>Profile Image: </td><td><input type="file" name="img" id="uploadUserImg" accept="image/*"/></td></tr>
							<tr><td colspan='2'><input type="image" name="userImage" id="userImage"  src="image/userProfileImage/<%= user.getImageFile() %>" width="240" height="200"/></td></tr>
						</tbody>
					</table>
					<input type="Submit" name="submit" id="submitBtn" value="Submit"/>
				</form>
				<div class="buttonCol2">
					<a href="main.jsp"><button id="cancelBtn"> Cancel </button></a>
				</div>
		</div>
		<%@ include file="footer.html"%>
	</div>


</body>
</html>