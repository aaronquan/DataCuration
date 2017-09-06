<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="main.*, java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
</head>
<body>
<form action='homepage.jsp' method='get'>
<input type='submit' value='Back to Home Page'>
</form>
<table border="">
<tr>
<th>Headline</th>
<th>Last Modified</th>
<th>Last Modified By</th>
<th>Full Article</th>
</tr>
<%
	NewsStore ns = new NewsStore();
	ns.addNewsFromFile();
	String hlSearch = request.getParameter("headline");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	String agency = request.getParameter("agency");
	String city = request.getParameter("city");
	String keywords = request.getParameter("keywords");
	
	List<News> list = ns.getAllNews();
	List<News> results = new ArrayList<News>();
	boolean first = true;
	if(hlSearch != ""){
		out.println("bleh");
		String[] words = hlSearch.split(" ");
		for(News n: list){
			if(n.matchHeadline(words)){
				results.add(n);
			}
		}
		first = false;
	}
	if(month != ""){
		if(first){
			for(News n: list){
				if(n.matchMonth(month)){
					results.add(n);
				}
			}
			first = false;
		}else{
			list = results;
			results = new ArrayList<News>();
			for(News n: list){
				if(n.matchMonth(month)){
					results.add(n);
				}
			}
		}
	}
	if(year != ""){
		if(first){
			for(News n: list){
				if(n.matchYear(year)){
					results.add(n);
				}
			}
			first = false;
		}else{
			list = results;
			results = new ArrayList<News>();
			for(News n: list){
				if(n.matchYear(year)){
					results.add(n);
				}
			}
		}
	}
	String offset = request.getParameter("offset");
	int i = 0;
	for(News n: results){
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
</form>
</body>
</html>