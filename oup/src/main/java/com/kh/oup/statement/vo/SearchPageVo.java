package com.kh.oup.statement.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SearchPageVo {

	private int currentPage;	
	private int cntPerPage;	
	private int pageBtnCnt;	
	private int totalRow;	
	
	private int startRow; 
	private int endRow;	
	private int startPage;	
	private int endPage;	
	private int lastPage;	
	
	private String category;
	private String search;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date1;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date2;
	
}
