<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ffth.model.*,java.util.*,ffth.data.FoodManager,ffth.data.FoodAllergiesManager,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css"/>
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css"/>
<script type="text/javascript" language="javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<%
	
   System.out.println(request.getParameter("name"));
	FoodManager foodManager = new FoodManager();
	FoodAllergiesManager foodAllergiesManager = new FoodAllergiesManager();
    Food food = new Food();
    String name = request.getParameter("Name");
    System.out.println(name);
	Food_Allergies allergies = new Food_Allergies();
	
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat stf = new SimpleDateFormat("h:mm a");
 %>
<script>
$(document).ready(function() {
	$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
	{
	    return {
	        "iStart":         oSettings._iDisplayStart,
	        "iEnd":           oSettings.fnDisplayEnd(),
	        "iLength":        oSettings._iDisplayLength,
	        "iTotal":         oSettings.fnRecordsTotal(),
	        "iFilteredTotal": oSettings.fnRecordsDisplay(),
	        "iPage":          oSettings._iDisplayLength === -1 ?
	            0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
	        "iTotalPages":    oSettings._iDisplayLength === -1 ?
	            0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
	    };
	};
	var page = parseInt(0);
	$('.test').dataTable({
		 "bJQueryUI": true,
	     "sPaginationType": "full_numbers",
	   	 "fnDrawCallback": function () {
	    		 page = this.fnPagingInfo().iPage+1;
	     }
	});
	$(".selectBtn").click(function() {
		var rowIndex = parseInt($('table input:radio:checked').val());
		rowIndex += 1;
		var correctRowIndex = (page * 10) - (((page*10)-10) + ((page * 10) - rowIndex)) ;
		var weight = "";
		var type = "";
		var ItemName="";
		//alert(getCookie("type"));
		var id=getCookie("type");
		var insertBeforeId=" ";
		if(id=="#beverages"){
			insertBeforeId="#cannedFoodHead";
		}
		else if(id=="#cannedFood"){
			insertBeforeId="#generalFoodHead";
		}
		else if(id=="#generalFood"){
			insertBeforeId="#end";
		}
		
		if(rowIndex >= 0){
			$('.packingListItem tr:eq('+correctRowIndex+')').each(function() {
				ItemName = $(this).find("td").eq(1).html();
				weight= $(this).find("td").eq(2).html();
			    type = $(this).find("td").eq(3).html();
			    quantity = $(this).find("td:eq(4) input").val();
			});
			jQuery.fn.doesExist = function(){
		        return jQuery(this).length > 0;
		 };
			if($(window.opener.document).find(id+"Default").doesExist()){
				//alert(inserBeforeId);
				$("<tr><td>"+ ItemName +" "+weight+" x"+quantity+"</td><td>"+ ItemName +" "+weight+" x"+quantity+"</td></tr>").insertBefore($(window.opener.document).find(insertBeforeId));
				$(window.opener.document).find(id+"Default").remove();
				$(window.opener.document).find(id+"Default").remove();
			}
			else{
				$("<tr><td>"+ ItemName +" "+weight+" x"+quantity+"</td><td>"+ ItemName +" "+weight+" x"+quantity+"</td></tr>").insertBefore($(window.opener.document).find(insertBeforeId));
			}
			
			
			window.close();
			setCookie("type","",-1);
		}
		else{
			alert("Please select a Item.");
		}
	});
});
</script>
</head>
<body>

		

		&nbsp;
		<%@ include file="header.html"%>
		
		<div class="body">
			<h2>Search Food Result</h2>
			
			<table class="test" >
			<thead>
			<tr>
					<td class="radioBtn"></td>
					<td> Name </td>
					<td> Type </td>
					<td> Weight </td>
					<td> Expiry Date </td>
					<td> Vegetarian</td>
					<td> Halal </td>
					<td> Allergies </td>
			</tr>
			</thead>
			<tbody>
					<tr>
							<td class="radioBtn"></td>
							<td id="Name"><%= food.getName() %></td>
							<td id="Type"><%= food.getType() %></td>
							<td id="Weight"><%= food.getWeight() %></td>
							<td id="Expiry Date"><%= food.getExpiryDate() %></td>
							<td id="Vegetarian"><%= food.getVegetarian() %></td>
							<td id="Halal"><%= food.getHalal() %></td>
							<td id="Allergies"><%= food.getFoodAllergiesArrList().size() %></td>
					</tr>
       		</tbody>
      </table>

		<%@ include file="footer.html"%>
	</div>
</body>
</html>