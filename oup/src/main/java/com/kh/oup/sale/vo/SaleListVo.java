package com.kh.oup.sale.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SaleListVo {
	private long saleListNo;
	private long saleNo;
	private String pNo;
	private long sQnt; //개수
	private long sPrice; //총액
	private String sDeliberyDate;
	private String pName; //품목명
	private long pUnitPrice; //단가
	private long buga; //부가세
	private long result; //금액 = 공급가액 + 부가세
	
	private List<SaleListVo> voList;/* = new ArrayList<SaleListVo>(); */
}
