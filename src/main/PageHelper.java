package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.jsp.JspWriter;

public class PageHelper {
	public static void Start(PrintWriter out, String title) {
		out.println("<html>");
		out.println("<body>");
		out.println("<head>");
		out.println("<title>");
		out.println(title);
		out.println("</title>");
		out.println("</head>");
	}
	public static void End(PrintWriter out) {
		out.println("</body>");
		out.println("</html>");
	}
	public static void NavBar(PrintWriter out) {
		out.println("Home");
		out.println("Search");
		out.println("Sitemap");
		out.println("Contact Us");
	}
	public static void inTd(JspWriter out, String inside) throws IOException {
		out.println("<td>");
		out.println(inside);
		out.println("</td>");
	}
}
