<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login failed</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/josephleestyle.css" />
</head>
<body>
	<div class="menu">
		&nbsp;
		<%@ include file="header.html"%>
		<div class="bodywithoutSide">
				<h3><u>Notice</u></h3>
				<p> You have failed logged in, please try again! </p>
				<div class="buttonCol5">
					<a href="login.jsp"><button> Back</button></a>
				</div>
		</div>
		<%@ include file="footer.html"%>
	</div>
</body>
</html>