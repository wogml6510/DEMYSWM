package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Budget_Detail {
	
	private int BUDDT_NUM;
	private String BUDDT_TYPE;
	private int BUDDT_COST;
	private String BUDDT_INFO;
	private String BUDDT_ETC;
	private Date REGDATE;
	private Date UPDATEDATE;
	private int BUD_NUM;

}
