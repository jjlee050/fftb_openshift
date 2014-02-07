<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		
		
		$('#date').datePicker({
	        startDate: '01/01/1900',
	        	defaultDate: '-200m',
	    });
		
		
		//$('#date').datePicker();
	});

});

	 
</script>

</head>
<body>

<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
			
			<div class="body">
			<h2>Sign Up</h2>
				<form method="post" action="createUserServlet"  enctype="multipart/form-data" id="createVolunteerForm">
				<table>
				<tr>
				<td>First name: </td> 
				<td><input type="text" name="Firstname"> </td>
				</tr>
				<tr>
				<td>Last name: </td>
				<td><input type="text" name="lastname" size="20"></td>
				</tr>
				<tr>
				<td>Username: </td>
				<td><input type="text" name="Username" size="20"></td>
				</tr>
				<tr>
				<td>Email: </td>
				<td><input type="text" name="email"> </td>
				</tr>
				<tr>
				<td>Password: </td>
				<td><input type="password" name="pass"> </td>
				</tr>
				<tr>
				<td>Confirm password: </td>
				<td><input type="password" name="confirmPass"> </td>
				</tr>
				<tr>
				<td>Contact number: </td>
				<td><input type="text" name="number"> </td>
				</tr>
				
				<tr>
				<td>Date of birth: </td>
				<td>
				<input type="text" id="date" name="date" required readonly />
				<img src="image/calender.png" width="15" height="15" id="datepick" />
				</td>
				</tr>
				
				<tr>
				<td>Gender: </td>
				<td>
				<input type="radio" name="gender" value="male"> Male
				<input type="radio" name="gender" value="female">Female<br/>
				</td>
				</tr>
				
				<tr>
				<td>Profile picture: </td>
				<td><input type="file" name="profilepic"> </td>				
				</tr>
				
				<tr>
				<td colspan='2'><input type="image" name="userImage" id="userImage"  width="240" height="200"/></td>
				</tr>
						
				
				
				</table>
				<input type="submit" value="submit"/>
				</form>
			</div>
		
		<%@ include file="footer.html" %>
		</div>


</body>
</html>