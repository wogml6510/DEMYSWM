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
}
