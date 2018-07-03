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

public class UnsoldServlet extends HttpServlet{
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
	        try {
				Connection conn = DBConnection.getConnection();
				if (conn == null) {
					response.sendRedirect("error.jsp");
				  }
			    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			    String query="select * from agent";
			    ResultSet rs=stmt.executeQuery(query);
				request.setAttribute("x4", rs);
			    RequestDispatcher rd=request.getRequestDispatcher("unsoldorder.jsp");
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
