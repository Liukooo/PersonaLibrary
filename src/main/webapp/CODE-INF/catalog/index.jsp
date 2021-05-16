<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Library home</title>
</head>

<body>
	<header id="header">
		<h1>Catalog of Liuk library</h1>
	</header>
	
	<%
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		PreparedStatement pst = c.prepareStatement("SELECT id, title, year FROM books");
		ResultSet result = pst.executeQuery();
	%>
	
	<section id="mainBox">
		<table id="mainTable">
			<tr>
				<th>Title</th>
				<th>Year of publication</th>		
			</tr>

			<%
				while (result.next()) {
					String line = "<tr><td id='title'>$title</td><td>$year</td><td>" + 
							"<a href='modify.jsp?book=" + result.getString("id") + "'><img src='../img/change.png' alt='Modify' width='25' height='25'></a></td><td>" + 
							"<a href='delete.jsp?book=" + result.getString("id") + "'><img src='../img/bin.png' alt='Delete' width='25' height='25'></a></td></tr>";
					line = line.replace("$title", result.getString("title"));
					line = line.replace("$year", result.getString("year"));
					out.println(line);
				} c.close();
			%>
		
		</table>
	</section>
	
	<br/>
	
	<form action="new.jsp" id="link">
			<input type="submit" value="Add new Book">
	</form>
	
	<br/>
	
	<form action="../transactions/index.jsp" id="link">
		<input type="submit" value="Go to Transaction page">
	</form>
</body>

</html>