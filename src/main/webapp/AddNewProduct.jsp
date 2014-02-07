<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/benStyle.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>
<!-- Date Picker  -->
<script type="text/javascript" src="javascript/datepick.js"></script>
<script type="text/javascript" src="javascript/date.js"></script>
<link rel="stylesheet" href="css/datepick.css" />
<script>
$(document).ready(function(){		
		$('#date').datePicker({
			onSelect : function(dateText, inst) {
				alert("date is: " + $(this));
			}
		});
		
		$("#type").change(function(){
			$("#mapImg").remove();
			
			if($("#weight").val() == "default"){
		        $("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + ".jpg'/>");
			}else{
				if($("#weight").val() == "0to99"){
					if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_1_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_1_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_1_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_1_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_1.jpg'/>");
			        }
		    	}else if($("#weight").val() == "100to199"){
		    		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_2_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_2_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_2_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_2_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_2.jpg'/>");
			        }
		    	}else if($("#weight").val() == "200to299"){
		    		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_3_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_3_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_3_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_3_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_3.jpg'/>");
			        }
			  	}else if($("#weight").val() == "300to399"){
			  		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_4_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_4_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_4_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_4_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_4.jpg'/>");
			        }
			  	}else if($("#weight").val() == "400to499"){
			  		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_5_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_5_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_5_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_5_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_5.jpg'/>");
			        }
			  	};
			}
	    });
		
		$("#weight").change(function(){
	    	$("#mapImg").remove();
	    	
	    	
    		if($("#type").val() == "default"){
    			$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_default.jpg'/>");
    	    	
	    	}else{
	    		if(this.value == "0to99"){
	    			if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_1_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_1_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_1_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_1_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_1.jpg'/>");
			        }
		    	}else if(this.value == "100to199"){
		    		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_2_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_2_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_2_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_2_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_2.jpg'/>");
			        }
		    	}else if(this.value == "200to299"){
		    		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_3_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_3_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_3_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_3_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_3.jpg'/>");
			        }
			  	}else if(this.value == "300to399"){
			  		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_4_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_4_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_4_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_4_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_4.jpg'/>");
			        }
			  	}else if(this.value == "400to499"){
			  		if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_5_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_5_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_5_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_5_4.jpg'/>");
			        }else{
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_5.jpg'/>");
			        }
			  	}else{
			  		$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_default.jpg'/>");
			  	};
	    	}
	    });
		
		$("input[name=location]:radio").change(function () {
	    	$("#mapImg").remove();
			var locationWeight = null;
			if($('#type').val() != "default"){
				if($("#weight").val() == "default"){
			        $("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + ".jpg'/>");
				}else{
					if($("#weight").val() == "0to99"){
			    		locationWeight = 1;
			    	}else if($("#weight").val() == "100to199"){
			    		locationWeight = 2;
			    	}else if($("#weight").val() == "200to299"){
			    		locationWeight = 3;
				  	}else if($("#weight").val() == "300to399"){
				  		locationWeight = 4;
				  	}else if($("#weight").val() == "400to499"){
				  		locationWeight = 5;
				  	};
				  	
				  	if($("#1").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_"+ locationWeight +"_1.jpg'/>");
			        }else if($("#2").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_"+ locationWeight +"_2.jpg'/>");
			        }else if($("#3").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_"+ locationWeight +"_3.jpg'/>");
			        }else if($("#4").attr("checked")){
			        	$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_"+ locationWeight +"_4.jpg'/>");
			        }
				}
			}else{
				$("#mapForViewing").append("<img id='mapImg' src='./image/Map/map_default.jpg'/>");
			}
	    });
		
		$("#allergies").change(function(){
			if(this.value != "other"){
				$("#otherTitle").css("visibility","hidden");
				$("#allergiesText").css("visibility","hidden");
			}else{
				$("#otherTitle").css("visibility","visible");
				$("#allergiesText").css("visibility","visible");
			}
		});
	});
</script>
<title>Registering New Product</title>
</head>
<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>

		<div class="bodywithoutSide">
			<div id="title">Registering New Product</div>
			<form class="registerProduct" method="post" action="createNewProductServlet">
					<table cellpadding="7" style="float:left;">
					<tr>
						<td>Food Name:</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>Type:</td>
						<td><select id="type" name="type">
								<option value="default">Please choose a Type</option>
								<option value="beverages">Beverages</option>
								<option value="cannedfood">Canned Food</option>
								<option value="general">General Food</option>
						</select></td>
					</tr>
					<tr>
						<td>Weight:</td>
						<td><select id="weight" name="weight">
								<option value="default">Please select a Weight</option>
								<option value="0to99">0g - 99g</option>
								<option value="100to199">100g - 199g</option>
								<option value="200to299">200g - 299g</option>
								<option value="300to399">300g - 399g</option>
								<option value="400to499">400g - 499g</option>
						</select></td>
					</tr>
					<tr>
						<td>Location:</td>
						<td>
							<input type="radio" name="location" id="1" value="1">1
							<input type="radio" name="location" id="2" value="2">2
							<input type="radio" name="location" id="3" value="3">3
							<input type="radio" name="location" id="4" value="4">4		
						</td>
					</tr>
					<tr>
						<td>Date Of Donation:</td>
						<td><input type="text" name="date" id="date" value="Select Date ---->" style="font-family:arial; font-style:italic;" readonly/></td>
					</tr>
					<tr>
						<td>Vegetarian:</td>
						<td><input type="radio" name="vegetarian" value="Yes">Yes
							&nbsp; <input type="radio" name="vegetarian" value="No">No</td>
					</tr>
					<tr>
						<td>Halal:</td>
						<td><input type="radio" name="halal" value="Yes">Yes
							&nbsp; <input type="radio" name="halal" value="No">No</td>
					</tr>
					<tr>
						<td>Allergies:</td>
						<td><select id="allergies" name = "allergies">
								<option value="None">None</option>
								<option value="lactose">Lactose</option>
								<option value="nut">Nut</option>
								<option value="other">Other</option>
						</select>
						</td>
					</tr>
					<tr>
						<td><p id="otherTitle" style="visibility:hidden;">If Other, please specify</p></td>
						<td><input type="text" name="allergiesText" id="allergiesText" style="visibility:hidden;"></td>
					</tr>
				</table>
				<div id="mapForViewing"><img id='mapImg' src='./image/Map/map_default.jpg'/></div>
				<br>
				<div class="buttons">
					<input type="submit" name="submit" value="Submit">
					<button value="Cancel">Cancel</button>
				</div>
			</form>
		</div>


		<%@ include file="footer.html"%>
	</div>
</body>
</html>