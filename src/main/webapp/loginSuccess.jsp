<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Successful</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="javascript/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>

</head>
<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
		<%@ include file="loginInformation.jsp" %>
		<div class="bodywithoutSide">
				<h3><u>Notice</u></h3>
				<p> You have successfully logged in </p>
				<div class="buttonCol5">
					<a href="main.jsp"><button> Return</button></a>
				</div>
		</div>
		
		<%@ include file="footer.html"%>
	</div>
</body>
</html>