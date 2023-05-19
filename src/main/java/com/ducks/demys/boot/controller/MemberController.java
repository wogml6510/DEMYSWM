package com.ducks.demys.boot.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.vo.Member;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	private MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 로그인
	@RequestMapping("/member/login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("/member/doLogin")
	public String doLogin(@RequestParam("MEMBER_ID") String MEMBER_ID, @RequestParam("MEMBER_PW") String MEMBER_PW,
			HttpSession session, Model model) {

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

	// 로그아웃
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("MEMBER_ID");
		return "redirect:/member/login";
	}

	// 계정등록시 인사코드 확인
	@RequestMapping("/member/registCode")
	public String showRegistCode() {
		return "member/registCode";
	}

	@PostMapping("/member/doRegistCode")
	public String doRegistCode(@RequestParam("newAuthority") String newAuthority, 
	                           @RequestParam("authority_code") String authority_code, 
	                           Model model) {
		if (!newAuthority.equals("1234")) {

			return "member/registCode";
		}else {
			return "member/regist";
		}
		
	}

	// 계정등록
	@RequestMapping("/member/regist")
	public String showRegist() {
		return "member/regist";
	}

	// 비밀번호 찾기(아이디,메일)
	@RequestMapping("/member/findPw")
	public void findPwGET() {
	}

	@PostMapping("/member/doFindPw")
	public String findPwPOST(Member member, HttpServletResponse response, Model model) {
		try {
			memberService.findPw(response, member);
			model.addAttribute("MEMBER_ID", member.getMEMBER_ID());
			model.addAttribute("VERTIFICATION_CODE", member.getVERTIFICATION_CODE());

			return "member/sendCode";
		} catch (Exception e) {
			e.printStackTrace();
			return "member/findPw";
		}
	}

	// 인증번호 확인
	@RequestMapping("/member/sendCode")
	public String sendCode(Model model, @RequestParam("MEMBER_ID") String MEMBER_ID,
			@RequestParam("VERTIFICATION_CODE") String VERTIFICATION_CODE) {
		model.addAttribute("VERTIFICATION_CODE", memberService.verifyVerificationCode(MEMBER_ID, VERTIFICATION_CODE));
		return "member/sendCode";
	}

	@PostMapping("/member/doSendCode")
	public String doSendCode(@RequestParam("VERTIFICATION_CODE") String VERTIFICATION_CODE,
			@RequestParam("MEMBER_ID") String MEMBER_ID, RedirectAttributes redirectAttributes, Model model) {
		if (memberService.verifyVerificationCode(MEMBER_ID, VERTIFICATION_CODE)) {
			model.addAttribute("VERTIFICATION_CODE", VERTIFICATION_CODE);
			return "member/newPw";
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "유효하지 않은 인증 코드입니다. 다시 입력해주세요.");
			return "member/sendCode";
		}
	}

	// 새 비밀번호 설정
	@RequestMapping("/member/newPw")
	public String newPw(@RequestParam("VERTIFICATION_CODE") String VERTIFICATION_CODE, Model model) {
		model.addAttribute("VERTIFICATION_CODE", VERTIFICATION_CODE);
		return "member/newPw";
	}

	@PostMapping("/member/doNewPw")
	public String doNewPw(@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword,
			@RequestParam("VERTIFICATION_CODE") String VERTIFICATION_CODE, HttpServletResponse response) {
		if (!newPassword.equals(confirmPassword)) {

			return "member/newPw?VERTIFICATION_CODE=" + VERTIFICATION_CODE;
		}

		if (!verifyNewPassword(newPassword)) {

			return "member/newPw?VERTIFICATION_CODE=" + VERTIFICATION_CODE;
		}

		memberService.updatePassword(VERTIFICATION_CODE, newPassword);

		try {
			response.sendRedirect("/member/login");
		} catch (IOException e) {

			e.printStackTrace();
		}

		return null;
	}

	// 비밀번호 제한
	private boolean verifyNewPassword(String newPassword) {
		if (newPassword.length() < 8) {
			return false;
		}

		int categories = 0;
		if (newPassword.matches(".*[A-Z].*")) {
			categories++;
		}
		if (newPassword.matches(".*[a-z].*")) {
			categories++;
		}
		if (newPassword.matches(".*\\d.*")) {
			categories++;
		}
		if (newPassword.matches(".*[$@$!%*#?&].*")) {
			categories++;
		}

		if (categories >= 3) {
			return true;
		}

		return false;
	}

}
