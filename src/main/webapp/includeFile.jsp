<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.*,ffth.model.*,java.util.*,java.text.SimpleDateFormat,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	SimpleDateFormat sdtf = new SimpleDateFormat("MM dd,yyyy h:mm:ss ");
	SimpleDateFormat format = new SimpleDateFormat("MMM dd, yyyy");
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat stf = new SimpleDateFormat("h:mm a");

	//Delivery Schedule
	DeliveryScheduleManager deliveryScheduleManager = new DeliveryScheduleManager();
	ArrayList<Delivery_Schedule> deliveryScheduleArr = deliveryScheduleManager.getAllDeliverySchedules();

	//Beneficiary
	BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
	ArrayList<Beneficiary> beneficiaryArr = beneficiaryManager.getAllBeneficiarys();

	//Vehicle
	VehicleManager vehicleManager = new VehicleManager();
 	ArrayList<Vehicle> vehicleArr = vehicleManager.getAllVehicles();
 	
 	PackingListManager packingListManager = new PackingListManager();
 	ArrayList<Packing_List> packingListArr = packingListManager.getAllList();
 %>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="javascript/jquery.js"></script> 
</head>
<body>

</body>
</html>