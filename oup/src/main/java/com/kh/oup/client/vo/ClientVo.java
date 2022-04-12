package com.kh.oup.client.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ClientVo {
	private int cNo;		
	private String cName;	
	private int bNo;		
	private int bNo2;		
	private String cType;	
	private String cOwner;	
	private String cAddr;	
	private String cPhone;
	private String cFax;	
	private String cEmail;	
	private int cUmony;		
	private int cCreditLimit;	
	private int cCreditMonth;	
	private int cCreditDay;		
	private Date cDate;				
	private String cDeleteYn;		
}
