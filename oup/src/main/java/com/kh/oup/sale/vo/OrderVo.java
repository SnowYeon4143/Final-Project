package com.kh.oup.sale.vo;

import java.util.Date;
import lombok.Data;

@Data
public class OrderVo {
	//원래 있던거
	private int oNo;			// �ֹ�����ȣ
	private int cNo;			// �ŷ�ó��ȣ
	private int projectNo;		// ������Ʈ��ȣ
	private int warehouseNo;	// â���ȣ
	private String oDate;			// �ֹ���
	private Date creditDate; 	// ���ű���
	private String teamCode;	// ���ڵ�
	private int employeeNo;		// �����
	private String vatYn;		// �ΰ��� ����
	private String oStatement;
	
	private int pNo;		// ǰ�� ��ȣ �˻���
	private String oDateStr;	
	private String creditDateStr; 
	private int startRow;
	private int endRow;
	
	//추가한 것
	private String cName; //거래처명
	private String employeeName; //담당자명
	private String wareHouseName;
	private String projectName;
	private long sUmoney;
}
