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
public class Listagent extends HttpServlet{
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
  {
        try {
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				response.sendRedirect("error.jsp");
			  }
		    Statement stmt=conn.createStatement();
		    String query="select * from agent";
		    ResultSet rs=stmt.executeQuery(query);
			request.setAttribute("x1", rs);
		    RequestDispatcher rd=request.getRequestDispatcher("listAgent.jsp");
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