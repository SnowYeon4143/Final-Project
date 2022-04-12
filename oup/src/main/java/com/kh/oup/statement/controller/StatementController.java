package com.kh.oup.statement.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oup.client.service.ClientService;
import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.project.service.ProjectService;
import com.kh.oup.project.vo.DeptVo;
import com.kh.oup.project.vo.ProjectGroupVo;
import com.kh.oup.project.vo.TeamVo;
import com.kh.oup.statement.service.StatementService;
import com.kh.oup.statement.vo.SearchPageVo;
import com.kh.oup.statement.vo.StProductsVo;
import com.kh.oup.statement.vo.StatementVo;

@Controller
@RequestMapping("statement")
public class StatementController {

	
	 @Autowired 
	 private StatementService service;
	 
	 @Autowired
	 private ProjectService service2;
	 
	 @Autowired
	 private ClientService service3;
	
	
	//명세서 발행 ----- 페이지 보여주기
	@GetMapping("statement_enroll/{orderNo}")
	public String statement_add_view(Model model, @PathVariable(required=false) int orderNo) {
	
		StatementVo stVo = service.getStatement(orderNo);
		List<StProductsVo> plist = service.getStProductsList(orderNo);
		
		int total=0;
		for(int i=0;i<plist.size();i++) {
			total += ((plist.get(i).getONum())*(plist.get(i).getPUnitPrice()));
		}
		stVo.setSTotal(total);
		
		
		model.addAttribute("stVo",stVo);
		model.addAttribute("plist",plist);
		
		return "pages/statement/statement_enroll";
	}
	
	
	//명세서 발행 ----- 로직처리
	@PostMapping("statement_enroll")
	public String statement_enroll(StatementVo stVo) {
		
		System.out.println("enroll 확인");
				
		int result = service.insertSt(stVo);
		if(result>0) {
			return "redirect:/statement/statement_list";
		}else {
			return "redirect:/statement/statement_list";
		}
	}

	
	//상세페이지 보여주기
	@GetMapping("statement_detail/{orderNo}")
	public String statement_detail(Model model, @PathVariable(required=false) int orderNo) {
		
		StatementVo stVo = service.getStatement(orderNo);
		List<StProductsVo> plist = service.getStProductsList(orderNo);
		
		int total=0;
		for(int i=0;i<plist.size();i++) {
			total += ((plist.get(i).getONum())*(plist.get(i).getPUnitPrice()));
		}
		stVo.setSTotal(total);

		model.addAttribute("stVo",stVo);
		model.addAttribute("plist",plist);
		
		return "pages/statement/statement_detail";
	}
	
	
	//수정 보기
	@GetMapping("statement_edit/{orderNo}")
	public String statement_edit_view(Model model, @PathVariable(required=false) int orderNo) {

		StatementVo stVo = service.getStatement(orderNo);
		List<StProductsVo> plist = service.getStProductsList(orderNo);
		
		int total=0;
		for(int i=0;i<plist.size();i++) {
			total += ((plist.get(i).getONum())*(plist.get(i).getPUnitPrice()));
		}
		stVo.setSTotal(total);

		model.addAttribute("stVo",stVo);
		model.addAttribute("plist",plist);
		
		return "pages/statement/statement_edit";
	}
	
	//수정 처리
	@PostMapping("statement_edit")
	public String statement_edit(StatementVo stVo, HttpServletResponse resp) {
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		
		int orderNo = stVo.getONo();
		
		StatementVo stOrigin = service.getStatement(orderNo);
		int originCno = stOrigin.getCNo();
		int originManager = stOrigin.getManager();
		
		//변경사항 없는 경우
		if(originCno == stVo.getCNo() && originManager == stVo.getManager()) {
			try {
				out = resp.getWriter();
				String str ="<script>alert('변경사항이 없습니다.'); location.href='/oup/statement/statement_edit/"+orderNo+"';</script>";
				out.println(str);
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:/statement/statement_list";
		}else {
			int updateSt = service.updateSt(stVo);
			int updateOrder = service.updateOrder(stVo);
			if(updateSt >0 && updateOrder>0) {
				return "redirect:/statement/statement_detail/"+orderNo;
			}else {
				return "redirect:/statement/statement_list"; //에러페이로 이동 >> 수정하기
			}
		}
		
	}
	
	
	@PostMapping("delete_ck")
	@ResponseBody
	public String delete_ck(String str) throws Exception {
		int result = service.deleteCk(str);
		
		if(result == str.length()/2) { 
			return "ok";
		}else {
			return "fail_" + result;
		}
	}
	
	@GetMapping("delete/{sNo}")
	public String delet(@PathVariable(required=false) int sNo) {
		int result = service.deleteSt(sNo);
		
		if(result > 0) { 
			return "redirect:/statement/statement_list";
		}else {
			return "redirect:/statement/statement_list";
		}
		
	}
	
	
	
	//조회
	@GetMapping(value = {"/statement_list","/statement_list/{page}"})
	public String statement_list(Model model, @PathVariable(required=false) String page, SearchPageVo spv)throws Exception {
		
		if(page == null || Integer.parseInt(page) <= 0) {
			page="1"; 
			}
		
		if( (spv.getSearch() == null || "".equals(spv.getSearch())) && spv.getDate1() == null && spv.getDate2() == null) {
			int cntPerPage = 10; //10 rows
			int pageBtnCnt = 3; 
			int totalRow = service.getStCnt();
			PageVo pvo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
			
			List<StatementVo> slist = service.getStatementList(pvo);
			List<StProductsVo> plist = service.getStProductsList();
			
			spv.setCurrentPage(pvo.getCurrentPage());
			spv.setCntPerPage(pvo.getCntPerPage());
			spv.setPageBtnCnt(pvo.getPageBtnCnt());
			spv.setTotalRow(pvo.getTotalRow());
			spv.setStartRow(pvo.getStartRow());
			spv.setEndRow(pvo.getEndRow());
			spv.setStartPage(pvo.getStartPage());
			spv.setEndPage(pvo.getEndPage());
			spv.setLastPage(pvo.getLastPage());
			
			
			//sku
			for(int i = 0; i<slist.size(); i++) {
				int sku = 0;
				for(int j =0; j<plist.size(); j++) {
					if(slist.get(i).getONo() == plist.get(j).getONo()) {
					sku += 1;	
					}
				}
				slist.get(i).setSku(sku);
			}
			
			//합계 합산
			for(int i = 0; i<slist.size(); i++) {
				if(slist.get(i).getSTotal() == 0) {
					int total=0;
					for(int j =0; j<plist.size(); j++) {
						if(slist.get(i).getONo() == plist.get(j).getONo()) {
							total+=((plist.get(j).getONum())*(plist.get(j).getPUnitPrice()));
						}
					}
					slist.get(i).setSTotal(total);
				}
			}
			
			model.addAttribute("slist",slist);
			model.addAttribute("page",spv);
		}
		if( (spv.getSearch() != null || !"".equals(spv.getSearch())) || spv.getDate1() != null || spv.getDate2() != null) {
			
			int cntPerPage = 10; //10 rows
			int pageBtnCnt = 3; 
			int totalRow = service.getSearchStCnt(spv);
			PageVo pvo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
			
			spv.setCurrentPage(pvo.getCurrentPage());
			spv.setCntPerPage(pvo.getCntPerPage());
			spv.setPageBtnCnt(pvo.getPageBtnCnt());
			spv.setTotalRow(pvo.getTotalRow());
			spv.setStartRow(pvo.getStartRow());
			spv.setEndRow(pvo.getEndRow());
			spv.setStartPage(pvo.getStartPage());
			spv.setEndPage(pvo.getEndPage());
			spv.setLastPage(pvo.getLastPage());
			
			List<StatementVo> slist = service.getSearchStList(spv);
			List<StProductsVo> plist = service.getStProductsList();
			
			//sku
			for(int i = 0; i<slist.size(); i++) {
				int sku = 0;
				for(int j =0; j<plist.size(); j++) {
					if(slist.get(i).getONo() == plist.get(j).getONo()) {
					sku += 1;	
					}
				}
				slist.get(i).setSku(sku);
			}
			
			
			//합계 합산
			for(int i = 0; i<slist.size(); i++) {
				if(slist.get(i).getSTotal() == 0) {
					int total=0;
					for(int j =0; j<plist.size(); j++) {
						if(slist.get(i).getONo() == plist.get(j).getONo()) {
							total+=((plist.get(j).getONum())*(plist.get(j).getPUnitPrice()));
						}
					}
					slist.get(i).setSTotal(total);
				}
			}
			
			model.addAttribute("slist",slist);
			model.addAttribute("page",spv);
		}
		
		
		
		
		return "pages/statement/statement_list";
	}
	
	
	
	//====================  popup  =================================
	
		@GetMapping("search_member")
		public String search_member(Model model) {
			
			List<DeptVo> dlist = service2.selectDeptList();
			//System.out.println(dlist);
			model.addAttribute("dlist",dlist);
			return "pages/statement/search_member2";
		}	
		
		
		@PostMapping("search_member.do")
		@ResponseBody
		public List<TeamVo> search_team(String departCode,Model model) {
			//System.out.println(departCode);
			
			List<TeamVo> tlist = service2.selectTeamList(departCode);
			//System.out.println(tlist);
			model.addAttribute("tlist",tlist);
			return tlist;
		}
		
		@GetMapping("search_m")
		public String search_m(String deptCode ,String teamCode ,Model model) {
			System.out.println(deptCode+"and"+teamCode);
			
			if(deptCode==null || teamCode==null) {
				//System.out.println(deptCode+"//"+teamCode);
				return "redirect:search_member2";
			}else {
				List<ProjectGroupVo> elist = service2.selectEmpList(teamCode);
				//System.out.println(elist);
				model.addAttribute("elist",elist);

				List<DeptVo> dlist = service2.selectDeptList();
				model.addAttribute("dlist",dlist);
				return "pages/statement/search_member2";
			}
		}
	
			
		//================= serch client popup =================================
		@GetMapping("searchClient")
		public String searchClient(HttpServletRequest req, Model model) throws Exception {
			String search = req.getParameter("search");
			
			if(search == null) {
				return "pages/satement/searchClient";
			}
			
			if(search != null) {
				List<ClientVo> list = service3.getSearchClientList(search);
				model.addAttribute("list",list);
				model.addAttribute("search", search);
			}
			
			return "pages/statement/searchClient";
		}
		
		
	
}//class
