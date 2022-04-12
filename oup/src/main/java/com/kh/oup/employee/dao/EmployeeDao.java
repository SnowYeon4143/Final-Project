package com.kh.oup.employee.dao;

import java.util.List;

import com.kh.oup.employee.vo.EmployeeVo;

public interface EmployeeDao {

	EmployeeVo getEmployee(EmployeeVo vo) throws Exception;

	List<EmployeeVo> getEmployeeList() throws Exception;

	EmployeeVo login(EmployeeVo vo) throws Exception;

}
