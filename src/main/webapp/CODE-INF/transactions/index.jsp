<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Transactions page</title>
</head>

<body>
	<header id="header">
		<h1>List of Loans</h1>
	</header>
	
	<%
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		PreparedStatement pst= c.prepareStatement("SELECT books_users.id, books.title AS book, users.name AS user, return_date FROM books_users "
													+"INNER JOIN books ON books.id = books_users.book "
													+"INNER JOIN users ON users.id = books_users.user_id ORDER BY return_date DESC"); 
		ResultSet result = pst.executeQuery();
	%>

	<section id="mainBox">
		<table id="mainTable">
			<tr>
				<th>Title of book</th>
				<th>Username</th>
				<th>Return date</th>
			</tr>

			<%
				while (result.next()){
					String line = "<tr><td>$book</td><td id='user'>$user</td><td>$return_date</td><td>" + 
							"<a href='modify.jsp?loan=" + result.getString("id") + "'><img src='../img/change.png' alt='Modify' width='25' height='25'></a></td><td>" + 
							"<a href='delete.jsp?loan=" + result.getString("id") + "'><img src='../img/bin.png' alt='Delete' width='25' height='25'></a></td></tr>";
					line = line.replace("$book", result.getString("book"));
					line = line.replace("$user", result.getString("user"));
					line = line.replace("$return_date", result.getString("return_date"));
					out.println(line);
				} c.close();
			%>

		</table>
	</section>
	
	<br/>
	
	<form action="new.jsp" id="link">
		<input type="submit" value="Add new Loan">
	</form>
	
	<br/>
	
	<form action="../catalog/index.jsp" id="link">
		<input type="submit" value="Go Back to Library home">
	</form>
</body>

</html>