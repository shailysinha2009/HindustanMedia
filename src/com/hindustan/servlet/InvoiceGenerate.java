package com.hindustan.servlet;
import ht.Agent;
import ht.Printord;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import com.hindustan.servlet.AgentBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;
public class InvoiceGenerate extends HttpServlet{
	public void service (HttpServletRequest request, HttpServletResponse response) throws IOException{
		Connection conn=null;
		Statement stmt = null;
		String agentCD=request.getParameter("agentCD");
        String edition = request.getParameter("edition");
		String fromdate = request.getParameter("fromdate");
		DateFormat format=new SimpleDateFormat("dd/mm/yy",Locale.ENGLISH);
		Date fromdatee;
		try {
			fromdatee = format.parse(fromdate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String tilldate = request.getParameter("tilldate");
		Date tilldatee;
		try {
			tilldatee = format.parse(tilldate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			 conn = DBConnection.getConnection();
			if (conn == null) {
				response.sendRedirect("error.jsp");
			}
			Statement stmt1=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    String query="select total_money from print_order where a_code="+ agentCD+"and to_date(issue_date,'dd/mm/yy')>=to_date('"+fromdate+"','dd/mm/yy')and to_date(issue_date,'dd/mm/yy')<=to_date('"+tilldate+"','dd/mm/yy')";
		    ResultSet rs=stmt1.executeQuery(query);
		   /* Printord priord=new Printord();
		    while(rs.next()){
			    priord.setTotalmon(rs.getFloat("sum(toal_money)"));
			    }*/
			    float monthtotal = 0;
		    List<Printord> list = new ArrayList<Printord>();
		    while(rs.next()){
		    	Printord priord=new Printord();
			    priord.setTotalmon(rs.getFloat("total_money"));
			    list.add(priord);
				}
		    for (int j=0; j<list.size(); j++) { 
		    	Printord priord1 = list.get(j);
		        monthtotal=monthtotal + priord1.getTotalmon();
		    }
		    Statement stmt2=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    String query2="select money_returned from unsold_paper where a_code="+ agentCD+"and to_date(date_order,'dd/mm/yy')>=to_date('"+fromdate+"','dd/mm/yy')and to_date(date_order,'dd/mm/yy')<=to_date('"+tilldate+"','dd/mm/yy')";
		    ResultSet rs2=stmt2.executeQuery(query2);
		   /* Printord pri=new Printord();
		    while(rs.next()){
			    pri.setMoneyreturn(rs.getFloat("sum(money_returned)"));
			    } */  
		    float monthreturn=0;
		    List<Printord> list2 = new ArrayList<Printord>();
		    while(rs2.next()){
		    	Printord pri=new Printord();
			    pri.setMoneyreturn(rs2.getFloat("money_returned"));
			    list2.add(pri);
				}
		    for (int k=0; k<list2.size(); k++) { 
		    	Printord pri1 = list2.get(k);
		    	monthreturn=monthreturn + pri1.getMoneyreturn();
		    }
		    float monthpay=monthtotal-monthreturn;
		    Statement stmt3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    String query3="select a_name from agent where a_code="+ agentCD;
		    ResultSet rs3=stmt3.executeQuery(query3);
		    Agent agnt=new Agent();
		    while(rs3.next()){
		    	  agnt.setAgentName(new String(rs3.getString("a_name")));
		    }
		    String sql="insert into invoice" +
					   "(a_code,edition,total_money,"
					   + "money_returned,date_range1,date_range2,total_omoney)"+
					   "values( \'"+agentCD+"\', " +
								"\'"+edition+"\', " +
								"\'"+monthtotal+"\', " +
								"\'"+monthreturn+"\', " +
								"to_date(\'"+fromdate+"\',\'dd/mon/yyyy\') , " +
								"to_date(\'"+tilldate+"\',\'dd/mon/yyyy\') , " +
								"\'"+monthpay+"\')";
			System.out.println(sql);
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
			if (i>0) {
				List<InvoiceBean> l1 = new ArrayList<InvoiceBean>(); 				
				InvoiceBean invo = new InvoiceBean();
				invo.setAgntcd(agentCD);
				invo.setEdii(edition);
				invo.setFromdd(fromdate);
				invo.setTilldd(tilldate);
				invo.setMontotal(monthtotal);
				invo.setMonreturn(monthreturn);
				invo.setMonpay(monthpay);
				l1.add(invo);
		 request.setAttribute("inv", l1);
		 request.setAttribute("obb",agnt);
			request.getRequestDispatcher("invoice.jsp").forward(request, response);
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
