package com.kh.oup.common;

import lombok.Data;

@Data
public class PageVo { 
	private String search;	// 占싯삼옙占쏙옙占쏙옙 占쏙옙占쏙옙징 占쏙옙 占쏙옙占�
	
	private int currentPage;	// 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	private int cntPerPage;	// 占쏙옙占쏙옙占쏙옙 占싹놂옙占쏙옙 占쏙옙占쏙옙占쏙옙 row 占쏙옙占쏙옙
	private int pageBtnCnt;	// 占쏙옙占쏙옙占쏙옙 占쏙옙튼 占쏘개 占쏙옙占쏙옙占쏙옙占쏙옙
	private int totalRow;	// 占쏙옙占싱븝옙占쏙옙 占쏙옙체 row 占쏙옙占쏙옙
	
	private int startRow; // db占쏙옙占쏙옙 占쏙옙회占쏙옙 rownum
	private int endRow;	// db占쏙옙占쏙옙 占쏙옙회占쏙옙 rownum
	private int startPage;	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙
	private int endPage;	// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	private int lastPage;	// db占쏙옙 row 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	
	public PageVo(String currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		this.currentPage = Integer.parseInt(currentPage);
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		calc(this.currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	public PageVo(String currentPage, int totalRow) {
		this.currentPage = Integer.parseInt(currentPage);
		this.cntPerPage = 10;
		this.pageBtnCnt = 5;
		this.totalRow = totalRow;
		calc(this.currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	public PageVo(String currentPage, int totalRow, String search) {
		this.search = search;
		this.currentPage = Integer.parseInt(currentPage);
		this.cntPerPage = 10;
		this.pageBtnCnt = 5;
		this.totalRow = totalRow;
		calc(this.currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	
	
	//sssh pageVo
	public PageVo(String currentPage, int cntPerPage, int pageBtnCnt, int totalRow, String search) {
		this.search = search;
		this.currentPage = Integer.parseInt(currentPage);
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		calc(this.currentPage, cntPerPage, pageBtnCnt, totalRow);
	}
	

	private void calc(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		this.setEndRow(this.getCurrentPage() * this.getCntPerPage());
		this.setStartRow(this.getEndRow() - this.getCntPerPage() + 1 );
		
		int lastPage = this.getTotalRow() / this.getCntPerPage(); 
		if(this.getTotalRow() % this.getCntPerPage() > 0) {
			lastPage++;
		}			
		this.setLastPage(lastPage);
		
		int endPage = this.getCurrentPage() / this.getPageBtnCnt();	
		if(this.getCurrentPage() % this.getPageBtnCnt() >0) {
			endPage ++;
		}
		this.setEndPage(endPage * this.getPageBtnCnt());
		
		this.setStartPage(this.getEndPage() - this.getPageBtnCnt() + 1);
		
	}


}
