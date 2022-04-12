package com.kh.oup.approval.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ApprovalODVo {
	//기존 오더vo
	private int oNo;			
	private int cNo;			
	private int projectNo;		
	private int warehouseNo;	
	private Date oDate;			
	private Date creditDate; 	
	private String teamCode;	
	private int employeeNo;		
	private String vatYn;		
	
	private int pNo;		
	private String oDateStr;	
	private String creditDateStr; 
	
	//내가 추가함
	private int price;
	private String cName;
}
