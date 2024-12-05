<%@ include file="dbConnection.jsp" %>
<%@ page import="java.sql.Statement, java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Data</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container"> 
<h2>Students List</h2> 
<table class="table table-striped"> 
	<thead> 
	<tr> 
	<th>ID</th> 
	<th>First Name</th> 
	<th>Last Name</th> 
	<th>Email</th> 
	<th>Mobile</th> 
	<th>Gender</th> 
	<th>Password</th> 
	<th>Actions</th> 
	</tr> 
	</thead> 
<tbody> 
<% 
conn = (Connection) session.getAttribute("conn"); 
if (conn != null) { 
	Statement stmt = conn.createStatement(); 
	ResultSet rs = stmt.executeQuery("select * from students"); 
	while (rs.next()) { 
	%> 
	<tr> 
	<td><%= rs.getInt("id") %></td> 
	<td><%= rs.getString("fname") %></td> 
	<td><%= rs.getString("lname") %></td> 
	<td><%= rs.getString("email") %></td> 
	<td><%= rs.getString("mobile") %></td> 
	<td><%= rs.getString("gender") %></td> 
	<td><%= rs.getString("password") %></td> 
	<td> 
	<a href="editStudent.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a> 
	<a href="MyServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a> 
	</td> 
	</tr> 
	<% 
	} 
	}%> 
	</tbody> 
	</table> 
	</div>
</body>
</html>