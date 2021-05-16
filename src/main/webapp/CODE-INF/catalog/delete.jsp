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
	<title>Delete Page</title>
</head>

<body>
	<% 
		UUID bookToDelete = UUID.fromString(request.getParameter("book"));
		
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		
		PreparedStatement pst = c.prepareStatement("DELETE FROM books WHERE id=?");
		pst.setObject(1, bookToDelete);
		
		pst.execute();
		
		response.sendRedirect("index.jsp");
	%>
</body>

</html>