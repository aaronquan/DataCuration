<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
<form action='homepage.jsp' method='get'>
<input type='submit' value='Back to Home Page'>
</form>
<h1>Search News</h1>
<form action='results.jsp'>
Headline: <input type='text' name='headline'><br>
Month: <input type='text' name='month'><br>
Year: <input type='text' name='year'><br>
Agency: <input type='text' name='agency'><br>
City: <input type='text' name='city'><br>
Keywords: <input type='text' name='keywords'><br>
<input type='submit' value='Search'>
</form>
</body>
</html>