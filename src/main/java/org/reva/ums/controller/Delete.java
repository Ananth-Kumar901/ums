package org.reva.ums.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/delete")
public class Delete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umsystem","root","Ananth@2025");
			PreparedStatement ps = con.prepareStatement("delete from ums where id=?");
			ps.setInt(1, id);
			int row = ps.executeUpdate();
			if(row==1)
			{
				resp.getWriter().write("<html><body><h3 id='abc'>User Deleted successfully... with Id : "+id+"</h3><body></html>");
				req.setAttribute("rs", con.prepareStatement("select * from ums where role='USER'").executeQuery());
				req.getRequestDispatcher("adminhome.jsp").include(req, resp);
			}
			ps.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}
}
