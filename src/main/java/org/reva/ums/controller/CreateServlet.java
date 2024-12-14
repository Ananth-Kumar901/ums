package org.reva.ums.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/create")
public class CreateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String password = req.getParameter("password");
		String role = req.getParameter("role");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/umsystem", "root", "Ananth@2025");
			PreparedStatement ps = con.prepareStatement("insert into ums values(?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setLong(4, phone);
			ps.setString(5, role);
			ps.setString(6, password);
			
			int row = ps.executeUpdate();
			if (row == 1) {
				resp.getWriter().write("<html><body><h3 id='abc'>Account Created Successfully Please Login</h3></body></html>");
				req.getRequestDispatcher("login.jsp").include(req, resp);
			} else {
				resp.getWriter()
						.write("<html><body><h3>Something Went Wrong Please Try Again Later..</h3></body></html>");
				req.getRequestDispatcher("create.jsp").include(req, resp);
			}
			ps.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
