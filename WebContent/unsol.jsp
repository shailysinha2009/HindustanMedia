<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="ht.Datahandle" %>
<%@ page import="ht.Agent" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Return order</title>
<style type="text/css">
  .column1of2{
    float:left;
    width: 800px;
    margin:10px;
    }
</style>
<script language="javascript" type="text/javascript" src="js/datetimepicker.js"> </script>
</head>
<body>
   <jsp:include page="headder.jsp"></jsp:include>
   <jsp:useBean id="agnt" class="ht.Agent" scope="page"></jsp:useBean>
 <%
 Datahandle dd2=new Datahandle();
 String aCode=request.getParameter("acode");
 agnt=dd2.findAgentByCode(aCode);
 %>
  <table align="center" width="1040"height="400">
   <td  bgcolor="#FFFFFF">
   <div class="column1of2">
   <table align="center"  width="800" height="400">
   <tr>
     <td  bgcolor="#FFFFFF">
       <form action="unsoldordercreate" method="post">
       <table background="${pageContext.request.contextPath}/images/lop.jpg" cellpadding="4" width="60%"  align="center" cellspacing="4">
<tr>
<td colspan=4>
<center><font size=6><b>Return Order</b></font></center>
</td>
</tr>
<tr>
<td>Agent_code</td>
<td><input type="text" id="agentcode" name="agentcode" size="3" value="<%=agnt.getAgentCode()%>" readonly="readonly"></td>
</tr>

<tr>
<td>Return Date</td>
<td><input type="text" name="avaDate" id="avaDate" size="8" required>
<a href="javascript:NewCal('avaDate','ddmmmyyyy')">
<img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
<tr>
<td>Unsold No. Of Copies</td>
<td><input type="text" name="unsolcopies" id="unsolcopies" size="50" required></td>
</tr>
<tr>
<td>Edition</td>
<td><input type="text" id="edition" name="edition" value="<%=agnt.getEdition()%>" readonly="readonly"/></td>
<td><input type="hidden" id="returnunit" name="returnunit" value="<%=agnt.getReturnUnit()%>"/></td>
</tr>
<tr>
<td><input type="reset"></td>
<td colspan="4"><input type="submit" value="Submit Form" /></td>
</tr>
</table>
</form>
 </table>
 </div>
 </td>
 </table>
</body>
</body>
</html>
