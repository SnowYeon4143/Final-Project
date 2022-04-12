package com.kh.oup.approval.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ApprovalPJVo {
	//기존 프로젝트 vo
	private int projectNo;
	private String projectName;
	private String projectContents1;
	private String projectContents2;
	private String projectContents3;
	private String projectContents4;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String projectStart; //기한 시작
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String projectEnd;  //기한 마감
	private String projectColor;
	private String dCCode; //문서종류 코드 ,, 4
	private String aStatement; //결재상태
	
	private String saleSum; //SALE 합계
	private String sUmoney; //SALE 미수금
	
	
	private String groupMembers; 
}
