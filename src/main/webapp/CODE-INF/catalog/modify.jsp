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
	<title>Book Modifier</title>
</head>

<body>
	<% 
		UUID bookToModify = UUID.fromString(request.getParameter("book"));
		
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		
		PreparedStatement pst = c.prepareStatement("SELECT id, title, year FROM books WHERE id = ?");
		pst.setObject(1, bookToModify);
		
		String currentID = "";
		String currentTitle = "";
		int currentYear = 0;
	
		ResultSet result = pst.executeQuery();
		if (result.next()){
			currentID = result.getString(1);
			currentTitle = result.getString(2);
			currentYear = result.getInt(3);
		}
	%>
	<h2>Book modifier:</h2>
	<form action="update.jsp" method="get">
	
		<input type="hidden" name="id" value="<%= currentID%>">
		
		<p>Title:
			<input type="text" name="title" value="<%= currentTitle%>">
		</p>
		
		<p>Year:
			<input type="text" name="year" value="<%= currentYear%>">
		</p>
		
		<br/>
		
		<div>
			<input type="submit" value="Save">
			<input type="reset" value="Cancel">
			<input type="button" onclick="location.href='index.jsp'" value="Go back">
		</div>
	</form>
</body>

</html>