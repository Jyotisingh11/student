<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String Student_no = request.getParameter("Student_no");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "Student";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student where Student_no="+Student_no;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-process.jsp">
<input type="hidden" name="Student_no" value="<%=resultSet.getString("Student_no") %>">

<br>
Student name:<br>
<input type="text" name="Student_name" value="<%=resultSet.getString("Student_name") %>">
<br>
Student_dob:<br>
<input type="date" name="Student_dob" value="<%=resultSet.getString("Student_dob") %>">
<br>
Student_doj:<br>
<input type="date" name="Student_doj" value="<%=resultSet.getString("Student_doj") %>">

<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>