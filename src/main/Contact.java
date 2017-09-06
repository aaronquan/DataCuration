package main;

public class Contact {
	private String name;
	private String role;
	private String office;
	private String email;
	private String number;
	public Contact(String na, String r, String o, String e, String no) {
		name = na;
		role = r;
		office = o;
		email = e;
		number = no;
	}
	public Contact(String s) {
		String[] parts = s.split("\\|");
		name = parts[0];
		role = parts[1];
		office = parts[3];
		email = parts[4];
		number = parts[5];
	}
	public String getName() {
		return name;
	}
	public String getRole() {
		return role;
	}
	public String getOffice() {
		return office;
	}
	public String getNumber() {
		return number;
	}
	public String getEmail() {
		return email;
	}
	public boolean nameEquals(Contact c) {
		if(c.getName().equals(name)) {
			return true;
		}
		return false;
		
	}
}
