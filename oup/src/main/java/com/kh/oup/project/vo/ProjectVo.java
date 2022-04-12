package com.kh.oup.project.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProjectVo {
	
	private int projectNo;
	private String projectName;
	private String projectContents1;
	private String projectContents2;
	private String projectContents3;
	private String projectContents4;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projectStart; //기한 시작
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date projectEnd;  //기한 마감
	private String projectColor;
	private String dCCode; //문서종류 코드 ,, 4
	private String aStatement; //결재상태
	
	
	//sql문으로 합산
	private String sums; //SALE saleSum들의 합계
	private String sumu; //SALE sUmoney미수금들의 합계
	
	private String groupMembers; 
	


}
