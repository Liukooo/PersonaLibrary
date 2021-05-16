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
	<title>Loan Modifier</title>
</head>

<body>	
	<%
		UUID loanToModify = UUID.fromString(request.getParameter("loan")); 
		
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/aebi?user=postgres&password=Bxliuk01.";
		Connection c = DriverManager.getConnection(url);
		
		PreparedStatement pst = c.prepareStatement("SELECT id, name FROM users");
		ResultSet result = pst.executeQuery();
		
		PreparedStatement pst2= c.prepareStatement("SELECT id, title FROM books");
		ResultSet result2 = pst2.executeQuery();
		
		PreparedStatement pst3= c.prepareStatement("SELECT id, user_id, book, return_date FROM books_users WHERE id=?");
		pst3.setObject(1, loanToModify);
		
		String currentID="";
		String currentUser="";
		String currentBook="";
		String currentReturn="";
		
		ResultSet result3 = pst3.executeQuery();
		
		if(result3.next()) {
			currentID = result3.getString(1);
			currentUser = result3.getString(2);
			currentBook = result3.getString(3);
			
			java.sql.Date currentReturnAsDate = result3.getDate(4);
			currentReturn = new java.text.SimpleDateFormat("dd.MM.yyyy").format(currentReturnAsDate);
			
		}
	%>
	
	<h2>Loan modifier:</h2>
	<form action="update.jsp" method="get"> 
		<input type="hidden" name="id" value="<%= currentID%>">
		
		<p>Username:
			<select name="user" id="user">
				<%
					while (result.next()) {
						String toAdd ="";
						if (result.getString("id").equals(currentUser))
							toAdd = "selected";
						out.println("<option value='" + result.getString("id") + "'" + toAdd + ">" + result.getString("name") + "</option>");
					}
				%>
			</select>
		</p>
		
		<p>Title of book:
			<select name="book" id="book">
				<%
					while (result2.next()) {
						String toAdd = (result2.getString("id").equals(currentBook)) ?  "selected" : "";
						out.println("<option value='" + result2.getString("id") + "'" + toAdd + ">" + result2.getString("title") + "</option>");
					}
				%>
			</select>
		</p>
		
		<p>Return date:
			<input type="text" name="date" id="date" value="<%= currentReturn%>">
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