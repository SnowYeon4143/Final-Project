package com.kh.oup.sale.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SaleVo {
	private long saleNo;
	private long cNo;
	private long wareHouseNo;
	private long employeeNo;
	private long projectNo;
	private long oNo;
	private long saleSum;
	private String saleDate;
	private long sUmoney;
	private char vatYN;
	private String cName;
	private String employeeName;
	private String productNo;
	private String productName;
	private int productCnt;
	private String wareHouseName;
	private String projectName;
}
