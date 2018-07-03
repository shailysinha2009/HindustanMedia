package com.hindustan.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.util.DBConnection;
public class AddAgent extends HttpServlet {
	public void service (HttpServletRequest request, HttpServletResponse response) {
		Connection conn=null;
		Statement stmt = null;
		String agentName = request.getParameter("agentName");
		String agentCode = request.getParameter("agentCode");
		String address = request.getParameter("address");
		String pinCode = request.getParameter("pinCode");
		String sex = request.getParameter("sex");
		String edition = request.getParameter("edition");
		String emailId = request.getParameter("emailId");
		String dob = request.getParameter("dob");
		String mobileNo = request.getParameter("mobileNo");
		int returnUnit= Integer.parseInt(request.getParameter("returnUnit"));
		int secureMoney= Integer.parseInt(request.getParameter("secureMoney"));
		String sql="insert into agent" +
		   "(a_code,a_name,contactno,address,pincode,dob,sex,emailid,edition,"
		   + "sec_money,ret_unit)"+
		   "values( \'"+agentCode+"\', " +
					"\'"+agentName+"\', " +
					"\'"+mobileNo+"\', " +
					"\'"+address+"\', " +
					"\'"+pinCode+"\', " +
					"to_date(\'"+dob+"\',\'dd/mon/yyyy\') , " +
					"\'"+sex+"\', " +
					"\'"+emailId+"\', " +
					"\'"+edition+"\', " +
					"\'"+secureMoney+"\',"+
					"\'"+returnUnit+"\')";
System.out.println(sql);
		
		try {
			 conn = DBConnection.getConnection();
			if (conn == null) {
				response.sendRedirect("error.jsp");
			}
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
			if (i>0) {
			request.getRequestDispatcher("agentAdded.jsp").forward(request, response);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private String converDateFormat(String dateVal) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		SimpleDateFormat formatter1 = new SimpleDateFormat("MM/dd/yyyy");
		Date date = null;
		try {
			date = formatter.parse(dateVal);
			System.out.println(date);
			System.out.println(formatter1.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return formatter1.format(date);
	}

}
