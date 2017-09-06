<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="main.*, java.util.*, org.w3c.dom.*, javax.xml.parsers.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<form action='search.jsp' method='get' style="float: left;">
<input type='submit' value='Search'>
</form>
<form action='contacts.jsp' method='get'>
<input type='submit' value='ContactUs'>
</form>
<table border="">
<tr>
<th>Headline</th>
<th>Last Modified</th>
<th>Last Modified By</th>
<th>Full Article</th>
</tr>
<% 
	String numNews = request.getParameter("numNews");
	NewsStore ns = new NewsStore();
	ns.addNewsFromFile();
	session.setAttribute("newsStore", ns);
	List<News> newsList;
	if(numNews == null){
		newsList = ns.getNRandom(10);
	}
	else if(numNews.equals("all")){
		newsList = ns.getAllNews();
	}else if(numNews.matches("[0-9]+")){
		newsList = ns.getNRandom(Integer.parseInt(numNews));
	}else{
		newsList = ns.getNRandom(10);
	}
	for(News n: newsList){
		out.println("<tr>");
		PageHelper.inTd(out, n.getHeadline());
		PageHelper.inTd(out, n.getLastModified());
		PageHelper.inTd(out, n.getLastModifiedBy());
		out.println("<td>");
		out.println("<form action='article.jsp' method='get'>");
		out.println("<input type=hidden name='num' value='"+Integer.toString(n.getId())+"'>");
		out.println("<input type='submit' value='View Full Article'>");
		out.println("</form>");
		out.println("</td>");
		out.println("</tr>");
	}
%>
</table>
<form action='homepage.jsp' method='get'>
<select name='numNews'>
<option value='10'>10</option>
<option value='100'>100</option>
<option value='1000'>1000</option>
<option value='all'>All</option>
</select>
<input type="submit" value="Change Number of News Displayed">
</form>
</body>
</html>