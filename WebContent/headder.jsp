<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
       #menu ul{
	padding:10px;
	margine:10px;
	list-style:none;
          }
      #menu li{
	float:left;
	display:inline;
	padding:10px;
	position:relative;
         }
     #menu li ul{
	display:none;
	position:absolute;
	list-style:none;
        }
    #menu li:hover ul
       {
	display:block;
	background:black;
	height:auto;
	width:6em;
      }
    a{
         text-decoration:none;
         color:white;
      }
    #menu li a:hover, #menu li .current 
      {
	color: #97e33e;
       }
    #menu li ul li {
	clear: both;
	border-style: none;
    }
    #footer
      {
	background=color:#efefef;
	padding:10px;
	margin:10px;
      }
   </style>
  </head>
 <body background="${pageContext.request.contextPath}/images/web.jpg">
      <table align="center" cellpadding="0" cellspacing="0" border="0">
            <tr>
	<td><img src="${pageContext.request.contextPath}/images/g4.jpg" width="1040" height="300"/></td>
            </tr>
            <tr width="1040" height="55">
	<td background="${pageContext.request.contextPath}/images/g3.jpg">
	       <ul id="menu">
		<li><a href="welcome.jsp">HOME</a></li>
		<li><a href="#">AGENT</a>
		    <ul>
		          <li><a href="agentcreate.jsp">Create</a></li>
		          <li><a href="agentlist">List</a></li>
		          <li><a href="deletemodify">UPDATE</a></li>
		  </ul>
		</li>
		<li><a href="#">ORDER</a>
		  <ul>
		       <li><a href="printorder">PRINT ORDER</a></li>
		       <li><a href="unsoldorder">RETURN ORDER</a></li>
		  </ul>
		</li>
		<li><a href="#">INVOICE</a>
		   <ul>
		        <li><a href="invoiceselect">Generate</a></li>
		   </ul>
		</li>
		<li><a href="#">REPORT</a>
		  <ul>
		       <li><a href="printselect.jsp">PO LIST</a></li>
		       <li><a href="returnselect.jsp">RO LIST</a></li>
		       <li><a href="invselect.jsp">INVOICE LIST</a></li>
		  </ul>
		</li>
	      </ul>
                 </td>
             </tr>

        </table>
</body>
</html>