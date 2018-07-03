<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
List<AgentBean> agentCodeList = null;
try {
	agentCodeList = (List<AgentBean>)request.getAttribute("AGENT_CODE_LIST");
} catch (Exception e) {
	
}

%>
<%@page import="java.util.List"%>
<%@page import="com.hindustan.servlet.AgentBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function populateEdition(select) {
	var selectedOption = select.options[select.selectedIndex];
   // alert ("The selected option is " + selectedOption.value);
    document.getElementById('edition').value  = selectedOption.value;
    document.getElementById('agentCD').value  = selectedOption.text;
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print Order</title>
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
   <table align="center"  width="1040" height="550">
   <tr>
     <td  bgcolor="#FFFFFF">
       <form action="printordercreate" method="post">
       <table background="${pageContext.request.contextPath}/images/lop.jpg" cellpadding="4" width="60%"  align="center" cellspacing="4">
<tr>
<td colspan=4>
<center><font size=6><b>Print Order</b></font></center>
</td>
</tr>
<tr>
<td>Agent_code</td>
<td><select id="agentcode" name="agentcode" onchange="populateEdition(this)">
<option value="-1" selected>select..</option>
<% for (int i=0; i<agentCodeList.size(); i++) { 
	AgentBean agent = agentCodeList.get(i);
%>
<option value="<%=  agent.getEdition()%>"><%=  agent.getAgentCode()%></option>
<% } %>
</select></td>
</tr>

<tr>
<td>Issue Date</td>
<td><input type="text" name="avaDate" id="avaDate" size="8"  required>
<a href="javascript:NewCal('avaDate','ddmmmyyyy')">
<img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
</tr>
<tr>
<td>No. Of Copies</td>
<td><input type="text" name="no_copies" id="no_copies" size="50"  required></td>
</tr>

<tr>
<td>Rate</td>
<td><input type="text" name="rate"
id="rate" size="5"  required></td>
</tr>
<tr>
<td>Edition</td>
<td><input type="text" id="edition" name="edition" readonly="readonly"/>
    <input type="hidden" id="agentCD" name="agentCD" /></td>
</tr>
<tr>
<td colspan="4"><input type="submit" value="Submit Form" /></td>
</tr>
</table>
</form>

 </table>
</body>
</html>