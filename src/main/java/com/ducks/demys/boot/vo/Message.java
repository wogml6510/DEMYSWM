package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Message {
	
	private int MSG_NUM;
	private String MSG_TYPE;
	private int MSG_TYPEPK;
	private String MSG_CONTENT;
	private String MSG_URL;
	private Date MSG_REGDATE;
	private Date MSG_READDATE;
	private int PJ_NUM;
	private int MEMBER_NUM;
	private int SENDMEMBER_NUM;

}
