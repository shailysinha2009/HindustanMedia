<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Modify Agents</title>
</head>
<body>
<jsp:include page="headder.jsp"></jsp:include>
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
   ResultSet rset=(ResultSet)request.getAttribute("x2");
    while(rset.next()){
    	String ac=rset.getString("a_code");
 	   String an=rset.getString("a_name");
 	   String c=rset.getString("contactno");
 	   String add=rset.getString("address");
 	   String pin=rset.getString("pincode");
 	   String d=rset.getString("dob");
 	   String s=rset.getString("sex");
 	   String eid=rset.getString("emailid");
 	   String edi=rset.getString("edition");
 	   String secmon=rset.getString("sec_money");
 	   String runit=rset.getString("ret_unit");
 	   out.print("<tr><td>"+ac+"</td><td>"+an+"</td><td>"+c+"</td><td>"+add+"</td><td>"+pin+"</td><td>"+d+"</td><td>"+s+"</td><td>"+eid+"</td><td>"+edi+"</td><td>"+secmon+"</td><td>"+runit+"</td><td><a style=color:blue href=\"edit.jsp?acode="+rset.getString(1)+"\">EDIT</a><a style=color:#FF0000 href=\"delete_action.jsp?acode="+rset.getString(1)+"\">DELETE</a></td></tr>");
    }
  %>
  </tr>
  </table>
   </center>
</body>
</html>