<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  String aCode=request.getParameter("acode");
  dd.deleteAgentByCode(aCode);
%>
<jsp:include page="headder.jsp"></jsp:include>
<table  align="center" background="${pageContext.request.contextPath}/images/lop.jpg" cellpadding="4" align="cener" cellspacing="4" width="1040">         
					<tr>

						<td height="30" colspan="2" align="center" valign="top"
							class="blue11b">Deleted successfully.
						</td>
					</tr>
				</table>
   <jsp:include page="copyright.jsp"></jsp:include>
</body>
</html>