<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="main.*, java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contacts</title>
</head>
<body>
<form action='homepage.jsp' method='get'>
<input type='submit' value='Back to Home Page'>
</form>
<h1>Contacts</h1>
<table border="">
<tr>
<th>Name</th>
<th>Email</th>
<th>Office</th>
<th>Role</th>
<th>Number</th>
</tr>
<%
	NewsStore ns = (NewsStore)session.getAttribute("newsStore");
	List<Contact> cons = ns.getContacts();
	for(Contact c: cons){
		out.println("<tr>");
		PageHelper.inTd(out, c.getName());
		PageHelper.inTd(out, c.getEmail());
		PageHelper.inTd(out, c.getOffice());
		PageHelper.inTd(out, c.getRole());
		PageHelper.inTd(out, c.getNumber());
		out.println("</tr>");
	}
%>
</table>
</body>
</html>