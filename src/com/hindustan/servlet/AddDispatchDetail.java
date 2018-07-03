package com.hindustan.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;
public class AddDispatchDetail extends HttpServlet{
	public void service (HttpServletRequest request, HttpServletResponse response) {
		Connection conn=null;
		Statement stmt = null;
		String agentcode = request.getParameter("agentcode");
		String edition = request.getParameter("edition");
		String dispatchdd = request.getParameter("dispatchdd");
		System.out.println(dispatchdd);
		String taxi_no = request.getParameter("taxi_no");
		int no_bundles= Integer.parseInt(request.getParameter("no_bundles"));
		int size_bundle= Integer.parseInt(request.getParameter("size_bundle"));
		String sql="insert into dispatch_detail" +
		   "(a_code,edition,taxi_no,no_bundles,"
		   + "dispatch_date,no_copies_per_b)"+
		   "values( \'"+agentcode+"\', " +
					"\'"+edition+"\', " +
					"\'"+taxi_no +"\', " +
					"\'"+no_bundles+"\', " +
					"\'"+dispatchdd+"\', " +
					//"to_date(\'"+dispatchdd+"\',\'dd/mon/yyyy\') , " +
					"\'"+size_bundle+"\')";
System.out.println(sql);
		
		try {
			 conn = DBConnection.getConnection();
			if (conn == null) {
				response.sendRedirect("error.jsp");
			}
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
			if (i>0) {
			/*List list=new ArrayList();
			list.add(agentcode);
			list.add(no_bundles);
			list.add(size_bundle);*/
				List<ForLabelBean> list = new ArrayList<ForLabelBean>(); 				
					ForLabelBean labe = new ForLabelBean();
					labe.setAgentCode(agentcode);
					labe.setNobundles(no_bundles);
					labe.setSizebunde(size_bundle);
					list.add(labe);
			 request.setAttribute("lab", list);
			request.getRequestDispatcher("labelgenerate").forward(request, response);
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
