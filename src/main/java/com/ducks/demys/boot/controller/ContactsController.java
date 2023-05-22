package com.ducks.demys.boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.ContactsService;
import com.ducks.demys.boot.vo.Contacts;

@Controller
public class ContactsController {
	private ContactsService contactsService;
	
	public ContactsController(ContactsService contactsService) {
		this.contactsService = contactsService;
	}
	
	@RequestMapping("/contacts/list")
	public String showList(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
	    int pageSize = 13; // Number of items to display per page
	    
	    // Assuming you have a method to retrieve the list of contacts
	    List<Contacts> contactsList = contactsService.getContactsList();
	    
	    // Calculate the total number of pages
	    int totalItems = contactsList.size();
	    int totalPages = (int) Math.ceil((double) totalItems / pageSize);
	    
	    // Adjust the page number if it exceeds the total number of pages
	    if (page > totalPages) {
	        page = totalPages;
	    }
	    
	    // Calculate the starting and ending indexes of the items to display
	    int startIndex = (page - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, totalItems);
	    
	    // Extract the sublist for the current page
	    List<Contacts> paginatedContacts = contactsList.subList(startIndex, endIndex);
	    
	    // Pass the paginatedContacts and pagination information to the view
	    model.addAttribute("contactsList", paginatedContacts);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    
	    return "contacts/list";
	}
	
	@RequestMapping("/contacts/regist")
	public String showRegist() {
		return "contacts/regist";
	}
	
	@RequestMapping("/contacts/doRegist")
	@ResponseBody
	public String registContacts(Model model,Contacts contacts, @RequestParam("CT_TYPE") int CT_TYPE) {
		
		contacts.setCT_TYPE(CT_TYPE);
		contactsService.registContacts(contacts);
		
		String script = "<script>alert('업체 등록이 완료되었습니다.');window.close(); window.opener.location.href='/contacts/list';</script>";
        return script;
	}
	
	@RequestMapping("/contacts/detail")
	public void showDetail(Model model, String CT_NAME) {
		
		Contacts contacts = contactsService.getContactsByCT_NAME(CT_NAME);
		model.addAttribute("contacts",contacts);

	}
	
	@RequestMapping("/contacts/modify")
	public void Modify(Model model, String CT_NAME) {
		
		Contacts contacts = contactsService.getContactsByCT_NAME(CT_NAME);
		model.addAttribute("contacts",contacts);
	}
	
	
	
	@RequestMapping("/contacts/remove")
	@ResponseBody
	public void removeContacts(@RequestParam("CT_NUM") int CT_NUM) {
		contactsService.removeContacts(CT_NUM);
	}
}
