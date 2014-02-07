<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Beneficiary</title>
<!-- The import of package and get all method from database -->
<%@ include file="includeFile.jsp" %>
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!--  Validation  -->
<link rel="stylesheet" type="text/css" href="css/validation/screen.css" />
<link rel="stylesheet" type="text/css" href="css/validation/cmxform.css" />
<script src="javascript/validation/form-validate.js"></script>
<script src="javascript/validation/additional-methods.js"></script>
<%
	int beneficiaryID = Integer.parseInt(request.getParameter("id"));
	Beneficiary beneficiary = beneficiaryManager.getBeneficiary(beneficiaryID);
%>
<script type="text/javascript">
	$(document).ready(function(){
		<%if(beneficiary instanceof School){%>
		$('input[name=typeOfBeneficiary][value=school]').attr('checked', true);
		<%}
		else if(beneficiary instanceof Self_Collection_Centre){
		%>
		$('input[name=typeOfBeneficiary][value=selfCollectionCentre]').attr('checked', true);
		<%}%>
		var isSelfCollectionCentre = $('#selfCollectionCentre').is(":checked");
		if(isSelfCollectionCentre){
			$(".selfCollectionCentreInformation").show();
			$(".schoolInformation").hide();
		}
		else{
			$(".selfCollectionCentreInformation").hide();
			$(".schoolInformation").show();
		}
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
			  <%for(int i=0;i<beneficiaryManager.getAllBeneficiarys().size();i++){%>
			  	if(value == "<%= beneficiaryManager.getAllBeneficiarys().get(i).getName() %>"){
			  		if(value != "<%= beneficiary.getName() %>"){
				  		name = value;	
			  		}
			  	}
			  <%}%>
			  return this.optional(element) || value != name;
			}, "Please provide another name.");
		$("#updateBeneficiaryForm").validate({
			  rules: {
				    name: {
				      required: true,
				      checkName: "",
				    }
			  }
		});
		$("#cancelBtn").click(function(){
			parent.history.back();
		});
	});
</script>
</head>
<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		<div class="bodywithoutSide">
			<h3>Update Beneficiary</h3>
			<h4> Fill in the details below: </h4>
			<fieldset style="width:550px;">
				<legend><h4> Beneficiary Information </h4></legend>
				<form method="post" action="updateBeneficiaryServlet" enctype="multipart/form-data" id="updateBeneficiaryForm">
					<input type="hidden" name="beneficiaryID" value=<%= beneficiaryID %>/>
					<table class="updateBeneficiaryTable">
						<thead>
							<tr><td>Type of Beneficiary: </td><td><input type="radio" name="typeOfBeneficiary" id="selfCollectionCentre" value="selfCollectionCentre" disabled/> Self-Collection Centre<input type="radio" name="typeOfBeneficiary" id="school" value="school" disabled/>School</td></tr>
						</thead>
					</table>
					<fieldset class="requiredInformation" style="width:550px;">
						<legend><h4> Required Information </h4></legend>
						<table>
							<tr><td></td></tr>
							<tr><td>Name: </td><td><input type="text" name="name" class="name" value="<%= beneficiary.getName() %>"/></td></tr>
							<tr><td>Address: </td><td><textarea name="address" class="required"><%= beneficiary.getAddress() %></textarea></td></tr>
							<tr><td>Number of beneficiary: </td><td><input type="number" name="numberOfBeneficiary"  min="1" max="1000" step="1" class="required" value="<%= beneficiary.getNumberOfBeneficiary() %>"/></td></tr>
							<tr><td>Profile Image: </td><td><input type="file" name="img" id="uploadBeneficiaryImg" accept="image/*"/></td></tr>
							<tr><td colspan='2'><input type="image" name="beneficiaryImage" id="beneficiaryImage"  src="image/beneficiaryProfileImage/<%= beneficiary.getImage() %>" width="240" height="100"/></td></tr>
						</table>
					</fieldset>
					<fieldset class="selfCollectionCentreInformation" style="width:550px;">
						<legend><h4> Contact Information </h4></legend>
						<table>
							<tr><td></td></tr>
							<% if(beneficiary instanceof Self_Collection_Centre){ %>
							<tr><td>Name: </td><td><input type="text" name="contactName" class="required" value="<%= ((Self_Collection_Centre)beneficiary).getContactName() %>"/></td></tr>
							<tr><td>Email: </td><td><input type="email" name="contactEmail" class="required" value="<%= ((Self_Collection_Centre)beneficiary).getContactEmail() %>"/></td></tr>
							<tr><td>Phone Number: </td><td><input type="text" name="contactPhone" class="required" value="<%= ((Self_Collection_Centre)beneficiary).getContactPhone() %>" pattern="^[0-9]{8}$"/></td></tr>
							<% } %>
						</table>
					</fieldset>
					<fieldset class="schoolInformation" style="width:550px;">
						<legend><h4> School Information </h4></legend>
						<table>
							<tr><td></td></tr>
							<% if(beneficiary instanceof School){ %>
							<tr><td>Brief Description(Optional):</td><td><textarea name="desc" maxlength="600"><%= ((School)beneficiary).getDescription() %></textarea></td></tr>
							<% } %>
							<tr><td>(Maximum 600 character)</td></tr>
						</table>
					</fieldset>
				</fieldset>
				<br/>
				<input type="Submit" name="submit" id="submitBtn" value="Submit"/>
				<div class="buttonCol2">
					<a href="manageBeneficiary.jsp"><button id="cancelBtn" type="button" formaction="#"> Cancel </button></a>
				</div>
			</form>
		</div>
		<%@ include file="footer.html"%>
	</div>
</body>
</html>