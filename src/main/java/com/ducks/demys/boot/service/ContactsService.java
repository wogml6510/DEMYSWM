package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.ContactsRepository;
import com.ducks.demys.boot.vo.Contacts;

@Service
public class ContactsService {
	
	private ContactsRepository contactsRepository;
	
	public ContactsService(ContactsRepository contactsRepository) {
		this.contactsRepository= contactsRepository;
	}
	
	public List<Contacts> getContactsList(){

		return contactsRepository.getContactsList();
	}
	
	public List<Contacts> getContactsListByPJ_NUM(int PJ_NUM){
		return contactsRepository.getContactsListByPJ_NUM(PJ_NUM);
	}
	
	public Contacts getContactsByCT_NUM(int CT_NUM) {
		return contactsRepository.getContactsByCT_NUM(CT_NUM);
	}
	
	public Contacts getContactsByCT_NAME(String CT_NAME) {
		return contactsRepository.getContactsByCT_NAME(CT_NAME);
	}
	
	public Contacts registContacts(Contacts contacts) {
		contacts.setCT_NUM(contactsRepository.selectContactsSequenceNextValue());
		contactsRepository.registContacts(contacts);
		return contacts;
	}
	
	public void modifyContacts(Contacts contacts) {
		contactsRepository.modifyContacts(contacts);
	}
	
	public void removeContacts(int CT_NUM) {
		contactsRepository.removeContacts(CT_NUM);
	}

}
