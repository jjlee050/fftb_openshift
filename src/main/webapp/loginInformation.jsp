<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="ffth.data.UserManager,ffth.model.User,java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>

<%
String name = (String) session.getAttribute("savedUserName");
String username = String.valueOf(session.getAttribute("savedUserName"));

System.out.println("UserName: " + username);
System.out.println("Name: " + name);

session.setAttribute("theName", name );
System.out.println("The name: " + name);

%>

<script>
 $(document).ready(function(){
	$('#loggedIn').hide();
	$('#notLoggedIn').hide();
	
	var username = "<%= (String) session.getAttribute("savedUserName") %>";
	
	//alert(username);
	if(username == "null"){
		$('#notLoggedIn').show();
		//alert('Not logged in');
	}
	else{
		$('#loggedIn').show();
		//alert('Logged in');
	}
	
}); 
 </script>


</head>
<body>
	<div class="login" id="notLoggedIn">
			Hello guest! Please <a href="login.jsp">login</a> or <a href="createVolunteer.jsp">sign up</a>!
		</div>
		
		<div class="login" id="loggedIn">
			Welcome, 
<a href="viewVolunteerProfile.jsp?username=<%= name %>"> <%= name %></a>! (<a href="logout.jsp">log out</a>)
		</div>



</body>
</html>