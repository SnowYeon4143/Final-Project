package com.kh.oup.product.vo;

import lombok.Data;

@Data
public class ProductVo {
	private long pNo;
	private String pName;
	private String pStandard;
	private long pCount;
	private long pUnitPrice;
	private long pSupplyPrice;
	private String pNote;
	private long warehouseNo;
}
