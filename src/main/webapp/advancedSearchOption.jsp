<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.newProductManager,ffth.model.Food,java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!-- Data Tables -->
<link rel="stylesheet" type="text/css" href="css/dataTable/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="css/dataTable/demo_page.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.4.custom.css" />
<script type="text/javascript" language="javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" language="javascript" src="javascript/dataTable/dataTables.js"></script>
<%
	System.out.println("Getting the cookies");
	Cookie[] cookies = request.getCookies();
	System.out.println("Cookie 'type' taken is " + cookies[1].getValue());
	String cookieType = null;
	String cookieWeight = null;
	if(cookies!=null){
		for(int i = 0; i<cookies.length;i++){
			if(cookies[i].getName().equals("type")){
				if(cookies[i].getValue().equals("general")||cookies[i].getValue().equals("cannedfood")||cookies[i].getValue().equals("beverages")){
					cookieType = cookies[i].getValue();
				}
			}
			
			if(cookies[i].getValue().equals("1")||cookies[i].getValue().equals("2")||cookies[i].getValue().equals("3")||cookies[i].getValue().equals("4")||cookies[i].getValue().equals("5")){
				cookieWeight = cookies[i].getValue();
			}
		}
	}
	
	System.out.println("Type obtain " + cookieType);
	System.out.println("Weight obtain " + cookieWeight);
	
	newProductManager newProductManager = new newProductManager();
	ArrayList<Food> foodData = new ArrayList<Food>();
	ArrayList<Food> foodDataFromServer = newProductManager.getData();
	Float weight;
	
	for(int j = 0; j<foodDataFromServer.size(); j++){
		weight = foodDataFromServer.get(j).getWeight();
		int weightInt = Math.round(weight);
		String s = Integer.toString(weightInt);
		if(foodDataFromServer.get(j).getType().equals(cookieType)&&s.equals(cookieWeight)){
			foodData.add(foodDataFromServer.get(j));
		}
	}
	
	DateFormat df = new SimpleDateFormat("dd/MM/yyyy");  
	
		
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
	$('.advancedSearchLocation').dataTable({
		 "bJQueryUI": true,
	     "sPaginationType": "full_numbers",
	   	 "fnDrawCallback": function () {
	    		 page = this.fnPagingInfo().iPage+1;
	     }
	});
	
	$("#searchBTN").click(function(){
		var rowIndex = parseInt($('table input:radio:checked').val());
		rowIndex += 1;
		var correctRowIndex = (page*10) - (((page*10)-10) + ((page*10)-rowIndex));
		
		if(rowIndex >= 0){
			var locationID = "";
			var weight = "";
			var type = "";
			
			if(rowIndex>=0){
				$('.advancedSearchLocation tr:eq('+ correctRowIndex +')').each(function(){
					locationID = $(this).find("td").eq(4).html();
					type = $(this).find("td").eq(5).html();
					weight = Math.floor($(this).find("td").eq(6).html());
					alert("Food '" + $(this).find("td").eq(1).html() + "' location found! Look at the map");
				});
			}
			
			$(window.opener.document).find("#mapImg").remove();
			$(window.opener.document).find("#map").append("<img id='mapImg' src='./image/Map/map_" + type + "_"+ weight +"_"+ locationID +".jpg'/>");
		}else{
			alert("Nothing selected");
		}
		
	});
});

function getCookie(cname)
{
var name = cname + "=";
var ca = document.cookie.split(';');
for(var i=0; i<ca.length; i++) 
  {
  var c = ca[i].trim();
  if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
return "";
}
</script>
</head>
<body>
	<p> Select one of the schedule below:</p>
		<table class="advancedSearchLocation">
			<thead>
				<tr>
					<td></td>
					<td>Food Name </td>
					<td>Date Of Donation </td>
					<td>Date Of Expiry </td>
					<td style="display:none;"></td>
					<td style="display:none;"></td>
					<td style="display:none;"></td>
				</tr>
			</thead>
			<tbody>
				<% for(int z = 0; z<foodData.size(); z++){ %>
				<tr>
				<td><input type="radio" name="radio" value="<%=z%>"></td>
				<td><%=foodData.get(z).getName()%></td>
				<td><%= foodData.get(z).getDateOfDonation()%></td>
				<td><%=foodData.get(z).getExpiryDate()%></td>
				<td style="display:none;"><%=foodData.get(z).getLocation()%></td>
				<td style="display:none;"><%=foodData.get(z).getType()%></td>
				<td style="display:none;"><%=foodData.get(z).getWeight()%></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		<table>
			
		</table>
		<button type="button" id="searchBTN" style="float:right; margin-top:2%;">Find the food!</button>
</body>
</html>