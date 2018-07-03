package com.web;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class OnServletLogin extends HttpServlet {
   public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
	   response.setContentType("text/html");
	   PrintWriter pw=response.getWriter();
	   String user=request.getParameter("userName");
	   String pass=request.getParameter("userPassword");
	   if(user.equals("htcompany")&&pass.equals("hindustancomp"))
	   {
		   RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
	       rd.forward(request, response);
	   }
	   else
	   {
		   RequestDispatcher rd=request.getRequestDispatcher("loginfail.jsp");
           rd.forward(request, response);
	   }
   }
}
