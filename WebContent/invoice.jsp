<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
List<InvoiceBean> l1 = null;
try {
	l1 = (List<InvoiceBean>)request.getAttribute("inv");
} catch (Exception e) {
	
}
InvoiceBean inv=l1.get(0);
%>
<%@page import="java.util.List"%>
<%@page import="com.hindustan.servlet.InvoiceBean"%>
<%@ page import="ht.Agent" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice</title>
</head>
<body>
<%
Agent agnt=(Agent)request.getAttribute("obb");
%>
    <jsp:include page="headder.jsp"></jsp:include>
    <table bgcolor="#FFFFFF" width="1040"  align="center" height="550" cellpadding="4" cellspacing="4">
    <thead><th align="center"> Hindustan Media Ventures</br>
                             Buddha Marg </br>                            
                              Patna-01</th>
       <th align="right">Ph:2223434,2223772</br>
                         Fax:2221545</th>
    
    <tr>
    <td align="center" colspan=4><font size=4><b>Invoice</b></font></td></tr></thead>
    <tr><td>AGENT CODE: <%= inv.getAgntcd() %></td>
        <td align="justify">AGENT NAME: <%=agnt.getAgentName() %></td>
    </tr>
    <tr><td>EDITION: <%= inv.getEdii() %><hr/></td></tr>
    <tr><td>
    <table border="2" width="800" bgcolor="#efefef">
    <thead>
     <tr>
       <th>FROM</th>
       <th>TILL</th>
       <th>MONTHLY TOTAL</th>
       <th>MONTHLY RETURN</th>
       <th>PAYBLE MONEY</th>
      </thead>
     </tr>
     <tr>
     <td><%=inv.getFromdd() %></td>
     <td><%=inv.getTilldd() %></td>
     <td><%=inv.getMontotal() %></td>
     <td><%=inv.getMonreturn() %></td>
     <td><%=inv.getMonpay() %></td>
     </tr>
     </table>
     </td>
     </tr>
     <tr><td align="right">AUTHORITY SIGNATURE:</td></tr>
     <tr><td align="right">__________________</td></tr>
     <tr></tr>
     <tr><td>PAY BY CASH</td></tr>
    </table>  
</body>
</html>