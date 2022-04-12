package com.kh.oup.employee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.employee.vo.EmployeeVo;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public EmployeeVo getEmployee(EmployeeVo vo) throws Exception {
		return ss.selectOne("employee.getEmployee", vo);
	}

	@Override
	public List<EmployeeVo> getEmployeeList() throws Exception {
		return ss.selectList("employee.getEmployeeList");
	}

	@Override
	public EmployeeVo login(EmployeeVo vo) throws Exception {
		return ss.selectOne("employee.loginEmployee", vo);
	}

}
