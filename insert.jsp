<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String Student_name=request.getParameter("Student_name");
String Student_dob=request.getParameter("Student_dob");
String Student_doj=request.getParameter("Student_doj");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("INSERT INTO  student(Student_name,Student_dob,Student_doj)VALUES ('"+Student_name+"','"+Student_dob+"','"+Student_doj+"')");

out.println("Data is successfully inserted!");

response.sendRedirect("index.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>