<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="ht.Agent" %>
<%@ page import="com.hindustan.servlet.ForLabelBean" %>
<%
List<ForLabelBean> lablist = null;
try {
	lablist = (List<ForLabelBean>)request.getAttribute("li");
} catch (Exception e) {
	
}
ForLabelBean label1=lablist.get(0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body{
      font-family:Georgia,Times,serif;
    }
 h1{
      font-family:Monotype Corsiva,cursive;
   }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Newspaper Bundle Label</title>
</head>
<body>
<%
Agent agnt1=(Agent)request.getAttribute("ob");
%>
<jsp:include page="headder.jsp"></jsp:include>
   <table align="center"  width="1040" height="550">
   <tr>
     <td background="${pageContext.request.contextPath}/images/lop.jpg">
       <table background="${pageContext.request.contextPath}/images/label1.png" cellpadding="1" width=60%  align="center" height="370" cellspacing="1">
        <center></center> <tr><td>NEWS PAPER</td>
             <td>IMMEDIATE DELIVERY</td>
         </tr>
         <tr>
           <td><img src="${pageContext.request.contextPath}/images/label2.jpg"  width="550" align="center" height="150"/></td>
           <td><img src="${pageContext.request.contextPath}/images/ht-mini-1.jpg"  width="100" align="center" height="100"/></td>
         </tr>
         <tr><td><h1>Hindustan Media Ventures Limited Patna<hr/></h1></td>
         </tr>
         <tr>
         <td><b>AGENT NAME:<%= agnt1.getAgentName() %></b></td>
         </tr>
         <tr>
         <td><b>EDITION:<%= agnt1.getEdition() %></b></td>;
         </tr>
         <tr>
         <td><b>NO. OF BUNDLES:<%= label1.getNobundles() %></b></td>
         </tr>
         <tr>
         <td><b>SIZE OF BUNDLE:<%= label1.getSizebunde() %></b></td>
         </tr>
         </center>
      </table>
   </td>
   </tr>
 </table>
</body>
</html>