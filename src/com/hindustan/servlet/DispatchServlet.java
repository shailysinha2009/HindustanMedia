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

import ht.Agent;
import ht.Printord;

import com.util.DBConnection;

public class DispatchServlet extends HttpServlet{
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
			String agentcode=(String)request.getAttribute("x10");
			String issu_date=(String)request.getAttribute("xx");
			Printord pro=new Printord();
	        try {
				Connection conn = DBConnection.getConnection();
				if (conn == null) {
					response.sendRedirect("error.jsp");
				  }
			    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			    String query="select * from print_order where a_code="+ agentcode;
			    ResultSet rs=stmt.executeQuery(query);
			    while(rs.next()){
			    	  pro.setAc(new String(rs.getString("a_code")));
			    	  pro.setEdi(new String(rs.getString("edition")));
			    }
			    request.setAttribute("x11",pro);
			    request.setAttribute("xx2", issu_date);
			    RequestDispatcher rd=request.getRequestDispatcher("dispatchdetail.jsp");
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
