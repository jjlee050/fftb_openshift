<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="ffth.data.PackingListManager,ffth.model.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SelectPackingList</title>
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
 	ArrayList<Packing_List> packingArr = listItemManager.getAllList();
 	//System.out.println(packingArr.get(0).getPackingListID());
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
		$('.packingList').dataTable({
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
			if(rowIndex >= 0){
				$('.packingList tr:eq('+correctRowIndex+')').each(function() {
					packingListID = $(this).find("td").eq(1).html();
					eventLocation=$(this).find("td").eq(2).html();
					eventType= $(this).find("td").eq(3).html();
				    amountOfBags = $(this).find("td").eq(4).html();
				});

				$(window.opener.document).find("#listID").html(packingListID);
				// From my create delivery schedule
				$(window.opener.document).find("#packingListID").attr("value",packingListID);
			 	$(window.opener.document).find(".packingListID").html(packingListID);
				if(eventLocation == "-NIL-"){
					$(window.opener.document).find("#eventLocation").html(" -NIL- ");
				}
				else{
					$(window.opener.document).find("#eventLocation").html(eventLocation);
				}
				$(window.opener.document).find("#eventType").html(eventType);
			 	$(window.opener.document).find("#amountOfBags").html(amountOfBags);
				$(window.opener.document).find("table #noPackingListInfo").hide();
				$(window.opener.document).find("table #packingListInfo").show();
				
				jQuery.fn.doesExist = function(){
			        return jQuery(this).length > 0;
			 };
			 $('tr.list'+packingListID).each(function() {
				  $this = $(this);
				  var id=$(this).find("td").eq(0).html();
				  var name = $this.find("td").eq(1).html();
				  var weight = $this.find("td").eq(2).html();
				  var quantity=$this.find("td").eq(3).html();
				  var type=$this.find("td").eq(4).html();
				  var quantityAvailable=$this.find("td").eq(5).html();
				  
				  var insertId=" ";
				  var insertBeforeId=" ";
					if(type == ("Beverage")){
						insertId="beverages";
						insertBeforeId="#cannedFoodHead";
					}
					else if(type == ("Canned Food")){
						insertId="cannedFood";
						insertBeforeId="#generalFoodHead";
					}
					else if(type == ("General Food")){
						insertId="generalFood";
						insertBeforeId="#end";
					}
				  if(type == ("beverage")){
					  type="beverages"
				  }
				  $(window.opener.document).find("#"+insertId+"Default").remove();
				  $("<tr id='"+insertId+"1' class='"+insertId+"'><td>"+name+"</td><td>"+weight+"</td><td>"+quantity+"</td><td style=display:none;>"+quantityAvailable+"</td></tr>").insertBefore($(window.opener.document).find(insertBeforeId));
				});		
			/* if($(window.opener.document).find(id+"Default").doesExist()){
					$("<tr id=beveragesId1 class=beveragesId><td>"+ItemName+"<input type=hidden name="+insertId+"Name value='"+ItemName+"'></td><td>"+weight+"<input type=hidden name="+insertId+"Weight value="+weight+"></td><td><input type=number style=width:55%; value="+quantity+" class=quantity  min=0 max=99 step=1 name="+insertId+"Quantity></td><td><button class=deleteRow>Delete</button></td></tr>").insertBefore($(window.opener.document).find(insertBeforeId));
					$(window.opener.document).find(id+"Default").remove();
					$(window.opener.document).find(id+"Default").remove();
					setCookie("idCounter",1,3);
				}
				else{
					var counter=getCookie("idCounter");
					var listName=" ";
					var listWeight=" ";
					var check=0;
					for(var i=1;i<parseInt(counter)+2;i++){
						listName=$(window.opener.document).find("#"+insertId+i).find("td").eq(0).html();
						listWeight=$(window.opener.document).find("#"+insertId+i).find("td").eq(1).html();
						if(listName==ItemName&&listWeight==weight){
							quantity=parseInt(quantity)+parseInt($(window.opener.document).find("#"+insertId+i).find("td:eq(2) input").val());
							$(window.opener.document).find("#"+insertId+i).find("td:eq(2) input").val(quantity);
							check=1;
							break;
						}
						
					}
					if(check==0){
						var updatedCounter=parseInt(counter)+1;
						setCookie("idCounter",updatedCounter,3);
						$("<tr id="+insertId+""+updatedCounter+" class="+insertId+"><td>"+ItemName+"<input type=hidden name="+insertId+"Name value='"+ItemName+"'></td><td>"+weight+"<input type=hidden name="+insertId+"Weight value="+weight+"></td><td><input type=number style=width:55%; value="+quantity+" class=quantity min=0 max=99 step=1 name="+insertId+"Quantity></td><td><button class=deleteRow>Delete</button></td></tr>").insertBefore($(window.opener.document).find(insertBeforeId));
					
					}
				}*/
			 
			window.close();
			}
			else{
				alert("Please select a Item.");
			}
		});
	});
</script>
</head>
<body>
	<p>Select one of the item below:</p>
	<table class="packingList">
		<thead>
			<tr>
				<td class="radioBtn"></td>
				<td>Packing List ID</td>
				<td>Location</td>
				<td>Event Type</td>
				<td>Amount of Bags</td>
			</tr>
		</thead>
		<tbody>
			<% for(int i=0;i<packingArr.size();i++){%>
			<tr>
				<td class="radioBtn"><input type="radio" name="radio" value="<%= i %>"></td>
				<td id="Packing List ID"><%= packingArr.get(i).getPackingListID() %></td>
				<% if(packingArr.get(i).getLocation() == null){%>
				<td id="location"> -NIL- </td>
				<% }
				   else{ %>
				<td id="location"><%=packingArr.get(i).getLocation() %></td>
				<% } %>
				<td id="Event Type"><%= packingArr.get(i).getEventType() %></td>
				<td id="Amount of Bags"><%= packingArr.get(i).getAmountOfBags() %></td>
			</tr>
			<%}%>
		</tbody>
	</table>
	<br>
	<table class="listItem" style="display:none;">
	<tbody>
	<%for(int i=0;i<packingArr.size();i++){ %>
	<%for(int u=0;u<packingArr.get(i).unnamed_Packing_List_Food_Item_.size();u++){ %>
	<tr class='list<%=i+1 %>'>
		<td id="listID"><%= packingArr.get(i).unnamed_Packing_List_Food_Item_.get(u).getId() %></td>
		<td id="foodName"><%=packingArr.get(i).unnamed_Packing_List_Food_Item_.get(u).unnamed_Food_.getName() %></td>
		<td id="foodWeight"><%=packingArr.get(i).unnamed_Packing_List_Food_Item_.get(u).unnamed_Food_.getWeight() %></td>
		<td id="quantity"><%=packingArr.get(i).unnamed_Packing_List_Food_Item_.get(u).getQuantity() %></td>
		<td id="type"><%=packingArr.get(i).unnamed_Packing_List_Food_Item_.get(u).unnamed_Food_.getType() %></td>
		<td id="quantityAvailable"><%=packingArr.get(i).unnamed_Packing_List_Food_Item_.get(u).unnamed_Food_.getQuantity() %></td>
	</tr>
	<%} %>
	<%} %>
	</tbody>
	</table>
	<br/>
	<button class="selectBtn">Select</button>
</body>
</html>