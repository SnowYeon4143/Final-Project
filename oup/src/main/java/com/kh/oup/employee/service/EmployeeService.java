package com.kh.oup.employee.service;

import java.util.List;

import com.kh.oup.employee.vo.EmployeeVo;

public interface EmployeeService {

	EmployeeVo login(EmployeeVo vo) throws Exception;

	List<EmployeeVo> getEmployeeList() throws Exception;

}
