package com.kh.oup.sale.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oup.client.service.ClientService;
import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.employee.service.EmployeeService;
import com.kh.oup.employee.vo.EmployeeVo;
import com.kh.oup.sale.service.SaleService;
import com.kh.oup.sale.vo.OrderListVo;
import com.kh.oup.sale.vo.OrderVo;
import com.kh.oup.sale.vo.SaleListVo;
import com.kh.oup.sale.vo.SaleVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/sale")
@Slf4j
public class SaleController {
	
	@Autowired
	private SaleService service;
	@Autowired
	private ClientService cservice;
	@Autowired
	EmployeeService eservice;
	
	@GetMapping("/enter")
	public String saleEnter(HttpServletRequest req, Model model) throws Exception {
		String search = req.getParameter("search");
		
		//거래처 정보
		List<ClientVo> clist = cservice.getSearchClientList(search);
		model.addAttribute("list",clist);
		model.addAttribute("search", search);
		
		//직원 정보
		List<EmployeeVo> elist = eservice.getEmployeeList();
		model.addAttribute("elist", elist);
		
		return "pages/sale/saleEnter";
	}
	
	@PostMapping("/enter")
	public String saleEnter(@ModelAttribute SaleVo saleVo, @ModelAttribute SaleListVo saleListVo) throws Exception {
		
		long saleNo = service.getSeq();
		saleVo.setSaleNo(saleNo);
		for(int i = 0; i < saleListVo.getVoList().size(); i++) {
			saleListVo.getVoList().get(i).setSaleNo(saleNo);
		}
		
		int result = service.saleEnter(saleVo, saleListVo);
		
		int result2 = service.clientAddUmony(saleVo.getCNo(), saleVo.getSUmoney());
		
		return "redirect:/sale/enter";
	}
	
	@GetMapping("order/{orderNo}")
	public String saleOrderDetail(@PathVariable String orderNo, Model model) throws Exception {
		OrderVo orderVo = service.getOrder(orderNo);
		
		SaleVo saleVo = new SaleVo();
		saleVo.setCNo(orderVo.getCNo());
		saleVo.setWareHouseNo(orderVo.getWarehouseNo());
		saleVo.setEmployeeNo(orderVo.getEmployeeNo());
		saleVo.setProjectNo(orderVo.getProjectNo());
		saleVo.setSaleDate(orderVo.getODate().substring(0, 10));
		saleVo.setVatYN(orderVo.getVatYn().charAt(0));
		saleVo.setCName(orderVo.getCName());
		saleVo.setEmployeeName(orderVo.getEmployeeName());
		saleVo.setWareHouseName(orderVo.getWareHouseName());
		saleVo.setProjectName(orderVo.getProjectName());
		saleVo.setSUmoney(orderVo.getSUmoney());
		model.addAttribute("sale", saleVo);
		
		OrderListVo orderListVo = service.getOrderProductList(orderNo);
		SaleListVo saleListVo = new SaleListVo();
		if(saleListVo.getVoList() == null) saleListVo.setVoList(new ArrayList<SaleListVo>());
		for(int i = 0; i < orderListVo.getVoList().size(); i++) {
			SaleListVo temp = new SaleListVo();
			saleListVo.getVoList().add(temp);
			saleListVo.getVoList().get(i).setBuga(orderListVo.getVoList().get(i).getBuga());
			saleListVo.getVoList().get(i).setPName(orderListVo.getVoList().get(i).getPName());
			saleListVo.getVoList().get(i).setPNo(orderListVo.getVoList().get(i).getPNo());
			saleListVo.getVoList().get(i).setPUnitPrice(orderListVo.getVoList().get(i).getPUnitPrice());
			saleListVo.getVoList().get(i).setResult(orderListVo.getVoList().get(i).getResult());
			saleListVo.getVoList().get(i).setSDeliberyDate(orderListVo.getVoList().get(i).getODeliberyDate().substring(0, 10));
			saleListVo.getVoList().get(i).setSPrice(orderListVo.getVoList().get(i).getOPrice());
			saleListVo.getVoList().get(i).setSQnt(orderListVo.getVoList().get(i).getONum());
		}
		
		model.addAttribute("saleList", saleListVo.getVoList());
		int cnt = saleListVo.getVoList().size();
		model.addAttribute("cnt", cnt);
		return "pages/sale/saleOrderEnter";
	}
	
	@GetMapping(value = {"/list/{page}", "/list"})
	public String saleList(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		int totalRow = service.getSaleCnt();
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(10);
		
		//판매번호(O), 거래처, 담당자명, 품목이름, 폼목개수, 창고이름
		List<SaleVo> list = service.getSaleList(vo);
		
		model.addAttribute("list",list);
		model.addAttribute("page", vo);
		return "pages/sale/saleList";
	}
	
	@GetMapping("/saleDetail/{saleNo}")
	public String saleDetail(@PathVariable int saleNo, Model model) throws Exception {
		SaleVo saleVo = service.getSale(saleNo);
		model.addAttribute("sale", saleVo);
		
		SaleListVo saleListVo = service.getSaleProductList(saleNo);
		model.addAttribute("saleList", saleListVo.getVoList());
		int cnt = saleListVo.getVoList().size();
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("saleNo", saleNo);
		
		return "pages/sale/saleDetail";
	}
	
	@PostMapping("/saleUpdate/{saleNo}")
	public String saleUpdate(Model model, @PathVariable int saleNo, @ModelAttribute SaleVo saleVo, @ModelAttribute SaleListVo saleListVo) throws Exception {
		
		saleVo.setSaleNo(saleNo);
		for(int i = 0; i < saleListVo.getVoList().size(); i++) {
			saleListVo.getVoList().get(i).setSaleNo(saleNo);
		}
		
		int result = service.saleUpdate(saleVo);
		
		int result2 = service.saleListUpdate(saleListVo);
		
		return "pages/sale/popupClose2";
	}
	
}
