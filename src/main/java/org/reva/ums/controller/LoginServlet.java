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

@WebServlet(urlPatterns = "/login")
public class LoginServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
	
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umsystem","root","Ananth@2025");
			PreparedStatement ps = con.prepareStatement("select * from ums where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) 
			{
				if(rs.getString(5).equals("ADMIN"))
				{
					req.setAttribute("rs", con.prepareStatement("select * from ums where role='USER'").executeQuery());
					resp.getWriter().write("<html><body><h3 id='abc'>Mr."+rs.getString(2)+" Welcome Back...</h3></body></html>");
					req.getRequestDispatcher("adminhome.jsp").include(req, resp);
				}
				else if(rs.getString(5).equals("USER"))
				{
					resp.getWriter().write("<html><body><h3>USER Login Successfull...</h3></body></html>");
					req.getRequestDispatcher("home.jsp").include(req, resp);
				}
			}
			else {
				resp.getWriter().write("<html><body><h3>Invalid Credentials</h3></body></html>");
				req.getRequestDispatcher("login.jsp").include(req, resp);	
			}
			rs.close();
			ps.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	
	}
}
