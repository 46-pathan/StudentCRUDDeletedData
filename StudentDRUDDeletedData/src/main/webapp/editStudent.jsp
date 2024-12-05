<%@ include file="dbConnection.jsp" %> 
<%@ page import="java.sql.PreparedStatement, java.sql.ResultSet" %>
<% 
int id = Integer.parseInt(request.getParameter("id")); 
String fname = "", lname = "", email = "", mobile = "", gender = "", password = ""; 
conn = (Connection) session.getAttribute("conn"); 
if (conn != null) { 
	PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE id=?"); 
	ps.setInt(1, id); 
	ResultSet rs = ps.executeQuery(); 
	if (rs.next()) { 
		fname = rs.getString("fname"); 
		lname = rs.getString("lname"); 
		email = rs.getString("email"); 
		mobile = rs.getString("mobile"); 
		gender = rs.getString("gender"); 
		password = rs.getString("password"); 
		} 
	}
%>
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
		<h2>Edit Student Information</h2> 
		<form action="updateServlet" method="post"> 
			<input type="hidden" name="id" value="<%= id %>"> 
		<div class="mb-3"> 
			<label for="fname" class="form-label">First Name</label> 
			<input type="text" class="form-control" id="fname" name="fname" value="<%= fname %>" required> 
			</div> 
		<div class="mb-3"> 
			<label for="lname" class="form-label">Last Name</label> 
			<input type="text" class="form-control" id="lname" name="lname" value="<%= lname %>" required> 
			</div> 
		<div class="mb-3"> 
			<label for="email" class="form-label">Email</label> 
			<input type="email" class="form-control" id="email" name="email" value="<%= email %>" required> 
			</div> 
		<div class="mb-3"> 
			<label for="mobile" class="form-label">Mobile</label> 
			<input type="text" class="form-control" id="mobile" name="mobile" value="<%= mobile %>" required> 
			</div> 
		<div class="mb-3"> 
			<label for="gender" class="form-label">Gender</label><br> 
			<input type="radio" id="male" name="gender" value="Male" <%= gender.equals("Male") ? "checked" : "" %> required> Male<br> 
			<input type="radio" id="female" name="gender" value="Female" <%= gender.equals("Female") ? "checked" : "" %> required> Female 
			</div> 
		<div class="mb-3"> 
			<label for="password" class="form-label">Password</label> 
			<input type="password" class="form-control" id="password" name="password" value="<%= password %>" required> 
			</div> 
			<button type="submit" class="btn btn-primary">Update</button>
		</form>
</div>
</body>
</html>