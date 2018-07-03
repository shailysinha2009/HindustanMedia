<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PO Agent Select</title>
</head>
<body>
<jsp:include page="headder.jsp"></jsp:include>
<table align="center" background="${pageContext.request.contextPath}/images/lop.jpg"  width="1040" height="550">
      <tr>
	    <td>
<form action="listprint" method="post">
<table   bgcolor="#FFFFFF" align="center" cellpadding="4" width="60%" align="cener" cellspacing="4" width="1040">
           <tr>
             <td colspan=4>FILTER BY AGENT CODE<input type="text" name="agcode" id="agcode" size="3" required><input type="submit" value="FILTER"/></td>
  </tr>
  </table>
 </form>
 </td></tr>
 </table>
</body>
</html>