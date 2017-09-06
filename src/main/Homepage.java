package main;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.digester.Digester;
import org.xml.sax.SAXException;


/**
 * Servlet implementation class Homepage
 */
@WebServlet("/Homepage")
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int numRecords;
	//private NewsRepository repo;
    /**
     * @throws IOException 
     * @see HttpServlet#HttpServlet()
     */
    public Homepage() throws IOException {
    	
        super();
        //repo = new NewsRepository();
        //Digester digester = new Digester();
		//digester.push(repo);
		//digester.addCallMethod("response/row/row", "addNews", 3);
		//digester.addCallParam("response/row/row/headline", 0);
		//digester.addCallParam("response/row/row/content", 1);
		//digester.addCallParam("response/row/row/ag", 2);
		//try {
		//	digester.parse(new File("C:\\Users\\Tony\\Documents\\UNI\\data.xml"));
		//} catch (SAXException e) {
		//	e.printStackTrace();
		//}
		/*
		digester.addCallMethod("response/row/row", "addNews", 16);
		digester.addCallParam("response/row/row/publish_year", 0);
		digester.addCallParam("response/row/row/city", 1);
		digester.addCallParam("response/row/row/content", 2);
		digester.addCallParam("response/row/row/date_entered", 3);
		digester.addCallParam("response/row/row/footer_content", 4);
		digester.addCallParam("response/row/row/entered_by", 5);
		digester.addCallParam("response/row/row/state", 6);
		digester.addCallParam("response/row/row/headline", 7);
		digester.addCallParam("response/row/row/last_modified", 8);
		digester.addCallParam("response/row/row/agency", 9);
		digester.addCallParam("response/row/row/last_modified_by", 10);
		digester.addCallParam("response/row/row/pub_date", 11);
		digester.addCallParam("response/row/row/contact1", 12);
		digester.addCallParam("response/row/row/contact2", 13);
		digester.addCallParam("response/row/row/category_tag1", 14);
		digester.addCallParam("response/row/row/category_tag2", 15);
		*/
		
        numRecords = 10;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		PageHelper.Start(out, "Home Page");
		PageHelper.NavBar(out);
		//for(News n: repo.getNews()) {
		//	out.println(n.getHeadline());
		//}
		PageHelper.End(out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
