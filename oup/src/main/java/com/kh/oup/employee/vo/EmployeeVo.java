package com.kh.oup.employee.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EmployeeVo {
	private long employeeNo;
	private String employeeId;
	private String employeePwd;
	private String employeeName;
	private Date employeeBirt;
	private String employeeAddr;
	private String employeePhone;
	private String employeeEmail;
	private Date hireDate;
	private Date fireDate;
	private String jobPosition;
	private String teamCode;
	private String jobTitleCode;
	private char entYN;
}
