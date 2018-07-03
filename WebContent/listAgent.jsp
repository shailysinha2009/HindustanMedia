<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agent List</title>
</head>
<body>
   <jsp:include page="headder.jsp"></jsp:include>
   <table align=center width=1040>
   <tr>
	    <td  bgcolor="#FFFFFF">
   <center>
   <table border="2" bgcolor="#efefef">
     <thead>
     <tr>
       <th>A_CODE</th>
       <th>A_NAME</th>
       <th>CONTACT_NO</th>
       <th>ADDRESS</th>
       <th>PINCODE</th>
       <th>DOB</th>
       <th>SEX</th>
       <th>EMAIL_ID</th>
       <th>EDITION</th>
       <th>SECURITY_MONEY</th>
       <th>RETURN_UNIT</th>
      </thead>
     </tr>
     <%
       ResultSet rs=(ResultSet)request.getAttribute("x1");
       while(rs.next()){
    	   String ac=rs.getString("a_code");
    	   String an=rs.getString("a_name");
    	   String c=rs.getString("contactno");
    	   String add=rs.getString("address");
    	   String pin=rs.getString("pincode");
    	   String d=rs.getString("dob");
    	   String s=rs.getString("sex");
    	   String eid=rs.getString("emailid");
    	   String edi=rs.getString("edition");
    	   String secmon=rs.getString("sec_money");
    	   String runit=rs.getString("ret_unit");
    	   out.print("<tr><td>"+ac+"</td><td>"+an+"</td><td>"+c+"</td><td>"+add+"</td><td>"+pin+"</td><td>"+d+"</td><td>"+s+"</td><td>"+eid+"</td><td>"+edi+"</td><td>"+secmon+"</td><td>"+runit+"</td></tr>");
       }
     %>
   </table>
   </td></tr>
   </table>
   </center>
</body>
</html>