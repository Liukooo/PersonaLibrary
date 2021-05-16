<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add new Book</title>
</head>

<body>
	<h2>New Book:</h2>
	<form action="create.jsp" method="get">
		<p>Title:
			<input type="text" name="title">
		</p>
		
		<p>Year of publication:
			<input type="text" name="year">
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