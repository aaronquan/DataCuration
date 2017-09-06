package main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class News {
	private int id;
	private String pub_year;
	private String city;
	private String content;
	private String date_entered;
	private String footer_content;
	private String entered_by;
	private String state;
	private String headline;
	private String last_modified;
	private String agency;
	private String last_modified_by;
	private String pub_date;
	private List<Contact> contacts;
	private List<String> categories;
	public News(int i, String hl, String con, String cy, String ag, String de, String eb, String lm, String lmb, List<String> cons, List<String> cats){
		id = i;
		headline = hl;
		content = con;
		city = cy;
		agency = ag;
		date_entered = de;
		entered_by = eb;
		last_modified = lm;
		last_modified_by = lmb;
		contacts = new ArrayList<Contact>();
		categories = new ArrayList<String>();
		for(String s: cons) {
			contacts.add(new Contact(s));
		}
		for(String s: cats) {
			categories.add(s);
		}
	}
	public String getHeadline() {
		return headline;
	}
	public String getContent() {
		return content;
	}
	public String getCity() {
		return city;
	}
	public String getAgency() {
		return agency;
	}
	public String getDateEntered() throws ParseException {
		if(date_entered.equals("")) return "";
		Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date_entered);
		return date.toString();
	}
	public String getEnteredBy() {
		return entered_by;
	}
	public String getLastModified() throws ParseException {
		if(last_modified.equals("")) return "";
		Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(last_modified);
		return date.toString();
	}
	public String getLastModifiedBy() {
		return last_modified_by;
	}
	public List<Contact> getContacts(){
		return contacts;
	}
	public List<String> getCategories(){
		return categories;
	}
	public int getId(){
		return id;
	}
	public boolean matchHeadline(String[] s) {
		for(int i = 0; i < s.length; i++) {
			if (headline.toLowerCase().indexOf(s[i].toLowerCase()) == -1) {
				return false;
			}
		}
		return true;
	}
	public boolean matchMonth(String s) throws ParseException {
		if(!last_modified.equals("")) {
			Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(last_modified);
			if(date.getMonth()+1 != Integer.parseInt(s)) return false; 
		}
		return true;
	}
	public boolean matchYear(String s) throws ParseException {
		if(!last_modified.equals("")) {
			Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(last_modified);
			if(date.getYear()+1900 != Integer.parseInt(s)) return false; 
			
		}
		return true;
	}
	public boolean matchAgency(String[] s){
		for(int i = 0; i < s.length; i++) {
			if (agency.toLowerCase().indexOf(s[i].toLowerCase()) == -1) {
				return false;
			}
		}
		return true;
	}
	public boolean matchCity(String[] s){
		for(int i = 0; i < s.length; i++) {
			if (city.toLowerCase().indexOf(s[i].toLowerCase()) == -1) {
				return false;
			}
		}
		return true;
	}
	public boolean matchKeywords(String[] s){
		for(int i = 0; i < s.length; i++) {
			if (content.toLowerCase().indexOf(s[i].toLowerCase()) == -1) {
				return false;
			}
		}
		return true;
	}
}
