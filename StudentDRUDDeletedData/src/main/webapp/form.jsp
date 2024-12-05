<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Form</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container"> 
	<h2>Student Form</h2> 
	<form action="MyServlet" method="post" id="studentForm"> 
		<div class="mb-3"> 
			<label for="fname" class="form-label">First Name</label> 
			<input type="text" class="form-control" id="fname" name="fname" required> 
			</div> 
		<div class="mb-3"> 
			<label for="lname" class="form-label">Last Name</label> 
			<input type="text" class="form-control" id="lname" name="lname" required> 
			</div> 
		<div class="mb-3"> 
			<label for="email" class="form-label">Email</label> 
			<input type="email" class="form-control" id="email" name="email" required> 
			</div> 
		<div class="mb-3"> 
			<label for="mobile" class="form-label">Mobile</label> 
			<input type="text" class="form-control" id="mobile" name="mobile" required> 
			</div> 
		<div class="mb-3"> 
			<label for="gender" class="form-label">Gender</label><br> 
			<input type="radio" id="male" name="gender" value="Male" required> Male<br> 
			<input type="radio" id="female" name="gender" value="Female" required> Female </div> 
		<div class="mb-3"> 
			<label for="password" class="form-label">Password</label> 
			<input type="password" class="form-control" id="password" name="password" required> 
			</div> 
		<button type="submit" class="btn btn-primary">Submit</button> 
	</form> 
</div>

<script> 
	document.getElementById('studentForm').addEventListener('submit', function(event) { 
	var form = this; 
	var emailPattern = "[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"; 
	var passwordPattern = "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$"; 
	var email = form.email.value; 
	var password = form.password.value; 
	if (!emailPattern.test(email)) { 
		alert('Invalid email format.'); 
		event.preventDefault(); 
		} 
	if (!passwordPattern.test(password)) { 
		alert('Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character, and be at least 6 characters long.'); 
		event.preventDefault(); 
		} 
	}); 
</script>

</body>
</html>