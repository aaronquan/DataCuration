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
	if(agency != ""){
		String[] words = agency.split(" ");
		if(first){
			for(News n: list){
				if(n.matchAgency(words)){
					results.add(n);
				}
			}
			first = false;
		}else{
			list = results;
			results = new ArrayList<News>();
			for(News n: list){
				if(n.matchAgency(words)){
					results.add(n);
				}
			}
		}
	}
	if(city != ""){
		String[] words = city.split(" ");
		if(first){
			for(News n: list){
				if(n.matchCity(words)){
					results.add(n);
				}
			}
			first = false;
		}else{
			list = results;
			results = new ArrayList<News>();
			for(News n: list){
				if(n.matchCity(words)){
					results.add(n);
				}
			}
		}
	}
	if(keywords != ""){
		String[] words = keywords.split(" ");
		if(first){
			for(News n: list){
				if(n.matchKeywords(words)){
					results.add(n);
				}
			}
			first = false;
		}else{
			list = results;
			results = new ArrayList<News>();
			for(News n: list){
				if(n.matchKeywords(words)){
					results.add(n);
				}
			}
		}
	}
	
	String offset = request.getParameter("offset");
	int i = 0;
	if(offset != null){
		i = Integer.parseInt(offset);
	}
	for(int j = i; j < i + 10; j++){
		if(j > results.size()-1) break;
		if(j < 0) break;
		News n = results.get(j);
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
<%
	if(i > 0){
		out.println("<form action='results.jsp' style='float: left;'>");
		out.println("<input type='hidden' name='headline' value='"+hlSearch+"'>");
		out.println("<input type='hidden' name='month' value='"+month+"'>");
		out.println("<input type='hidden' name='year' value='"+year+"'>");
		out.println("<input type='hidden' name='agency' value='"+agency+"'>");
		out.println("<input type='hidden' name='city' value='"+city+"'>");
		out.println("<input type='hidden' name='keywords' value='"+keywords+"'>");
		out.println("<input type='hidden' name='offset' value='"+Integer.toString(i-10)+"'>");
		out.println("<input type=submit value='Prev'>");
		out.println("</form>");
		
	}
%>
<form action="results.jsp">
<%
	out.println("<input type='hidden' name='headline' value='"+hlSearch+"'>");
	out.println("<input type='hidden' name='month' value='"+month+"'>");
	out.println("<input type='hidden' name='year' value='"+year+"'>");
	out.println("<input type='hidden' name='agency' value='"+agency+"'>");
	out.println("<input type='hidden' name='city' value='"+city+"'>");
	out.println("<input type='hidden' name='keywords' value='"+keywords+"'>");
	out.println("<input type='hidden' name='offset' value='"+Integer.toString(i+10)+"'>");
%>
<input type=submit value='Next'>
</form>
</body>
</html>