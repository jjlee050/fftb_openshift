<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<%-- <%
String username = request.getParameter("name");
session.setAttribute("savedName", username);
System.out.println("username in login: " + username);
%> --%>

</head>
<body>

<div class="menu">
		&nbsp;
		<%@ include file="header.html" %>
			
			<div class="body">
			<h2>Login</h2>
				<form method="post" action="loginServlet">
				<table>
				<tr>
					<td>Name: </td>
					<td><input type="text" name="name" size="20"> </td>
				</tr>		
				
				<tr>
					<td>Password: </td>
					<td><input type="password" name="pass" size="20"> </td>
				</tr>
				</table>
				<input type="submit" value="Sign in"/>
				</form>
			</div>
		
		<%@ include file="footer.html" %>
		</div>

</body>
</html>