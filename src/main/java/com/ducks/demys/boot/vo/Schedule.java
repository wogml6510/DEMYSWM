package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Schedule {
	
	private int SC_NUM;
	private String SC_NAME;
	private String SC_CONTENT;
	private int SC_IMP;
	private String SC_TYPE;
	private Date SC_STARTDATE;
	private Date SC_ENDDATE;
	private Date SC_REGDATE;
	private Date SC_UPDATEDATE;
	private String SC_PLACE;
	private int SC_STATUS;
	private int PJ_NUM;
	private int MEMBER_NUM;
	private int TASKS_NUM;

}
