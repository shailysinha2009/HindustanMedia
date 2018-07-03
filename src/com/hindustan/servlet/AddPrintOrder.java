package com.hindustan.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.hindustan.servlet.AgentBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;
public class AddPrintOrder extends HttpServlet {
	public void service (HttpServletRequest request, HttpServletResponse response) throws IOException{
		Connection conn=null;
		Statement stmt = null;
		String agentCD=request.getParameter("agentCD");
		
        String edition = request.getParameter("edition");
		String avaDate = request.getParameter("avaDate");
		int no_copies= Integer.parseInt(request.getParameter("no_copies"));
		float rate= Float.parseFloat(request.getParameter("rate"));
		float totalmoney=no_copies*rate;
		String sql="insert into print_order" +
		   "(a_code,edition,no_copies,rate,"
		   + "issue_date,total_money)"+
		   "values( \'"+agentCD+"\', " +
					"\'"+edition+"\', " +
					"\'"+no_copies+"\', " +
					"\'"+rate+"\', " +
					"to_date(\'"+avaDate+"\',\'dd/mon/yyyy\') , " +
					"\'"+totalmoney+"\')";
System.out.println(sql);
		
		try {
			 conn = DBConnection.getConnection();
			if (conn == null) {
				response.sendRedirect("error.jsp");
			}
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
			if (i>0) {
				 request.setAttribute("x10", agentCD);
				 request.setAttribute("xx",avaDate);
			request.getRequestDispatcher("dispatchdetail").forward(request, response);
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
