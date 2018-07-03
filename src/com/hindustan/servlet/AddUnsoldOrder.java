package com.hindustan.servlet;
import ht.Printord;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.hindustan.servlet.AgentBean;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;
public class AddUnsoldOrder extends HttpServlet{
	public void service (HttpServletRequest request, HttpServletResponse response) throws IOException{
		Connection conn=null;
		Statement stmt = null;
		String agentcode=request.getParameter("agentcode");
        String edition = request.getParameter("edition");
		String avaDate = request.getParameter("avaDate");
		DateFormat format=new SimpleDateFormat("dd/mm/yy");
		try {
			Date datee=format.parse(avaDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int unsolcopies= Integer.parseInt(request.getParameter("unsolcopies"));
		System.out.println(unsolcopies);
		int returnunit=Integer.parseInt(request.getParameter("returnunit"));
		System.out.println(returnunit);
		Printord pro=new Printord();
		
		try {
			 conn = DBConnection.getConnection();
			if (conn == null) {
				response.sendRedirect("error.jsp");
			}
			Statement stmt1=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    String query="select rate from print_order where a_code="+ agentcode+"and to_date(issue_date,'dd/mm/yy')=to_date('"+avaDate+"','dd/mm/yy')";
		    ResultSet rs=stmt1.executeQuery(query);
		    while(rs.next()){
		    pro.setRatee(rs.getFloat("rate"));
		    }
		    float rate=pro.getRatee();
		    System.out.println(rate);
		float moneyreturn=rate*((float)(unsolcopies*returnunit)/100);
		System.out.println(moneyreturn);
		String sql="insert into unsold_paper" +
				   "(a_code,edition,unsold_copies,"
				   + "date_order,money_returned)"+
				   "values( \'"+agentcode+"\', " +
							"\'"+edition+"\', " +
							"\'"+unsolcopies+"\', " +
							"to_date(\'"+avaDate+"\',\'dd/mon/yyyy\') , " +
							"\'"+moneyreturn+"\')";
		System.out.println(sql);
				
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
			if (i>0) {
			request.getRequestDispatcher("orderplaced.jsp").forward(request, response);
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
