package com.kh.oup.sale.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oup.client.service.ClientService;
import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.product.service.ProductService;
import com.kh.oup.product.vo.ProductVo;
import com.kh.oup.project.vo.ProjectVo;
import com.kh.oup.sale.service.PopUpService;
import com.kh.oup.sale.service.SaleService;
import com.kh.oup.sale.vo.OrderVo;
import com.kh.oup.sale.vo.SaleListVo;
import com.kh.oup.sale.vo.SaleVo;
import com.kh.oup.sale.vo.WarehouseVo;

@Controller
@RequestMapping("/popup")
public class PopUpController {
	
	@Autowired
	private ClientService cservice;
	@Autowired
	private PopUpService pservice;
	@Autowired
	private ProductService proservice;
	@Autowired
	private SaleService saleService;
	
	@GetMapping("searchClient")
	public String searchClient(HttpServletRequest req, Model model) throws Exception {
		String search = req.getParameter("search");
		System.out.println(search);
		
		if(search == null) {
			return "pages/client/searchClient";
		}
		
		if(search != null) {
			List<ClientVo> list = cservice.getSearchClientList(search);
			model.addAttribute("list",list);
			model.addAttribute("search", search);
		}
		
		return "pages/sale/searchClient";
	}
	
	@GetMapping("warehouseList")
	public String warehouseList(Model model) throws Exception {
		List<WarehouseVo> list = pservice.getHouseList();
		
		model.addAttribute("list", list);
		
		return "pages/sale/warehouseList";
	}
	
	@GetMapping("projectList")
	public String projectList(Model model) throws Exception {
		List<ProjectVo> list = pservice.getProjectList();
		
		model.addAttribute("list", list);
		
		return "pages/sale/projectList";
	}
	
	@GetMapping(value = {"/productList/{index}", "/productList"})
	public String productList(Model model, @PathVariable(required = false)String index) throws Exception {
		List<ProductVo> list = pservice.getProductList();
		model.addAttribute("list", list);
		model.addAttribute("index", index);
		
		return "pages/sale/productList";
	}
	
	@GetMapping("/addproduct")
	public String addProduct(Model model) throws Exception {
		List<WarehouseVo> wList = pservice.getHouseList();
		
		model.addAttribute("wList", wList);
		
		return "pages/sale/addProduct";
	}
	
	@PostMapping("/addproduct")
	public String addProduct(ProductVo vo, Model model) throws Exception {
		
		int result = proservice.addProduct(vo);
		
		if (result > 0) {
			model.addAttribute("msg", "품목 등록 성공");
			return "pages/sale/popupClose";
		}else {
			model.addAttribute("msg", "품목 등록 실패");
			return "pages/sale/popupClose";
		}
	}
	
	@GetMapping("/print/{saleNo}")
	public String print(@PathVariable int saleNo, Model model) throws Exception {
		//판매정보
		SaleVo saleVo = saleService.getSale(saleNo);
		System.out.println("컨트롤러 세일vo ::: " + saleVo);
		model.addAttribute("sale", saleVo);
		
		//판매품목정보
		SaleListVo saleListVo = saleService.getSaleProductList(saleNo);
		model.addAttribute("saleList", saleListVo.getVoList());
		int cnt = saleListVo.getVoList().size();
		model.addAttribute("cnt", cnt);
		model.addAttribute("saleNo", saleNo);
		
		//거래처 정보
		ClientVo cVo = cservice.selectClientOne(String.valueOf(saleVo.getCNo()));
		model.addAttribute("client", cVo);
		
		return "pages/sale/printPopup";
	}
	
	@GetMapping("/orderList")
	public String orderList(Model model) throws Exception {
		List<OrderVo> list = pservice.getOrderList();
		
		model.addAttribute("list", list);
		
		return "pages/sale/orderList";
	}
}
