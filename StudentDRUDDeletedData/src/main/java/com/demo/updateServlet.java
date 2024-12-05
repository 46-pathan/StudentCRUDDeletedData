package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class updateServlet
 */
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id")); 
		String fname = request.getParameter("fname"); 
		String lname = request.getParameter("lname"); 
		String email = request.getParameter("email"); 
		String mobile = request.getParameter("mobile"); 
		String gender = request.getParameter("gender"); 
		String password = request.getParameter("password"); 
		Connection conn = null; 
		PreparedStatement ps = null; 
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/newmydb", "root", "123456"); 
			String sql = "update students set fname=?, lname=?, email=?, mobile=?, gender=?, password=? where id=?"; 
			ps = conn.prepareStatement(sql); 
			ps.setString(1, fname); 
			ps.setString(2, lname); 
			ps.setString(3, email); 
			ps.setString(4, mobile); 
			ps.setString(5, gender); 
			ps.setString(6, password); 
			ps.setInt(7, id); 
			int rowsUpdated = ps.executeUpdate(); 
			if (rowsUpdated > 0) { 
				response.sendRedirect("showStudent.jsp"); 
				} 
			else { 
				response.getWriter().println("Failed to update student information."); 
				} 
			} catch (Exception e) { 
				e.printStackTrace(); 
				response.getWriter().println("An error occurred: " + e.getMessage()); 
			} 
	}

}
