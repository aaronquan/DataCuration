package main;

import java.util.*;

public class ContactStore {
	private List<Contact> contacts;
	public ContactStore() {
		contacts = new ArrayList<Contact>();
	}
	public void addContact(Contact nc) {
		for(Contact cons: contacts) {
			if(nc.equals(cons)) {
				return;
			}	
		}
		contacts.add(nc);
	}
	public List<Contact> getContacts() {
		return contacts;
	}
}
