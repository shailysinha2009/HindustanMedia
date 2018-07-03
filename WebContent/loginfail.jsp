<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login fail</title>
</head>
<body>
 <table align="center">
   <tr height="300px">
	<td align="center">
		<!--  login page section -->
		<table border="0px"  style="border-collapse: collapse;">
			<tr>
				<td>
					<h2><font style="color: black; font: bold;">Invalid username or password</font></h2>
					<h3><b><font color="red" style="font-size: 28pt">
				    <a  href="<%= request.getContextPath() %>/login1.html">Login again</a>
			</font></b></h3>
				</td>
				
			</tr>
		</table>
	</td>
</tr>
</table>
</body>
</html>