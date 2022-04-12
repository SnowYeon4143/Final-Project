package com.kh.oup.employee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.oup.employee.service.EmployeeService;
import com.kh.oup.employee.vo.EmployeeVo;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService service;
	
	@GetMapping("/login")
	public String login() {
		return "pages/member/login";
	}
	
	@PostMapping("/login")
	public String login(EmployeeVo vo, HttpSession session) throws Exception {
		
		EmployeeVo loginEmployee = service.login(vo);
		if(loginEmployee != null) {
			session.setAttribute("loginEmployee", loginEmployee);
			return "redirect:/charts/monthly_charts";
		}else {
			return "pages/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/login";
	}
	
	@GetMapping("/popup")
	public String employeePopUp(Model model) throws Exception {
		List<EmployeeVo> list = service.getEmployeeList();
		model.addAttribute("list", list);
		return "pages/sale/employeeList";
	}
}
