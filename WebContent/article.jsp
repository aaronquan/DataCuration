<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="main.*, java.util.*" %>
<%@ page import="unsw.curation.api.tokenization.ExtractionKeywordImpl" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action='homepage.jsp' method='get'>
<input type='submit' value='Back to Home Page'>
</form>
<% 
	NewsStore ns = new NewsStore();
	ns.addNewsFromFile();
	int articleNum = Integer.parseInt(request.getParameter("num"));
	News news = ns.getNewsAtIndex(articleNum);
	out.println("<center><h1>");
	out.println(news.getHeadline());
	out.println("</h1></center>");
	out.println("Date Entered: "+news.getDateEntered()+"<br>");
	out.println("Entered By: "+news.getEnteredBy()+"<br>");
	out.println("Last Modified:");
	out.println(news.getLastModified()+"<br>");
	out.println("Last Modified By:");
	out.println(news.getLastModifiedBy()+"<br>");
	out.println("Agency: "+news.getAgency()+"<br>");
	out.println("City: "+news.getCity()+"<br>");
	List<String> cats = news.getCategories();
	if(!cats.isEmpty()){
		out.println("Categories:");
	}
	for(String s: cats){
		out.print(s+" ");
	}
	out.println("<br>");
	out.println("<br>");
	out.println(news.getContent());
	out.println("<br>");
	out.println("<br>");
	List<Contact> cons = news.getContacts();
	if(!cons.isEmpty()) out.println("Contacts: <br>");
	for(Contact c: cons){
		out.println("Name: "+c.getName()+"<br>");
		out.println("Email: "+c.getEmail()+"<br>");
		out.println("Office: "+c.getOffice()+"<br>");
		out.println("Role: "+c.getRole()+"<br>");
		out.println("Number: "+c.getNumber()+"<br>"+"<br>");
		
	}
	
%>
<form action='article.jsp' method='get'>
<% 
	out.println("<input type='hidden' name='num' value='"+Integer.toString(articleNum)+"'");
%>
<input type='submit' value='Extract Keywords'>
</form>
<form action='article.jsp' method='get'>
<% 
	out.println("<input type='hidden' name='num' value='"+Integer.toString(articleNum)+"'");
%>
<input type='submit' value='Extract People'>
</form>
<form action='article.jsp' method='get'>
<% 
	out.println("<input type='hidden' name='num' value='"+Integer.toString(articleNum)+"'");
%>
<input type='submit' value='Extract Organizations'>
</form>
<form action='article.jsp' method='get'>
<% 
	out.println("<input type='hidden' name='num' value='"+Integer.toString(articleNum)+"'");
%>
<input type='submit' value='Extract Locations'>

<%
	String extract = request.getParameter("extract");
	if(extract != null){
		
	}
%>
</form>
</body>
</html>