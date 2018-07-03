<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="ht.Datahandle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   Datahandle dd=new Datahandle();
   String a_code=request.getParameter("a_code");
   String a_name=request.getParameter("a_name");
   String address=request.getParameter("address");
   String pincode=request.getParameter("pincode");
   String sex=request.getParameter("sex");
   String edition=request.getParameter("edition");
   String emailid=request.getParameter("emailid");
   String dob=request.getParameter("dob");
   String contactno=request.getParameter("contactno");
   Integer ret_unit=new Integer(Integer.parseInt(request.getParameter("ret_unit")));
   Integer sec_money=new Integer(Integer.parseInt(request.getParameter("sec_money")));
   dd.updateAgent(a_code, a_name, address, pincode, sex, edition, emailid, dob, contactno, ret_unit, sec_money);
%>
<jsp:include page="headder.jsp"></jsp:include>
<table  align="center" background="${pageContext.request.contextPath}/images/lop.jpg" cellpadding="4" align="cener" cellspacing="4" width="1040">         
					<tr>

						<td height="30" colspan="2" align="center" valign="top"
							class="blue11b">Updated successfully.
						</td>
					</tr>
				</table>
<jsp:include page="copyright.jsp"></jsp:include>
</body>
</html>