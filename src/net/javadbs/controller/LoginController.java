package net.javadbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javadbs.model.Student;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Server at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DecimalFormat decimalFormat = new DecimalFormat("0.00");
		List<Student> studentList = new ArrayList<>();
			
	    // Add hardcoded student data to the list
	    studentList.add(new Student("Dep 1", "S1", 35, "John"));
	    studentList.add(new Student("Dep 1", "S2", 70, "May"));
	    studentList.add(new Student("Dep 1", "S3", 60, "Yuki"));
	    studentList.add(new Student("Dep 1", "S4", 90, "Ahmad"));
	    
	    studentList.add(new Student("Dep 2", "S5", 30, "Bolton"));
	    
	    studentList.add(new Student("Dep 3", "S6", 32, "Bruce"));
	    studentList.add(new Student("Dep 3", "S7", 70, "Aaron"));
	    studentList.add(new Student("Dep 3", "S8", 20, "Edrick"));
	    
	    // Calculate the pass %
	    double firstTotal = 0;
	    double secondTotal = 0;
	    double thirdTotal = 0;
	    double firstCount = 0;
	    double secondCount = 0;
	    double thirdCount = 0;
	    for (Student std : studentList) {
	    	
	    	int mark = std.getMark();
	    	
	    	if (std.getDepartment().equals("Dep 1")) {
	    		firstTotal += 1;
	    		
	    		if(mark >= 40) {
	    			firstCount += 1;
	    		}
	    	} else if(std.getDepartment().equals("Dep 2")) {
	    		secondTotal += 1;
	    		
	    		if(mark >= 40) {
	    			secondCount += 1;
	    		}
	    	} else if(std.getDepartment().equals("Dep 3")) {
	    		thirdTotal += 1;
	    		
	    		if(mark >= 40) {
	    			thirdCount += 1;
	    		}
	    	}
	    }
	    
	    String firstPass = decimalFormat.format((firstCount / firstTotal) * 100);
	    String secondPass = decimalFormat.format((secondCount / secondTotal) * 100);
	    String thirdPass = decimalFormat.format((thirdCount / thirdTotal) * 100);
	    	    
	    // Set the studentList, firstPass, secondPass and thirdPass as a request attribute
        request.setAttribute("studentList", studentList);
        request.setAttribute("firstPass", firstPass.replace(".00", ""));
        request.setAttribute("secondPass", secondPass.replace(".00", ""));
        request.setAttribute("thirdPass", thirdPass.replace(".00", ""));

		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/welcome.jsp");
		dispatcher.forward(request, response);
	}

}
