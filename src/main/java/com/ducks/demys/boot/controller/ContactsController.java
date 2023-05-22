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
	    int pageSize = 13; 
	    List<Contacts> contactsList = contactsService.getContactsList();
	    
	    int totalItems = contactsList.size();
	    int totalPages = (int) Math.ceil((double) totalItems / pageSize);
	    
	    if (page > totalPages) {
	        page = totalPages;
	    }
	    
	    int startIndex = (page - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, totalItems);
	    
	    List<Contacts> paginatedContacts = contactsList.subList(startIndex, endIndex);
	    
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
	public String registContacts(Model model, Contacts contacts, @RequestParam("CT_TYPE") int CT_TYPE,
	        @RequestParam("phoneNumber1") String phoneNumber1, @RequestParam("phoneNumber2") String phoneNumber2,
	        @RequestParam("phoneNumber3") String phoneNumber3, @RequestParam("ct_fax1") String ct_fax1, @RequestParam("ct_fax2") String ct_fax2,
	        @RequestParam("ct_fax3") String ct_fax3, @RequestParam("ct_mg_tel1") String ct_mg_tel1, @RequestParam("ct_mg_tel2") String ct_mg_tel2,
	        @RequestParam("ct_mg_tel3") String ct_mg_tel3,@RequestParam("ctPostcode") String ctPostcode, @RequestParam("ctAddress") String ctAddress,
	        @RequestParam("ctDetailAddress") String ctDetailAddress, @RequestParam("ctExtraAddress") String ctExtraAddress) {
		
		String fullAddress = "";
		if (!ctAddress.isEmpty() && !ctDetailAddress.isEmpty() && !ctExtraAddress.isEmpty()) {
		    fullAddress = "(" + ctPostcode + ") " + ctAddress + " " + ctDetailAddress + " " + ctExtraAddress;
		}

		String phoneNumber = "";
		if (!phoneNumber1.isEmpty() && !phoneNumber2.isEmpty() && !phoneNumber3.isEmpty()) {
		    phoneNumber = phoneNumber1 + "-" + phoneNumber2 + "-" + phoneNumber3;
		}

		String faxNumber = "";
		if (!ct_fax1.isEmpty() && !ct_fax2.isEmpty() && !ct_fax3.isEmpty()) {
		    faxNumber = ct_fax1 + "-" + ct_fax2 + "-" + ct_fax3;
		}

		String mgNumber = "";
		if (!ct_mg_tel1.isEmpty() && !ct_mg_tel2.isEmpty() && !ct_mg_tel3.isEmpty()) {
		    mgNumber = ct_mg_tel1 + "-" + ct_mg_tel2 + "-" + ct_mg_tel3;
		}


	    contacts.setCT_ADDR(fullAddress);
	    contacts.setCT_TEL(phoneNumber);
	    contacts.setCT_FAX(faxNumber);
	    contacts.setCT_MG_TEL(mgNumber);
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
