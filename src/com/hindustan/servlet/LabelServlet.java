package com.hindustan.servlet;
import ht.Agent;
import ht.Printord;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.List;

import com.util.DBConnection;
public class LabelServlet extends HttpServlet{
	public void service (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	     List<ForLabelBean> list=(List<ForLabelBean>)request.getAttribute("lab");
	     ForLabelBean label1=list.get(0);
	     String acode=label1.getAgentCode();
	     Agent agnt=new Agent();
	     try {
				Connection conn = DBConnection.getConnection();
				if (conn == null) {
					response.sendRedirect("error.jsp");
				  }
			    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			    String query="select a_name,edition from agent where a_code="+ acode;
			    ResultSet rs=stmt.executeQuery(query);
			    while(rs.next()){
			    	  agnt.setAgentName(new String(rs.getString("a_name")));
			    	  agnt.setEdition(new String(rs.getString("edition")));
			    }
			    request.setAttribute("ob",agnt);
			    request.setAttribute("li",list);
			    RequestDispatcher rd=request.getRequestDispatcher("labelprint.jsp");
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
	

