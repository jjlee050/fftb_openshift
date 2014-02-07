<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" src="javascript/datepick.js"></script>
<script type="text/javascript" src="javascript/date.js"></script>
<link rel="stylesheet" href="css/datepick.css" />


<script>
	$(function() {
		$('#date').datePicker();
		$("#advance").click(function() {
			$('.advSearch').css('visibility', 'visible');
		});
	});
</script>
</head>

<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
<Form method="post"  ACTION="FoodServlet">
		<div class="body">
			<h2>Search Food</h2>
			<table>
				<tr>
				
					<td>Name:</td>
					<td><input type="text" name="Name" /></td>
				</tr>
				<tr>
					<td class="advSearch">Type:</td>
					<td class="advSearch"><input type="text" name="Type" /></td>
				</tr>
				<tr>
					<td class="advSearch">Weight:</td>
					
					<td class="advSearch"><select name="Weight">
							<option value="1.0">100 - 199g</option>
							<option value="2.0">200 - 299g</option>
							<option value="3.0">300 - 399g</option>
							<option value="4.0">400 - 499g</option>
					</select></td>
				</tr>
				<tr>
					<td class="advSearch">Expiry Date:</td>
					<td class="advSearch"><input type="text" name="Date" id="date" /></td>
				</tr>
				<tr>
					<td class="advSearch">Vegetarian:</td>
					<td class="advSearch">
					<input type="radio" name="Vegetarian" value="1" />Yes 
					<input type="radio" name="Vegetarian" value="0" />No</td>
				</tr>
				<tr>
					<td class="advSearch">Halal:</td>
					<td class="advSearch"><input type="radio" name="Halal" value="1" />Yes 
					<input type="radio" name="Halal" value="0" />No</td>
				</tr>
				<tr>
					<td class="advSearch">Allergies:</td>
					<td class="advSearch"><select>
							<option name="Allergies" value="Lactose">Lactose</option>
							<option name="Allergies" value="Nut">Nut</option>
							<option name="Allergies" value="Other">Other</option>
					</select></td>
				</tr>

			</table>


			<br> <input type="submit" value="Submit">
			 	 <input type ="button" Value="Cancel"> 
			 	 <input type="button" value="Advanced Search" id="advance">
			 	 
		</div>
</Form>
		<%@ include file="footer.html"%>
	</div>
</body>
</html>