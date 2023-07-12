<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Login Page</title>
	
	<script>
		$(document).ready(function() {
		  $("form").submit(function(e) {
		    // Prevent form submission
		    e.preventDefault();
		    
		    // Perform validation
		    var userID = $("input[name='userID']").val();
		    var password = $("input[name='password']").val();
		    
		    if (userID === "") {
		      alert("Please enter a User ID.");
		      return;
		    }
		    
		    if (password === "") {
		      alert("Please enter a Password.");
		      return;
		    }
		    
		    // If validation passes, submit the form
		    this.submit();
		  });
		});
	</script>
</head>
<body>
	<center>
	<form style="border: 1px black solid; width: 400px; padding: 0 50px 50px 50px" method="post" action="<%= request.getContextPath() %>/login">
		<p style="font-size: 40px; font-weight: bold">Login Page</p>
		
		User ID: <input type=text name =userID>
		<br> <br>
		
		Password: <input type=text name =password>
		<br> <br>
		<input type=submit value="Login">
	</form>
	</center>
</body>
</html>