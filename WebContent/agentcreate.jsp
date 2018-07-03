<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hindustan Agent Create</title>
<script language="javascript" type="text/javascript" src="js/datetimepicker.js"> </script>
</head>
<body>
    <jsp:include page="headder.jsp"></jsp:include>
    <table align="center"  width="1040" height="550">
      <tr>
	    <td  bgcolor="#FFFFFF">
        <form action="agentCreate" method="post">
         <table  align="center" background="${pageContext.request.contextPath}/images/lop.jpg" cellpadding="4" width="60%" align="cener" cellspacing="4" width="1040">
           <tr>
             <td colspan=4>
               <center><font size=6><b>AGENT REGISTRATION FORM</b></font></center>
            </td>
          </tr>
          <tr>
            <td>Agent Name</td>
            <td><input type="text" name="agentName" id="agentName" size="50" required></td>
         </tr>
        <tr>
           <td>Agent Code</td>
           <td><input type="text" name="agentCode" id="agentCode" size="10" required></td>
        </tr>
        <tr>
           <td>Address</td>
           <td><input type="text" name="address" id="address" size="50" required></td>
        </tr>
        <tr>
          <td>PIN Code</td>
          <td><input type="text" name="pinCode" id="pinCode" size="8" required></td>
        </tr>
       <tr>
          <td>Sex</td>
          <td><input type="radio" name="sex" value="m" size="30">Male
            <input type="radio" name="sex" value="f" size="30">Female</td>
      </tr>
      <tr>
        <td>Edition</td>
        <td><select name="edition">
               <option value="-1" selected>Select..</option>
               <option value="Gopalganj">Gopalganj</option>
               <option value="Arra">Arra</option>
               <option value="Muzaffarpur">Muzaffarpur</option>
               <option value="Patna">Patna</option>
               <option value="Gaya">Gaya</option>
               <option value="Sassaram">Sassaram</option>
               <option value="Chhapra">Chhapra</option>
               <option value="Rajgir">Rajgir</option>
               <option value="Nalanda">Nalanda</option>
               <option value="BiharSharif">BiharSharif</option>
               <option value="Samastipur">Samastipur</option>
               <option value="Aurangabad">Aurangabad</option>
               <option value="Bhagalpur">Bhagalpur</option>
               <option value="Purnia">Purnia</option>
               <option value="Darbhanga">Darbhanga</option>
               <option value="Begusarai">Begusarai</option>
               <option value="Katihar">Katihar</option>
               <option value="Bettiah">Bettiah</option>
               <option value="Saharsa">Saharsa</option>
               <option value="Hajipur">Hajipur</option>
               <option value="Dehri">Dehri</option>
               <option value="Siwan">Siwan</option>
               <option value="Motihari">Motihari</option>
               <option value="Nawada">Nawada</option>
               <option value="Bagaha">Bagaha</option>
               <option value="Buxar">Buxar</option>
               <option value="Kishanganj">Kishanganj</option>
               <option value="Sitamarhi">Sitamarhi</option>
               <option value="Jamalpur">Jamalpur</option>
               <option value="Jahanabad">Jahanabad</option>
            </select></td>
     </tr>
     <tr>
        <td>EmailId</td>
        <td><input type="email" name="emailId" id="emailId" size="50" required placeholder="Enter a valid email address"></td>
     </tr>
     <tr>
        <td>DOB</td>
        <td><input type="text" name="dob" id="dob" size="50"  required>
        <a href="javascript:NewCal('dob','ddmmmyyyy')">
        <img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
     </tr>
     <tr>
        <td>Mobile No.</td>
        <td><input type="text" name="mobileNo" id="mobilenNo" size="50" required></td>
     </tr>
     <tr>
        <td>Return Unit</td>
        <td><input type="text" name="returnUnit" id="returnUnit" size="8" required></td>
     </tr>
     <tr>
        <td>Security Money</td>
        <td><input type="text" name="secureMoney" id="secureMoney" size="8" required></td>
     </tr>
     <tr>
        <td><input type="reset"></td>
        <td colspan="4"><input type="submit" value="Submit Form"/></td>
     </tr>
   </table>
  </form></td>
  </tr>
 </table>
 <jsp:include page="copyright.jsp"></jsp:include>
</body>
</html>