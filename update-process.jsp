<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/student";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String Student_no= request.getParameter("Student_no");
String Student_name=request.getParameter("Student_name");
String Student_dob=request.getParameter("Student_dob");
String Student_doj=request.getParameter("Student_doj");

if(Student_no != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql1="Update student set Student_name=?,Student_dob=?,Student_doj=? where Student_no="+Student_no;
ps = con.prepareStatement(sql1);

ps.setString(1, Student_name);
ps.setString(2, Student_dob);
ps.setString(3, Student_doj);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully"); 


response.sendRedirect("index.jsp");

}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql1)
{
request.setAttribute("error", sql1);
out.println(sql1);
}
}
%>