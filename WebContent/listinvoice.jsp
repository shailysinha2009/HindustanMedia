<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice List</title>
</head>
<body>
   <jsp:include page="headder.jsp"></jsp:include>
<table align="center" width="1040"height="400">
   <td  bgcolor="#FFFFFF">
  <div style="overflow:scroll;height:400px;overflow:auto">
  <table align="center" border="2" bgcolor="#efefef">
     <thead>
     <tr>
       <th>A_CODE</th>
       <th>EDITION</th>
       <th>FROM</th>
       <th>TILL</th>
       <th>P_ORDER MONEY</th>
       <th>U_ORDER MONEY</th>
       <th>PAYBLE MONEY</th>
      </thead>
     </tr>
     <%
       ResultSet rs=(ResultSet)request.getAttribute("invo");
       while(rs.next()){
    	   String ac=rs.getString("a_code");
    	   String edi=rs.getString("edition");
    	   String dr1=rs.getString("date_range1");
    	   String dr2=rs.getString("date_range2");
    	   String tm=rs.getString("total_money");
    	   String rm=rs.getString("money_returned");
    	   String pm=rs.getString("total_omoney");
    	   out.print("<tr><td>"+ac+"</td><td>"+edi+"</td><td>"+dr1+"</td><td>"+dr2+"</td><td>"+tm+"</td><td>"+rm+"</td><td>"+pm+"</td></tr>");
       }
     %>
   </table>
   </div>
   </td>
   </table>
</body>
</html>