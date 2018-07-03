<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="ht.Printord" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dispatch NewsPaper</title>
</head>
<body>
<%
  Printord pr=(Printord)request.getAttribute("x11");
  String issu_date=(String)request.getAttribute("xx2");
%>
   <jsp:include page="headder.jsp"></jsp:include>
   <table align="center"  width="1040" height="550">
   <tr>
     <td  bgcolor="#FFFFFF">
       <form action="dispatchdetailcreate" method="post">
       <table background="${pageContext.request.contextPath}/images/lop.jpg" cellpadding="4" width="60%"  align="center" cellspacing="4">
<tr>
<td colspan=4>
<center><font size=6><b>Dispatch Details Form</b></font></center>
</td>
</tr>
<tr>
<td>Agent_code</td>
<td><input type="text" id="agentcode" name="agentcode" size="3" value="<%=pr.getAc() %>" readonly="readonly"></td>
</tr>
<tr>
<td>Edition</td>
<td><input type="text" id="edition" name="edition" value="<%=pr.getEdi() %>" readonly="readonly"/></td>
</tr>
<tr>
<td>Dispatch Date</td>
<td><input type="text" id="dispatchdd" name="dispatchdd" value="<%=issu_date %>" readonly="readonly"/></td>
</tr>
<tr>
<td>Taxi_no</td>
<td><input type="text" name="taxi_no" id="taxi_no" size="50" required></td>
</tr>
<tr>
<td>No. of Bundles</td>
<td><input type="text" name="no_bundles" id="no_bundles" size="50" required></td>
</tr>

<tr>
<td>Size of Bundle</td>
<td><input type="text" name="size_bundle" id="size_bundle" size="50" required></td>
</tr>
<tr>
<td><input type="reset"></td>
<td colspan="4"><input type="submit" value="Generate Label" /></td>
</tr>
</table>
</form>
 </table>
</body>
</html>