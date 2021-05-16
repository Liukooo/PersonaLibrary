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
	<title>Update Page</title>
</head>

<body>
	<% 
		UUID id = UUID.fromString(request.getParameter("id"));
		String newTitle = request.getParameter("title");
		int newYear = Integer.parseInt(request.getParameter("year"));
		
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		
		PreparedStatement pst = c.prepareStatement("UPDATE books SET title = ?, year = ? WHERE ID = ?");
		pst.setObject(3, id);
		pst.setString(1, newTitle);
		pst.setInt(2, newYear);
		
		pst.execute();
		
		response.sendRedirect("index.jsp");
	%>
</body>

</html>