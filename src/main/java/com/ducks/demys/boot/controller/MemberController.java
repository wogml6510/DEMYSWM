package com.ducks.demys.boot.controller;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.vo.Member;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Controller
public class MemberController {

	private MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping("/member/login")
	public String showLogin() {
		return "member/login";
	}

	@PostMapping("/member/doLogin")
	public String doLogin(@RequestParam("MEMBER_ID") String MEMBER_ID, @RequestParam("MEMBER_PW") String MEMBER_PW, HttpSession session, Model model) {
		 
	    if (MEMBER_ID.isEmpty() || MEMBER_PW.isEmpty()) {
	        model.addAttribute("error", "Please try login again");
	        return "member/login";
	    }

	    Member member = memberService.getMemberByMEMBER_ID(MEMBER_ID);

	    if (member != null && member.getMEMBER_PW().equals(MEMBER_PW)) {
	        session.setAttribute("member", member);
	        return "redirect:/contacts/list";
	    } else {
	        if (member == null || !member.getMEMBER_ID().equals(MEMBER_ID)) {
	            model.addAttribute("invalidId", "Invalid login ID.");
	        } else {
	            model.addAttribute("invalidPassword", "Invalid password.");
	        }
	        return "member/login";
	    }
	}
	
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
	    session.removeAttribute("MEMBER_ID");
	    return "redirect:/member/login";
	}

	@RequestMapping("/member/regist")
	public String showRegist() {
		return "member/regist";
	}

    @RequestMapping("/member/findPw")
    public String findPwGET() {
        return "member/findPw";
    }
  
    @PostMapping("/member/doFindPw")
    public String findPwPOST(@ModelAttribute Member member, HttpServletResponse response) {
        try {
            memberService.findPw(response, member);
            return "redirect:/member/sendCode";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/member/findPw";
        }
    }
    
    @GetMapping("/member/sendCode")
    public String sendCode() {
        return "member/sendCode";
    }
    
	
}
