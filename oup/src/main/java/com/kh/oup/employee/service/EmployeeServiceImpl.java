package com.kh.oup.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oup.employee.dao.EmployeeDao;
import com.kh.oup.employee.vo.EmployeeVo;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeDao dao;
	
	@Override
	public EmployeeVo login(EmployeeVo vo) throws Exception {
		
		//DB에서 회원 정보 조회
		EmployeeVo dbUser = dao.login(vo);
		if(dbUser == null) {
			return null;
		}
		
		return dbUser;
	}

	@Override
	public List<EmployeeVo> getEmployeeList() throws Exception {
		return dao.getEmployeeList();
	}

}
