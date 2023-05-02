package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {
	
	private int MEMBER_NUM;
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	private String MEMBER_PIC;
	private String MEMBER_PHONE;
	private String MEMBER_EMAIL;
	private Date REGDATE;
	private Date QUITDATE;
	private Date UPDATEDATE;
	private int MEMBER_AUTHORITY;
	private String MEMBER_DEP;
	private int MEMBER_STATUS;
	
}
