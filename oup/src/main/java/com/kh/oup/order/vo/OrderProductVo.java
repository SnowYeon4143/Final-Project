package com.kh.oup.order.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderProductVo {
	private int orderNo;		// 주문서 번호
	private int[] orderList;
	private int[] pNo;			// 품목 번호
	private String[] pName;		// 품목 이름
	private int[] oNum;			// 품목 개수
	private int[] oPrice;			// 품목 가격
	private Date[] oDeliberyDate;	// 납기일자
	
	private int pIndex;				// 주문한 품목 종류수
	private String[] oDeliberyDateStr;
	
	private int orderListNo;
	private int pNoStr;
	private String pNameStr;
	private int oNumStr;
	private int oPriceStr;
	private Date oDeliberyDateStrr;
}
