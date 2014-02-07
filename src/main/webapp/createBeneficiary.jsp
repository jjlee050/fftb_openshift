<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Beneficiary</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!--  Validation  -->
<link rel="stylesheet" type="text/css" href="css/validation/screen.css" />
<link rel="stylesheet" type="text/css" href="css/validation/cmxform.css" />
<script src="javascript/validation/form-validate.js"></script>
<script src="javascript/validation/additional-methods.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".selfCollectionCentreInformation").show();
		$(".schoolInformation").hide();
		$("#selfCollectionCentre").click(function(){
			$(".selfCollectionCentreInformation").show();
			$(".schoolInformation").hide();
		});
		$("#school").click(function(){
			$(".selfCollectionCentreInformation").hide();
			$(".schoolInformation").show();
		});
		$("#beneficiaryImage").hide();
		function readURL(input) {
			if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $('#beneficiaryImage').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		$("#uploadBeneficiaryImg").change(function(){
			$("#beneficiaryImage").show();
		    readURL(this);
		});
		jQuery.validator.addMethod("checkName", function(value, element) {
			var name = "";
			  <%for(int i=0;i<beneficiaryArr.size();i++){%>
			  	if(value == "<%= beneficiaryArr.get(i).getName() %>"){
			  		name = value;
			  	}
			  <%}%>
			  return this.optional(element) || value != name;
		}, "Please provide another name.");
		$("#createBeneficiaryForm").validate({
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
			<input type="hidden" name="test" value=""/>
			<h3>Create Beneficiary</h3>
			<h4> Fill in the details below: </h4>
			<fieldset style="width:550px;">
				<legend><h4> Beneficiary Information </h4></legend>
				<form method="post" action="createBeneficiaryServlet"  enctype="multipart/form-data" id="createBeneficiaryForm">
					<table class="createBeneficiaryTable">
						<thead>
							<tr><td>Type of Beneficiary: </td><td><input type="radio" name="typeOfBeneficiary" id="selfCollectionCentre" value="selfCollectionCentre" checked/> Self-Collection Centre<input type="radio" name="typeOfBeneficiary" id="school" value="School"/>School</td></tr>
						</thead>
					</table>
					<fieldset class="requiredInformation" style="width:550px;">
						<legend><h4> Required Information </h4></legend>
						<table>
							<tr><td></td></tr>
							<tr><td>Name: </td><td><input type="text" name="name" id="name" class="name"/></td></tr>
							<tr><td>Address: </td><td><textarea name="address" class="required"></textarea></td></tr>
							<tr><td>Number of beneficiary: </td><td><input type="number" name="numberOfBeneficiary"  min="1" max="1000" step="1" class="required"/></td></tr>
							<tr><td>Profile Image: </td><td><input type="file" name="img" id="uploadBeneficiaryImg" class="required" accept="image/*"/></td></tr>
							<tr><td colspan='2'><input type="image" name="beneficiaryImage" id="beneficiaryImage"  width="240" height="100"/></td></tr>
						</table>
					</fieldset> 
					<fieldset class="selfCollectionCentreInformation" style="width:550px;">
						<legend><h4> Contact Information </h4></legend>
						<table>
							<tr><td></td></tr>
							<tr><td>Name: </td><td><input type="text" name="contactName" class="required"/></td></tr>
							<tr><td>Email: </td><td><input type="email" name="contactEmail" class="required"/></td></tr>
							<tr><td>Phone Number: </td><td><input type="text" name="contactPhone" class="required" pattern="^[0-9]{8}$"/></td></tr>
						</table>
					</fieldset>
					<fieldset class="schoolInformation" style="width:550px;">
						<legend><h4> School Information </h4></legend>
						<table>
							<tr><td></td></tr>
							<tr><td>Brief Description(Optional):</td><td><textarea name="desc" maxlength="600"></textarea></td></tr>
							<tr><td>(Maximum 600 character)</td></tr>
						</table>
					</fieldset>
				</fieldset>
				<br/>
				<input type="Submit" name="submit" id="submitBtn" value="Submit"/>
				<div class="buttonCol2">
					<a href="manageBeneficiary.jsp"><button type='button' formaction='#'> Cancel </button></a>
				</div>
			</form>
		</div>
		<%@ include file="footer.html"%>
	</div>
</body>
</html>