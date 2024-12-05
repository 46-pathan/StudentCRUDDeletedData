<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager,java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Form</title>
</head>
<body>
<%
	Connection conn=null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/newmydb","root","123456");
		session.setAttribute("conn", conn);
	}catch(ClassNotFoundException | SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>