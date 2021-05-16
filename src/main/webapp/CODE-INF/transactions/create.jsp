<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.UUID"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Application Engineering</title>
</head>

<body>
	<% 
		UUID user = UUID.fromString(request.getParameter("user")); 
		UUID book = UUID.fromString(request.getParameter("book"));
		String dateAsString = request.getParameter("date");
		java.util.Date date1 = new java.text.SimpleDateFormat("dd.MM.yyyy").parse(dateAsString);
		
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		
		UUID id = UUID.randomUUID();
		
		PreparedStatement pst= c.prepareStatement("INSERT INTO books_users (id, user_id, book, return_date) VALUES (?, ?, ?, ?);");
		pst.setObject(1, id);
		pst.setObject(2, user);
		pst.setObject(3, book);
		
		java.sql.Date date2 = new java.sql.Date(date1.getTime());
		pst.setDate(4, date2);
		
		pst.execute();
		
		response.sendRedirect("index.jsp");
	%>
</body>

</html>