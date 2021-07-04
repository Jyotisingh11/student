<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "student";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
%>
<html>
<body>
<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td><a href="add.jsp">add</a></td></tr>
<tr>
<td>STUDENT NO</td>
<td>STUDENT NAME</td>
<td>STUDENT DOB</td>
<td>STUDENT DOJ</td>
<td>update</td>

<td>delete</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student";
rs = statement.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("Student_no") %></td>
<td><%=rs.getString("Student_name") %></td>
<td><%=rs.getString("Student_dob") %></td>
<td><%=rs.getString("Student_doj") %></td>

<td><a href="update.jsp?Student_no=<%=rs.getString("Student_no")%>">update</a></td>

<td><a href="delete.jsp?Student_no=<%=rs.getString("Student_no")%>">delete</a></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
