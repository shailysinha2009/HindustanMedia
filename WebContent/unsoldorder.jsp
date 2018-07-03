<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
  <table align="center" width="1040"height="400">
   <td  bgcolor="#FFFFFF">
   <center><font size=6><b>Select your AGENT from the list</b></font></center>
   <center>
   <div style="overflow:scroll;height:400px;overflow:auto">
   <table border="2" bgcolor="#efefef">
     <thead>
     <tr>
       <th>A_CODE</th>
       <th>EDITION</th>
      </thead>
     </tr>
     <%
       ResultSet rs=(ResultSet)request.getAttribute("x4");
       while(rs.next()){
    	   String ac=rs.getString("a_code");
    	   String edi=rs.getString("edition");
    	   String runit=rs.getString("ret_unit");
    	   out.print("<tr><td>"+ac+"</td><td>"+edi+"</td><td><a style=color:blue href=\"unsol.jsp?acode="+rs.getString(1)+"\">Select</a></td></tr>");
       }
     %>
   </table>
   </div>
      </center>
   </table>

 </td>
 </table>
</body>
</html>