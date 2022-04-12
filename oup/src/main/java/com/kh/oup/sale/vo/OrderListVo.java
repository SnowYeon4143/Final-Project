package com.kh.oup.sale.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class OrderListVo {
	private long oListNo;
	private String oNo;
	private String pNo; //
	private long oNum; //개수
	private long oPrice; //총액
	private String oDeliberyDate;
	private String pName; //품목명
	private long pUnitPrice; //단가
	private long buga; //부가세
	private long result; //금액 = 공급가액 + 부가세
	
	private List<OrderListVo> voList; /* = new ArrayList<OrderListVo>(); */

	
}
