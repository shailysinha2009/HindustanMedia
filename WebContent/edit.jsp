<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ht.Datahandle" %>
<%@ page import="ht.Agent" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="headder.jsp"></jsp:include>
 <jsp:useBean id="agnt" class="ht.Agent" scope="page"></jsp:useBean>
 <%
 Datahandle dd=new Datahandle();
 String aCode=request.getParameter("acode");
 agnt=dd.findAgentByCode(aCode);
 %>
 <table align="center"  width="1040" height="550">
      <tr>
	    <td  bgcolor="#FFFFFF">
        <form action="update_action.jsp" method="post">
         <table  align="center" background="${pageContext.request.contextPath}/images/lop.jpg" cellpadding="4" width="60%" align="cener" cellspacing="4" width="1040">
          <tr>
             <td colspan=4>
               <center><font size=6><b>EDIT AGENT RECORD</b></font></center>
            </td>
          </tr>
          <tr>
            <td>Agent Code</td>
            <td><input type="text" name="a_code" value="<%=agnt.getAgentCode()%>" size="50" readonly="readonly"></td>
         </tr>
          <tr>
            <td>Agent Name</td>
            <td><input type="text" name="a_name" value="<%=agnt.getAgentName()%>" size="50"></td>
         </tr>
        <tr>
           <td>Address</td>
           <td><input type="text" name="address" value="<%=agnt.getAddress() %>" size="50"></td>
        </tr>
        <tr>
          <td>PIN Code</td>
          <td><input type="text" name="pinCode" value="<%=agnt.getPinCode() %>" size="8"></td>
        </tr>
       <tr>
          <td>Sex</td>
          <td><input type="text" name="sex" value="<%=agnt.getSex()%>"></td>
      </tr>
      <tr>
        <td>Edition</td>
        <td><input type="text" name="edition" value="<%=agnt.getEdition()%>"></td>
     </tr>
     <tr>
        <td>EmailId</td>
        <td><input type="text" name="emailId" value="<%=agnt.getEmailId()%>" size="50"></td>
     </tr>
     <tr>
        <td>DOB</td>
        <td><input type="text" name="dob" value="<%=agnt.getDob()%>" size="50"></td>
     </tr>
     <tr>
        <td>Mobile No.</td>
        <td><input type="text" name="contacto" value="<%=agnt.getMobileNo()%>" size="50"></td>
     </tr>
     <tr>
        <td>Return Unit</td>
        <td><input type="text" name="ret_unit" value="<%=agnt.getReturnUnit()%>" size="8"></td>
     </tr>
     <tr>
        <td>Security Money</td>
        <td><input type="text" name="sec_money" value="<%=agnt.getSecureMoney()%>" size="8"></td>
     </tr>
     <tr>
        <td colspan="4"><input type="submit" value="UPDATE"/></td>
     </tr>
   </table>
  </form></td>
  </tr>
 </table>
 <jsp:include page="copyright.jsp"></jsp:include>
</body>
</html>