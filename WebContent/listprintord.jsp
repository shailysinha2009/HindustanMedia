<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PrintOrder List</title>
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
       <th>ISSUE DATE</th>
       <th>NO. OF COPIES</th>
       <th>RATE</th>
       <th>MONEY</th>
      </thead>
     </tr>
     <%
       ResultSet rs=(ResultSet)request.getAttribute("po");
       while(rs.next()){
    	   String ac=rs.getString("a_code");
    	   String edi=rs.getString("edition");
    	   String isd=rs.getString("issue_date");
    	   String noc=rs.getString("no_copies");
    	   String ra=rs.getString("rate");
    	   String tmon=rs.getString("total_money");
    	   out.print("<tr><td>"+ac+"</td><td>"+edi+"</td><td>"+isd+"</td><td>"+noc+"</td><td>"+ra+"</td><td>"+tmon+"</td></tr>");
       }
     %>
   </table>
   </div>
   </td>
   </table>
</body>
</html>