<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="ffth.data.newProductManager" %>
<%@ page import="ffth.model.Food" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/benStyle.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" src="javascript/jquery.cookies.2.2.0.js"></script>
<!-- Date Picker  -->
<script type="text/javascript" src="javascript/datepick.js"></script>
<script type="text/javascript" src="javascript/date.js"></script>
<link rel="stylesheet" href="css/datepick.css" />
<script>
$(document).ready(function(){
    $('#map').append("<img id='mapImg' src='./image/Map/map_default.jpg'/>");
    $("#searchBTN").hide();
   
    $("#type").change(function(){
        $("#mapImg").remove();
        if(this.value != "default"){
        	$("#weightTitle").css("visibility","visible");
        	$("#weight").css("visibility","visible");
            
	        if($('#weight').val()=="default"){
	        	$("#map").append("<img id='mapImg' src='./image/Map/map_" + this.value + ".jpg'/>");
	        }else{
	        	if($('#weight').val()==1){
	         		$("#map").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_1.jpg'/>");
	         	}else if($('#weight').val()==2){
	         		$("#map").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_2.jpg'/>");
	         	}else if($('#weight').val()==3){
	         		$("#map").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_3.jpg'/>");
	     	  	}else if($('#weight').val()==4){
	     	  		$("#map").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_4.jpg'/>");
	     	  	}else if($('#weight').val()==5){
	     	  		$("#map").append("<img id='mapImg' src='./image/Map/map_" + this.value + "_5.jpg'/>");
	     	  	}
	        }
        }else{
        	$('#map').append("<img id='mapImg' src='./image/Map/map_default.jpg'/>");
        	$("#weightTitle").css("visibility","hidden");
        	$("#weight").css("visibility","hidden");
        	$("#searchBTN").hide();
        }
       
        
       
    });
    
	$("#searchBTN").click(
			function() {
				alert("Searching for " + $('#type').val() + " type food of weight " + $('#weight').val());
				setCookie("type",$('#type').val(),3);
				setCookie("weight",$('#weight').val(),3);
				window.open("advancedSearchOption.jsp", '',
						'width=600,height=400,resizable=no');
				window.focus();
			});
    
	
    $("#weight").change(function(){
    	$("#mapImg").remove();
    	$("#searchBTN").show();
    	
    	if($('#type').val() != "default"){
	    	if(this.value==1){
	    		$("#map").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_1.jpg'/>");
	    	}else if(this.value==2){
	    		$("#map").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_2.jpg'/>");
	    	}else if(this.value==3){
	    		$("#map").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_3.jpg'/>");
		  	}else if(this.value==4){
		  		$("#map").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_4.jpg'/>");
		  	}else if(this.value==5){
		  		$("#map").append("<img id='mapImg' src='./image/Map/map_" + $('#type').val() + "_5.jpg'/>");
		  	}else{
		  		$("#map").append("<img id='mapImg' src='./image/Map/map_default.jpg'/>");
		  	};  	
    	}else if($('#type').val() == "default"){
    		$("#map").append("<img id='mapImg' src='./image/Map/map_default.jpg'/>");
    	}
    });
    
    $('#mapImg').on('dragstart', function(event) { event.preventDefault(); });
});

function setCookie(cname,cvalue,exdays)
{
var d = new Date();
d.setTime(d.getTime()+(exdays*24*60*60*1000));
var expires = "expires="+d.toGMTString();
document.cookie = cname + "=" + cvalue + "; " + expires;
}
</script>
<title>Food Allocations</title>
</head>
<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		
		<div class="sideBar">		
				<b>Type</b>
				<br>
				<select id="type">
				  <option value="default">Select a Type</option>
				  <option value="beverages">Beverages</option>
				  <option value="cannedfood">Canned Food</option>
				  <option value="general">General</option>
				</select>
				<br>
				<br>
				
				<b id="weightTitle" style="visibility:hidden;">Weight</b>
				<br>
				<select id="weight" style="visibility:hidden;">
					<option value="default">Select a Weight</option>
					<option value="1">0g - 99g</option>
					<option value="2">100g - 199g</option>
					<option value="3">200g - 299g</option>
					<option value="4">300g - 399g</option>
					<option value="5">400g - 499g</option>
				</select>
				<br>
				<br>
	
				<button type="button" id="searchBTN">Search!</button>
		</div>
		<div class="body">
			<div id="title">Map</div>
			<br>
			<div class="map">
			<div id="map"></div>
			</div>			
		</div>


		<%@ include file="footer.html"%>
	</div>
</body>
</html>