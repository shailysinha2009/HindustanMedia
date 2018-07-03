package com.hindustan.servlet;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

import com.util.DBConnection;
public class ListInvoice extends HttpServlet{
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
		String agcode = request.getParameter("agcode");
	        try {
				Connection conn = DBConnection.getConnection();
				if (conn == null) {
					response.sendRedirect("error.jsp");
				  }
			    Statement stmt=conn.createStatement();
			    String query="select * from invoice where a_code="+agcode;
			    ResultSet rs=stmt.executeQuery(query);
				request.setAttribute("invo", rs);
			    RequestDispatcher rd=request.getRequestDispatcher("listinvoice.jsp");
			    rd.forward(request,response);
			    rs.close();
			    stmt.close();
			    conn.close();
				}
	      catch(Exception e){
	    	  System.out.println(e);
	      }
	      finally{
	    	  System.out.println("everything is ok");
	      }
	        
	  }
}
