package main;

import java.io.File;
import java.util.*;
import javax.xml.parsers.*;

import org.w3c.dom.*;

public class NewsStore {
	private List<News> news;
	private List<Contact> allContacts;
	private List<String> allCategories;
	public NewsStore(){
		news = new ArrayList<News>();
		allContacts = new ArrayList<Contact>();
		allCategories = new ArrayList<String>();
	}
	public ContactStore addNewsFromFile() {
		try {
			File f = new File("C:\\Users\\Tony\\Documents\\UNI\\data.xml");
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(f);
	        doc.getDocumentElement().normalize();
	        System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
	        NodeList nList = doc.getElementsByTagName("row");
	        NodeList allNews = nList.item(0).getChildNodes();
	        for(int i = 0; i < allNews.getLength(); i++) {
	        	Node newsNode = allNews.item(i);
	        	NodeList attrs = newsNode.getChildNodes();
	        	
	        	//Element e = (Element) newsNode;
	        	//System.out.println(attrs.item(0).getTextContent());
	        	String hl = "", cont = "";
	        	String de = "", lm = "";
	        	String eb = "", lmb = "";
	        	String ag = "", cy = "";
	        	List<String> conString = new ArrayList<String>();
	        	List<String> catString = new ArrayList<String>();
	        	for(int j = 0; j < attrs.getLength(); j++) {
	        		String attr = attrs.item(j).getNodeName();
	        		String text = attrs.item(j).getTextContent();
	        		if(attr == "headline") {
	        			hl = text;
	        		}else if(attr == "content") {
	        			cont = text;
	        		}else if(attr == "city") {
	        			cy = text;
	        		}else if(attr == "agency") {
	        			ag = text;
	        		}else if(attr == "date_entered") {
	        			de = text;
	        		}else if(attr == "entered_by") {
	        			eb = text;
	        		}else if(attr == "date_last_modified") {
	        			lm = text;
	        		}else if(attr == "last_modified_by") {
	        			lmb = text;
	        		}else if(attr.contains("contact")) {
	        			conString.add(text);
	        		}else if(attr.contains("catagory_tag")) {
	        			catString.add(text);
	        		}	
	        	}
	        	news.add(new News(i, hl, cont, cy, ag, de, eb, lm, lmb, conString, catString));
	        	for(String cs: conString) {
	        		addContact(new Contact(cs));
	        	}
	        	for(String cs: catString) {
	        		allCategories.add(cs);
	        	}
	        }
		}catch(Exception e) {
			
		}
		return null;
	}
	public News getRandom() {
		if(news.isEmpty()) {
			return null;
		}
		int random = (int)(Math.random()*news.size()-1);
		return news.get(random);
	}
	public List<News> getNRandom(int n){
		List<News> newsList = new ArrayList<News>();
		boolean[] nums = new boolean[news.size()];
		for(int i = 0; i < n; i++) {
			int r = (int)Math.floor(Math.random()*news.size());
			while(nums[r]) {
				r = (int)Math.floor(Math.random()*news.size());
			}
			nums[r] = true;
			newsList.add(news.get(r));
		}
		return newsList;
	}
	public List<News> getAllNews(){
		return news;
	}
	public News getNewsAtIndex(int i) {
		return news.get(i);
	}
	
	public void addContact(Contact nc) {
		for(Contact cons: allContacts) {
			if(nc.nameEquals(cons)) {
				return;
			}	
		}
		allContacts.add(nc);
	}
	public List<Contact> getContacts(){
		return allContacts;
	}
}
