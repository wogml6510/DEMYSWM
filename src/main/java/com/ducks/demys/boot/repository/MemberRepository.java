package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Member;

@Mapper
public interface MemberRepository {
	
	public List<Member> getMemberList();
	
	public Member getMemberByMEMBER_NUM(int MEMBER_NUM);
	
	public Member getMemberByMEMBER_ID(String MEMBER_ID);
	
	public int selectMemberSequenceNextValue();
	
	public void registMember(Member member);
	
	public void modifyMember(Member member);

	public void modifyForQuitMember(Member member);
	
	public void removeMember(int MEMBER_NUM);

	public void doJoin(String MEMBER_ID, String MEMBER_PW, String MEMBER_NAME, String MEMBER_PHONE, String MEMBER_EMAIL,
			String MEMBER_DEP, int MEMBER_AUTHORITY, int MEMBER_STATUS, String MEMBER_PIC);
}
