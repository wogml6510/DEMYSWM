package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.MemberRepository;
import com.ducks.demys.boot.vo.Member;

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
 
	public boolean authenticate(String memberId, String memberPw) {
	    Member member = memberRepository.getMemberByMEMBER_ID(memberId);
	    if (member != null && member.getMEMBER_PW().equals(memberPw)) {
	        return true;
	    }
	    return false;
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

	public void doJoin(String MEMBER_ID, String MEMBER_PW, String MEMBER_NAME, String MEMBER_PHONE, String MEMBER_EMAIL,
			String MEMBER_DEP, int MEMBER_AUTHORITY, int MEMBER_STATUS, String MEMBER_PIC) {
		memberRepository.doJoin(MEMBER_ID,MEMBER_PW,MEMBER_NAME,MEMBER_PHONE,MEMBER_EMAIL,MEMBER_DEP,MEMBER_AUTHORITY,MEMBER_STATUS,MEMBER_PIC);
	}
}
