package com.ducks.demys.boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ducks.demys.boot.service.ContactsService;
import com.ducks.demys.boot.vo.Contacts;

@Controller
public class ContactsController {
	private ContactsService contactsService;
	
	public ContactsController(ContactsService contactsService) {
		this.contactsService = contactsService;
	}
	
	@RequestMapping("/contacts/list")
	public String showList(Model model){
	
		List<Contacts> contactsList = contactsService.getContactsList();
		
		model.addAttribute("contactsList",contactsList);
		return "contacts/list";
	}
	
	@RequestMapping("/contacts/regist")
	public String showRegist() {
		return "contacts/regist";
	}
}
