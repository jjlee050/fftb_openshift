<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="ffth.data.PackingListManager,ffth.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Item</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<% 
	PackingListManager listItemManager = new PackingListManager();
	ArrayList<Food> newFoodArr = new ArrayList<Food>();
	ArrayList<Food> oldFoodArr = listItemManager.getAllFood();
	for(int i=0;i<oldFoodArr.size();i++){
		if(oldFoodArr.get(i).getType().equals(request.getParameter("foodType"))){
			newFoodArr.add(oldFoodArr.get(i));
		}
	}
 %>
<script>
function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}
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
		$(".selectItemTable").dataTable({
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
			
			var name = "";
			var weight = "";
			var quantity = "";
			
			if(rowIndex >= 0){
				$('.selectItemTable tr:eq('+correctRowIndex+')').each(function() {
					name = $(this).find("td").eq(2).html();
				    weight = $(this).find("td").eq(3).html();
				    quantity = $(this).find("td:eq(4) input").val();
				   
				});
				var beverage = "Beverage";
				var cannedFood = "Canned Food";
				var generalFood = "General Food";
				
				if(beverage == "<%= request.getParameter("foodType") %>"){
					
					
					if($(window.opener.document).find("#beveragesDefault").html()!=null){
						$(window.opener.document).find("#beveragesDefault").remove();
						var count=getCookie("beverage");
						$("<tr id='beverages"+count+"' class='beverages'><td>"+name+"<input type='hidden' name='beveragesName' value='"+name+"'></td><td>"+weight+"<input type='hidden' name='beveragesWeight' value='"+weight+"'></td><td><input type='number' style='width:55%;' value='"+quantity+"' class='beveragesQuantity'  min=0 max=99 step=1 name='beveragesQuantity'></td><td><button class='deleteRow' type=button>Delete</button></td></tr>").insertBefore($(window.opener.document).find("#cannedFoodHead"));
						if(quantity == 0){
							$(window.opener.document).find(".beveragesQuantity").attr("value",parseInt(quantity) + 1);
						}
						else{
							$(window.opener.document).find(".beveragesQuantity").attr("value",parseInt(quantity));
						}
						setCookie("beverage",parseInt(count)+1,3);
						//alert(getCookie("beverage"));
					}
					else{
						var counter=getCookie("beverage");
						var listName=" ";
						var listWeight=" ";
						var check=0;
						for(var i=1;i<parseInt(counter)+2;i++){
							listName=$(window.opener.document).find("#beverages"+i).find("td:eq(0) input").val();
							listWeight=$(window.opener.document).find("#beverages"+i).find("td:eq(1) input").val();
							if(listName==name&&listWeight==weight){
								if(quantity==0){
									quantity=1;
								}
								quantity=parseInt(quantity)+parseInt($(window.opener.document).find("#beverages"+i).find("td:eq(2) input").val());
								$(window.opener.document).find("#beverages"+i).find("td:eq(2) input").val(quantity);
								check=1;
								break;
							}
							
						}
						if(check==0){
							$("<tr id='beverages"+counter+"' class='beverages'><td>"+name+"<input type='hidden' name='beveragesName' value='"+name+"'></td><td>"+weight+"<input type='hidden' name='beveragesWeight' value='"+weight+"'></td><td><input type='number' style='width:55%;' value='"+quantity+"' class='beveragesQuantity'  min=0 max=99 step=1 name='beveragesQuantity'></td><td><button class='deleteRow' type=button>Delete</button></td></tr>").insertBefore($(window.opener.document).find("#cannedFoodHead"));
							if(quantity == 0){
								$(window.opener.document).find(".beveragesQuantity").attr("value",parseInt(quantity) + 1);
							}
							else{
								$(window.opener.document).find(".beveragesQuantity").attr("value",parseInt(quantity));
							}
							setCookie("beverage",parseInt(counter)+1,3);
						}
					}
					 
					
				}
				else if(cannedFood == "<%= request.getParameter("foodType") %>"){
					if($(window.opener.document).find("#cannedFoodDefault").html()!=null){
						$(window.opener.document).find("#cannedFoodDefault").remove();
						var count=getCookie("cannedFood");
						$("<tr id='cannedFood"+count+"' class='cannedFood'><td>"+name+"<input type='hidden' name='cannedFoodName' value='"+name+"'></td><td>"+weight+"<input type='hidden' name='cannedFoodWeight' value='"+weight+"'></td><td><input type='number' style='width:55%;' value='"+quantity+"' class='cannedFoodQuantity'  min=0 max=99 step=1 name='cannedFoodQuantity'></td><td><button class='deleteRow' type=button>Delete</button></td></tr>").insertBefore($(window.opener.document).find("#generalFoodHead"));
						if(quantity == 0){
							$(window.opener.document).find(".cannedFoodQuantity").attr("value",parseInt(quantity) + 1);
						}
						else{
							$(window.opener.document).find(".cannedFoodQuantity").attr("value",parseInt(quantity));
						}
						setCookie("cannedFood",parseInt(count)+1,3);
						//alert(getCookie("beverage"));
					}
					else{
						var counter=getCookie("cannedFood");
						var listName=" ";
						var listWeight=" ";
						var check=0;
						for(var i=1;i<parseInt(counter)+2;i++){
							listName=$(window.opener.document).find("#cannedFood"+i).find("td:eq(0) input").val();
							listWeight=$(window.opener.document).find("#cannedFood"+i).find("td:eq(1) input").val();
							if(listName==name&&listWeight==weight){
								if(quantity==0){
									quantity=1;
								}
								quantity=parseInt(quantity)+parseInt($(window.opener.document).find("#cannedFood"+i).find("td:eq(2) input").val());
								$(window.opener.document).find("#cannedFood"+i).find("td:eq(2) input").val(quantity);
								check=1;
								break;
							}
							
						}
						if(check==0){
							$("<tr id='cannedFood"+counter+"' class='cannedFood'><td>"+name+"<input type='hidden' name='cannedFoodName' value='"+name+"'></td><td>"+weight+"<input type='hidden' name='cannedFoodWeight' value='"+weight+"'></td><td><input type='number' style='width:55%;' value='"+quantity+"' class='cannedFoodQuantity'  min=0 max=99 step=1 name='cannedFoodQuantity'></td><td><button class='deleteRow' type=button>Delete</button></td></tr>").insertBefore($(window.opener.document).find("#generalFoodHead"));
							if(quantity == 0){
								$(window.opener.document).find(".cannedFoodQuantity").attr("value",parseInt(quantity) + 1);
							}
							else{
								$(window.opener.document).find(".cannedFoodQuantity").attr("value",parseInt(quantity));
							}
							setCookie("beverage",parseInt(counter)+1,3);
						}
					}
				}
				else if(generalFood == "<%= request.getParameter("foodType") %>"){
					if($(window.opener.document).find("#generalFoodDefault").html()!=null){
						$(window.opener.document).find("#generalFoodDefault").remove();
						var count=getCookie("generalFood");
						$("<tr id='generalFood"+count+"' class='generalFood'><td>"+name+"<input type='hidden' name='generalFoodName' value='"+name+"'></td><td>"+weight+"<input type='hidden' name='generalFoodWeight' value='"+weight+"'></td><td><input type='number' style='width:55%;' value='"+quantity+"' class='generalFoodQuantity'  min=0 max=99 step=1 name='generalFoodQuantity'></td><td><button class='deleteRow' type=button>Delete</button></td></tr>").insertBefore($(window.opener.document).find("#end"));
						if(quantity == 0){
							$(window.opener.document).find(".generalFoodQuantity").attr("value",parseInt(quantity) + 1);
						}
						else{
							$(window.opener.document).find(".generalFoodQuantity").attr("value",parseInt(quantity));
						}
						setCookie("generalFood",parseInt(count)+1,3);
						//alert(getCookie("beverage"));
					}
					else{
						var counter=getCookie("generalFood");
						var listName=" ";
						var listWeight=" ";
						var check=0;
						for(var i=1;i<parseInt(counter)+2;i++){
							listName=$(window.opener.document).find("#generalFood"+i).find("td:eq(0) input").val();
							listWeight=$(window.opener.document).find("#generalFood"+i).find("td:eq(1) input").val();
							if(listName==name&&listWeight==weight){
								if(quantity==0){
									quantity=1;
								}
								quantity=parseInt(quantity)+parseInt($(window.opener.document).find("#generalFood"+i).find("td:eq(2) input").val());
								$(window.opener.document).find("#generalFood"+i).find("td:eq(2) input").val(quantity);
								check=1;
								break;
							}
							
						}
						if(check==0){
							$("<tr id='generalFood"+counter+"' class='generalFood'><td>"+name+"<input type='hidden' name='generalFoodName' value='"+name+"'></td><td>"+weight+"<input type='hidden' name='generalFoodWeight' value='"+weight+"'></td><td><input type='number' style='width:55%;' value='"+quantity+"' class='generalFoodQuantity'  min=0 max=99 step=1 name='generalFoodQuantity'></td><td><button class='deleteRow' type=button>Delete</button></td></tr>").insertBefore($(window.opener.document).find("#end"));
							if(quantity == 0){
								$(window.opener.document).find(".generalFoodQuantity").attr("value",parseInt(quantity) + 1);
							}
							else{
								$(window.opener.document).find(".generalFoodQuantity").attr("value",parseInt(quantity));
							}
							setCookie("generalFood",parseInt(counter)+1,3);
						}
					}
				}
				window.close();
			}
			else{
				alert("Please select a item.");
			}
		});
	});
</script>
</head>
<body style="text-align: center;">
	<p>Select one of the items below:</p>
	<form>
		<table class="selectItemTable">
			<thead style="background:#DFAE74;">
				<tr>
					<td class="radioBtn"></td>
					<td>Item ID</td>
					<td>Item Name</td>
					<td>Item Weight</td>
					<td>Quantity</td>
				</tr>
			</thead>
			<tbody style="background:#FFEBCD;">
				<% for (int i=0;i<newFoodArr.size();i++){ %>
				<tr>
					<td class="radioBtn"><input type="radio" name="radio" value="<%= i %>"></td>
					<td id="ItemID"><%= newFoodArr.get(i).getFoodID() %></td>
					<td id="ItemName"><%= newFoodArr.get(i).getName() %></td>
					<td id="ItemWeight"><%= newFoodArr.get(i).getWeight() %></td>
					<td id="Quantity"><input type="text" value=0 ></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</form>
	<button class="selectBtn">Select</button>
</body>
</html>