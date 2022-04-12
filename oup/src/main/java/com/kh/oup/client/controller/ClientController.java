package com.kh.oup.client.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oup.client.service.ClientService;
import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("client")
@Slf4j
public class ClientController {
	
	@Autowired
	ClientService service;
	
	@GetMapping(value = {"/list/{page}", "/list"})
	public String list(Model model, @PathVariable(required = false)String page, HttpServletRequest httpServletRequest) throws Exception {
		String search = httpServletRequest.getParameter("search");  
		
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		if(search == null) {
			int totalRow = service.getClientCnt();	
			PageVo vo = new PageVo(page, totalRow);
			
			List<ClientVo> list = service.getClientList(vo);
			model.addAttribute("list",list);
			model.addAttribute("page", vo);
		}
		
		if(search != null) {
			int totalRow = service.getSearchClientCnt(search);	
			PageVo vo = new PageVo(page, totalRow, search);
			
			List<ClientVo> list = service.getSearchClientList(vo);
			model.addAttribute("list",list);
			model.addAttribute("page", vo);
			model.addAttribute("search", search);
		}
		
		return "pages/client/clientList";
		
	}
	
	
	@GetMapping("addList")
	public String addList() {
		return "pages/client/addClient";
	}
	
	@PostMapping("addList")
	public String addList(ClientVo vo) throws Exception {
		int result = service.addclient(vo);
		
		if(result >0) {
			log.info("거래처 추가 success");
			return "common/closePopup";
		}
		
		log.info("거래처 추가 fail");
		return "common/closePopup";
	}
	
	@PostMapping("delete")
	public String deleteList(String client) throws Exception {
		int result = service.deleteClient(client);
		
		if(result == client.length()/8) {
			log.info("거래처 삭제 success");
			return "client/clientList";	
		}
		
		log.info("거래처 삭제 fail");
		return "client/clientList";	
	}
	
	@GetMapping(value = {"change/{result}"})
	public String changeList(Model model, @PathVariable String result) throws Exception {
		ClientVo vo = service.selectClientOne(result);

		model.addAttribute("client", vo);
		
		return "pages/client/changeClient";
	}
	
	@PostMapping(value = {"change"})
	public String changeList(ClientVo vo) throws Exception {
		int result = service.changeClient(vo);
		
		if(result >0) {
			log.info("거래처 변경 success");
			return "common/closePopup";		
		}
		
		log.info("거래처 변경 fail");
		return "redirect:/closePage";
	}
	
	@GetMapping("searchClient")
	public String searchClient(HttpServletRequest req, Model model) throws Exception {
		String search = req.getParameter("search");
		
		if(search == null) {
			return "pages/client/searchClient";
		}
		
		if(search != null) {
			List<ClientVo> list = service.getSearchClientList(search);
			model.addAttribute("list",list);
			model.addAttribute("search", search);
		}
		
		return "pages/client/searchClient";
	}
	
	@GetMapping("closePage")
	public String closePage() {
		return "common/closePopup";
	}
	
}
