<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ReturnOrder List</title>
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
       <th>RETURN DATE</th>
       <th>UNSOLD COPIES</th>
       <th>MONEY RETURN</th>
      </thead>
     </tr>
     <%
       ResultSet rs=(ResultSet)request.getAttribute("uo");
       while(rs.next()){
    	   String ac=rs.getString("a_code");
    	   String edi=rs.getString("edition");
    	   String rid=rs.getString("date_order");
    	   String unc=rs.getString("unsold_copies");
    	   String rmon=rs.getString("money_returned");
    	   out.print("<tr><td>"+ac+"</td><td>"+edi+"</td><td>"+rid+"</td><td>"+unc+"</td><td>"+rmon+"</td></tr>");
       }
     %>
   </table>
   </div>
   </td>
   </table>
</body>
</html>