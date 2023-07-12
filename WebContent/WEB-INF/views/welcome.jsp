<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.javadbs.model.Student" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Student Management System</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
	        table,
	        th,
	        td {
	            border: 1px solid black;
	            border-collapse: collapse;
	            padding: 6px;
	            text-align: center;
	        }
    </style>
    
    <div class="modal fade" id="studentModal">
    	<div class="modal-dialog">
        	<div class="modal-content">
            	<div class="modal-header">
                	<h5 class="modal-title" id="studentModalLabel">Student Name</h5>
                	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    	<span aria-hidden="true">&times;</span>
                	</button>
            	</div>
            	<div class="modal-body">
                	<p id="studentName"></p>
            	</div>
        	</div>
    	</div>
	</div>
	
	<script>
	    function showStudentName(studentName) {
	        var nameElement = document.getElementById("studentName");
	        nameElement.innerHTML = studentName;
	
	        // Show the modal
	        $("#studentModal").modal("show");
	    }
	</script>
</head>
<body>
	<% 
		String userID = request.getParameter("userID");
	%>
	<center>
		<form style="border: 1px black solid; width: 600px; padding: 0 50px 50px 50px; margin: 10px"">
			<p style="font-size: 40px; font-weight: bold">Welcome <%= userID %></p>
			
			<table border="1">
			  <tr>
			    <th>Department</th>
			    <th>Student ID</th>
			    <th>Marks</th>
			    <th>Pass %</th>
			  </tr>
			  
			   <% 
		            boolean firstRow = true;
				   	boolean secondRow = true;
				   	boolean thirdRow = true;
				   	
				   	//Retreive studentList from previously set by the servlet "LoginController.java" 
				   	ArrayList<Student> studentList = (ArrayList<Student>)request.getAttribute("studentList"); 
				   	String firstPass = (String)request.getAttribute("firstPass");
				   	String secondPass = (String)request.getAttribute("secondPass");
				   	String thirdPass = (String)request.getAttribute("thirdPass");
	
		            for (Student std : studentList) { 
		        %>
		            <tr>
		                <% if (std.getDepartment() == "Dep 1" && firstRow) { %>
		                    <td rowspan="4"><%= std.getDepartment() %></td>
		                <% } %>
		                <% if (std.getDepartment() == "Dep 2" && secondRow) { %>
		                    <td rowspan="1"><%= std.getDepartment() %></td>
		                <% } %>
		                <% if (std.getDepartment() == "Dep 3" && thirdRow) { %>
		                    <td rowspan="3"><%= std.getDepartment() %></td>
		                <% } %>
		                <td style="color: blue ; text-decoration: underline; cursor: pointer" onclick="showStudentName('<%= std.getStudentName() %>')"><%= std.getStudentID() %></td>
		                <td><%= std.getMark() %></td>
		                
		                <% if (std.getDepartment() == "Dep 1" && firstRow) { %>
		                	<td rowspan="4"><%= firstPass %></td>
		                   	<% firstRow = false; %>
		                <% } %>
		                <% if (std.getDepartment() == "Dep 2" && secondRow) { %>
		                 	<td rowspan="1"><%= secondPass %></td>
		                  	<% secondRow = false; %>
		                <% } %>
		                <% if (std.getDepartment() == "Dep 3" && thirdRow) { %>
		                	<td rowspan="3"><%= thirdPass %></td>
		                  	<% thirdRow = false;  %>
		                <% } %>
		                
		            </tr>
		        <% } %>
			</table>
		</form>
	</center>
</body>
</html>