package com.hindustan.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

public class PrintServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "select edition, a_code from agent";
			rs = stmt.executeQuery(sql);
			List<AgentBean> list = new ArrayList<AgentBean>(); 
			
			while (rs.next()) {
				AgentBean agent = new AgentBean();
				agent.setAgentCode(rs.getString("a_code"));
				agent.setEdition(rs.getString("edition"));
				list.add(agent);
			}
			request.setAttribute("AGENT_CODE_LIST", list);
			request.getRequestDispatcher("printorder.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

}
