package com.ducks.demys.boot.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.MemberRepository;
import com.ducks.demys.boot.vo.Member;

import jakarta.servlet.http.HttpServletResponse;

@Service
public class MemberService {
	
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository= memberRepository;
	}
	
	public List<Member> getMemberList(){
		return memberRepository.getMemberList();
	}
	
	public Member getMemberByMEMBER_NUM(int MEMBER_NUM) {
		return memberRepository.getMemberByMEMBER_NUM(MEMBER_NUM);
	}
	    
    public Member getMemberByMEMBER_ID(String MEMBER_ID) {
        return memberRepository.getMemberByMEMBER_ID(MEMBER_ID);
    }
	
	public void registMember(Member member) {
		member.setMEMBER_NUM(memberRepository.selectMemberSequenceNextValue());
		memberRepository.registMember(member);
	}
	
	public void modifyMember(Member member) {
		memberRepository.modifyMember(member);
	}
	
	public void modifyForQuitMember(Member member) {
		memberRepository.modifyForQuitMember(member);
	}
	
	public void removeMember(int MEMBER_NUM) {
		memberRepository.removeMember(MEMBER_NUM);
	}

	//이메일발송
	public void sendEmail(Member member, String div) throws MessagingException {
        String host = "smtp.naver.com";
        int port = 587;
        String username = "dnjsal7461";
        String password = "wjsrl6360!!";
        String fromEmail = "dnjsal7461@naver.com";
        String fromName = "DEMYS";
        String subject = "";
        String message = "";

        if (div.equals("findPw")) {
            subject = "DEMYS 임시 비밀번호";
            message = "안녕하세요. " + member.getMEMBER_ID() + ",\n\n"
                    + "We have generated a temporary password for your account. Please use the following password to log in:\n\n"
                    + "Temporary Password: " + member.getMEMBER_PW() + "\n\n"
                    + "Please remember to change your password after logging in.\n\n"
                    + "Best regards,\n"
                    + "Your Company";
        }

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message emailMessage = new MimeMessage(session);
        try {
			emailMessage.setFrom(new InternetAddress(fromEmail, fromName));
		} catch (UnsupportedEncodingException | MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getMEMBER_EMAIL()));
        emailMessage.setSubject(subject);
        emailMessage.setText(message);

        Transport.send(emailMessage);
    }


	public void findPw(HttpServletResponse response, Member member) throws Exception {
	    response.setContentType("text/html;charset=utf-8");
	    Member ck = memberRepository.readMember(member.getMEMBER_ID());
	    PrintWriter out = response.getWriter();

	    if (memberRepository.idCheck(member.getMEMBER_ID()) == null) {
	        out.print("등록되지 않은 아이디입니다.");
	        out.close();
	    } else if (!member.getMEMBER_EMAIL().equals(ck.getMEMBER_EMAIL())) {
	        out.print("등록되지 않은 이메일입니다.");
	        out.close();
	    } else {
	        String MEMBER_PW = generateTemporaryPassword();
	        member.setMEMBER_PW(MEMBER_PW);

	        memberRepository.modifyPw(member);

	        try {
	            sendEmail(member, "findPw");
	            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
	            out.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new Exception("이메일 발송에 실패하였습니다.");
	        }
	    }
	}


	private String generateTemporaryPassword() {
	    StringBuilder password = new StringBuilder();
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    int length = 8;

	    for (int i = 0; i < length; i++) {
	        int randomIndex = (int) (Math.random() * characters.length());
	        password.append(characters.charAt(randomIndex));
	    }

	    return password.toString();
	}
}