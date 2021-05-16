<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.UUID" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create Page</title>
</head>

<body>
	<% 
		String newTitle = request.getParameter("title");
		int newYear = Integer.parseInt(request.getParameter("year"));
		
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		
		UUID id = UUID.randomUUID();
		
		PreparedStatement pst = c.prepareStatement("INSERT INTO books (id, title, year) VALUES (?, ?, ?)");
		pst.setObject(1, id);
		pst.setString(2, newTitle);
		pst.setInt(3, newYear);
		
		pst.execute();
		
		response.sendRedirect("index.jsp");
	%>
</body>

</html>