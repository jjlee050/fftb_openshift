<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>

<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
			
			<div class="body">
			<h2>Sign Up</h2>
				<form>
				<table>
				<tr>
				<td>First name: </td> 
				<td><input type="text"> </td>
				</tr>
				<tr>
				<td>Last name: </td>
				<td><input type="text" size="20"></td>
				</tr>
				<tr>
				<td>NRIC: </td>
				<td><input type="text" size="20"></td> 
				</tr>
				<tr>
				<td>Email: </td>
				<td><input type="text"> </td>
				</tr>
				<tr>
				<td>Address: </td>
				<td><input type="text"> </td>
				</tr>
				<tr>
				<td>Password: </td>
				<td><input type="password"> </td>
				</tr>
				<tr>
				<td>Confirm password: </td>
				<td><input type="password"> </td>
				</tr>
				<tr>
				<td>Contact number: </td>
				<td><input type="text"> </td>
				</tr>
				<tr>
				<td>Date of birth: </td>
				<td>
				<input type="text" size=2 placeholder="Day"/>
				<select>
				<option value="nil">Please select</option>
				<option value="Jan">January</option>
				<option value="Feb">February</option>
			    <option value="March">March</option>
				<option value="April">April</option>
				<option value="May">May</option>
				<option value="June">June</option>
				<option value="July">July</option>
				<option value="Aug">August</option>
				<option value="Sep">September</option>
				<option value="Oct">October</option>
				<option value="Nov">November</option>
				<option value="Dec">December</option>
				</select>
				<input type="text" size=5 placeholder="Year"> <br/>
				</td>
				</tr>
				
				<tr>
				<td>Gender: </td>
				<td>
				<input type="radio" name="gender" value="male"> Male
				<input type="radio" name="gender" value="female">Female<br/>
				</td>
				</tr>
				
				</table>
				<input type="submit" value="submit"/>
				</form>
			</div>
		
		
		<%@ include file="footer.html" %>
		</div>


</body>
</html>