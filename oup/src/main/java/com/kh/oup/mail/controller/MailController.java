package com.kh.oup.mail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.employee.service.EmployeeService;
import com.kh.oup.employee.vo.EmployeeVo;
import com.kh.oup.mail.service.MailService;
import com.kh.oup.mail.vo.MailVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/mail")
@Slf4j
public class MailController {
	
	@Autowired
	private MailService service;
	@Autowired
	private EmployeeService emplservice;
	
	@GetMapping("/send")
	public String send(Model model) throws Exception {
		List<EmployeeVo> list = emplservice.getEmployeeList();
		
		model.addAttribute("employeelist", list);
		return "pages/mailbox/mailSend";
	}
	
	@PostMapping("/send")
	public String send(MailVo vo, HttpServletRequest req, String recipientId, String senderId) throws Exception {
		
		int result = service.send(vo, req, recipientId, senderId);
		
		if(result > 0) {
			return "redirect:/mail/rbox";
		}else {
			req.setAttribute("msg", "메일 보내기 실패");
			return "error/MailErrorPage";
		}
	}
	
	@GetMapping(value = {"/rbox/{page}", "/rbox"})
	public String receiveBox(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo) session.getAttribute("loginEmployee");
		long loginNo = loginEmployee.getEmployeeNo();
		
		int totalRow = service.getReMailCnt(loginNo);
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(15);
		
		List<MailVo> list = service.getReMailList(vo, loginNo);

		model.addAttribute("list",list);
		model.addAttribute("page", vo);
		return "pages/mailbox/mailBoxReceive";
	}
	
	@GetMapping(value = {"/sbox/{page}", "/sbox"})
	public String sendBox(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo) session.getAttribute("loginEmployee");
		long loginNo = loginEmployee.getEmployeeNo();
		
		int totalRow = service.getSeMailCnt(loginNo);
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(15);
		
		List<MailVo> list = service.getSeMailList(vo, loginNo);

		model.addAttribute("list",list);
		model.addAttribute("page", vo);
		return "pages/mailbox/mailBoxSend";
	}
	
	@PostMapping("/sdelete")
	@ResponseBody
	public String sendeDelete(String str) throws Exception {
		int result = service.deleteSendMail(str);
		
		log.warn("건드린 row 갯수 : {}", result);
		
		if(result == str.length()/2) {
			return "ok";
		}else {
			return "fail_" + result;
		}
	}
	
	@PostMapping("/rdelete")
	@ResponseBody
	public String receiveDelete(String str) throws Exception {
		int result = service.deleteReceiveMail(str);
		
		log.warn("건드린 row 갯수 : {}", result);
		
		if(result == str.length()/2) {
			return "ok";
		}else {
			return "fail_" + result;
		}
	}

	@GetMapping(value = {"/trash/{page}", "/trash"})
	public String trashMailBox(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo) session.getAttribute("loginEmployee");
		long loginNo = loginEmployee.getEmployeeNo();
		
		int totalRow = service.getTrashMailCnt(loginNo);
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(15);
		
		List<MailVo> list = service.getTrashMailList(vo, loginNo);

		model.addAttribute("list",list);
		model.addAttribute("page", vo);
		return "pages/mailbox/mailBoxTrash";
	}
	
	@GetMapping(value = {"/detail/{mailno}", "/detail"})
	public String mailDetail(Model model, @PathVariable(required = false)String mailno, HttpServletRequest request) throws Exception {
		
		MailVo mail = service.getMail(mailno);
		int result = service.mailRead(mailno);

		mail.setMailNextNo(mail.getMailNo()+1);
		mail.setMailPreNo(mail.getMailNo()-1);
		
		model.addAttribute("mail",mail);
		return "pages/mailbox/mailDetail";
	}
	
	@GetMapping(value = {"/delete/{mailno}", "/delete"})
	public String mailDelete(@PathVariable(required = false)String mailno) throws Exception {
		int result = service.deleteMail(mailno);
		
		return "pages/mailbox/mailBoxReceive";

	}
}
