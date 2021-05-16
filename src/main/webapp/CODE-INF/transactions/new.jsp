<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add new Loan</title>
</head>

<body>
	<%
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		
		PreparedStatement pst= c.prepareStatement("SELECT id, name FROM users");
		ResultSet result = pst.executeQuery();
		
		PreparedStatement pst2= c.prepareStatement("SELECT id, title FROM books");
		ResultSet result2 = pst2.executeQuery();
	%>

	<h2>New Loan:</h2>
	
	<form action="create.jsp" method="get">

		<p>Username: 
			<select name="user" id="user">
				<%
					while (result.next())
					out.println("<option value='" + result.getString("id") + "'>" + result.getString("name") + "</option>");
				%>
			</select>
		</p>
		
		<p>Title of book: 
			<select name="book" id="book">
				<%
					while (result2.next())
					out.println("<option value='" + result2.getString("id") + "'>" + result2.getString("title") + "</option>");
				%>
			</select>
		</p>
		
		<p>Return date: 
			<input type="text" name="date" id="return">
		</p>
		
		<div>
			<input type="submit" value="Save">
			<input type="reset" value="Cancel">
			<input type="button" onclick="location.href='index.jsp'" value="Go back">
		</div>
	</form>
</body>

</html>