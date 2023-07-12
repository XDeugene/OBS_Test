package net.javadbs.model;

public class Student {
	private String department;
	private String studentID;
	private int mark;
	private String studentName;
	
	public Student(String department, String studentID, int mark, String studentName) {
		this.department = department;
		this.studentID = studentID;
        this.mark = mark;
        this.studentName = studentName;
    }
	
    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }
    
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
}
