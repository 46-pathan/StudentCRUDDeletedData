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
import java.sql.ResultSet;

/**
 * Servlet implementation class MyServlet
 */
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			String sql = "insert into students (fname, lname, email, mobile, gender, password) values (?, ?, ?, ?, ?, ?)"; 
			ps = conn.prepareStatement(sql); 
			ps.setString(1, fname); 
			ps.setString(2, lname); 
			ps.setString(3, email); 
			ps.setString(4, mobile); 
			ps.setString(5, gender); 
			ps.setString(6, password); 
			int rows = ps.executeUpdate(); 
			if (rows> 0) { 
				response.sendRedirect("showStudent.jsp"); 
				} 
			else { 
				response.getWriter().println("failed insertion");
				} 
			} catch (Exception e) { 
				e.printStackTrace(); 
				response.getWriter().println("An error occurred: " + e.getMessage()); 
			}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")); 
		Connection conn = null; 
		PreparedStatement psSelect = null; 
		PreparedStatement psInsert = null; 
		PreparedStatement psDelete = null; 
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/newmydb", "root", "123456");  
			String selectSql = "select * from students where id=?"; 
			psSelect = conn.prepareStatement(selectSql); 
			psSelect.setInt(1, id); 
			ResultSet rs = psSelect.executeQuery(); 
			if (rs.next()) {
				String insertSql = "insert into deleted_students (fname, lname, email, mobile, gender, password) values (?, ?, ?, ?, ?, ?)"; 
				psInsert = conn.prepareStatement(insertSql); 
				psInsert.setString(1, rs.getString("fname")); 
				psInsert.setString(2, rs.getString("lname")); 
				psInsert.setString(3, rs.getString("email")); 
				psInsert.setString(4, rs.getString("mobile")); 
				psInsert.setString(5, rs.getString("gender")); 
				psInsert.setString(6, rs.getString("password")); 
				psInsert.executeUpdate(); 
				} 
			String deleteSql = "delete from students where id=?"; 
			psDelete = conn.prepareStatement(deleteSql); 
			psDelete.setInt(1, id); 
			int rowsDeleted = psDelete.executeUpdate(); 
			if (rowsDeleted > 0) { 
				response.sendRedirect("showStudent.jsp"); 
				} else { 
					response.getWriter().println("Failed to delete student."); 
					} 
			} catch (Exception e) { 
				e.printStackTrace(); 
			}
		
	}
	
}
