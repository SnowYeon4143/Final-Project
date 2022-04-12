package com.kh.oup.project.controller;

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

import com.kh.oup.common.PageVo;
import com.kh.oup.project.service.ProjectService;
import com.kh.oup.project.vo.DeptVo;
import com.kh.oup.project.vo.PrjOder;
import com.kh.oup.project.vo.ProjectGroupVo;
import com.kh.oup.project.vo.ProjectVo;
import com.kh.oup.project.vo.TeamVo;

@Controller
@RequestMapping("project")
public class ProjectController {

	@Autowired
	private ProjectService service;
	
	//등록 화면
	@GetMapping("project_add")
	public String project_add() {
		return "pages/project/project_add";
	}
	
	//등록 처리
	@PostMapping("project_add")
	public String project_add(ProjectVo vo,int[] employeeNo) { 

		 int resultPrj = service.enrollPrj(vo);
		 int projectNo = service.getPrjNo();
		 System.out.println(projectNo);
		 
		 if(employeeNo.length > 1) {
			 int resultPg = service.enrollPg(employeeNo,projectNo); 
		 }
		 
		 
		 if(resultPrj>0) { 
			 return "redirect:/project/project_list"; 
		 }else { 
			return "redirect:/project/project_add"; 
		 }
		 
	}

	
	//자세히보기
	@GetMapping(value={"project_detail/{projectNo}"})
	public String project_detail(Model model, @PathVariable(required=false) int projectNo) {
		ProjectVo prjVo = service.selectPrj(projectNo);
		List<ProjectGroupVo> glist = service.selectPrjgroup(projectNo);
		List<PrjOder> olist = service.selectOlist(projectNo); 
		List<Integer> slist = service.selectSaleList(projectNo);	
		
		model.addAttribute("prjVo",prjVo);
		model.addAttribute("glist",glist);
		model.addAttribute("olist",olist);
		model.addAttribute("slist",slist);
		
		return "pages/project/project_detail";
	}
	
	//수정 페이지로 이동
	@GetMapping(value={"project_edit/{projectNo}"})
	public String project_edit(Model model, @PathVariable(required=false) int projectNo) {

		ProjectVo prjVo = service.selectPrj(projectNo);
		List<ProjectGroupVo> glist = service.selectPrjgroup(projectNo);
		model.addAttribute("prjVo",prjVo);
		model.addAttribute("glist",glist);
		return "pages/project/project_edit";
	}
	//수정 처리
	@PostMapping("project_edit")
	public String project_editt(ProjectVo vo, int[] employeeNo) { 
		 int projectNo = vo.getProjectNo();
		 
		 if(employeeNo.length > 1) {
			 int delPg = service.delPg(projectNo);
			 int insertPg  = service.enrollPg(employeeNo,projectNo);
		 }
			
		int result = service.editPrj(vo);
		if(result>0) {
			return "redirect:/project/project_list"; 
		}else {
			return "redirect:/project/project_edit";
		}
		
	}
	
	
	//삭제 =====================================
	@PostMapping("project_del")
	public String project_del(int projectNo) {
		int delPg = service.delPg(projectNo);
		int result = service.delPrj(projectNo);
		return "pages/project/project_list";
	}
	
	//조회 ===========================================
	@GetMapping(value = {"/project_list/{page}","/project_list"})
	public String project_list(Model model, @PathVariable(required=false) String page, HttpServletRequest req) throws Exception {
		
		String search = req.getParameter("search");
		
		if(page == null || page == "" || Integer.parseInt(page) <= 0) {
			page="1"; 
			}
		
		
		if(search == null) { //검색없이 조회 ===============================================================
			int cntPerPage = 10; //10 rows
			int pageBtnCnt = 3; 
			int totalRow = service.getPrjCnt();
			PageVo pvo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow);
			
			//리스트조회
			List<ProjectVo> plist = service.getPrjList(pvo);
			List<ProjectGroupVo> glist = service.getGroupList();
			
			for(int i=0;i<plist.size();i++) {
				String members = "";
				for(int j=0; j< glist.size();j++) {
					if(plist.get(i).getProjectNo() == glist.get(j).getProjectNo()) {
						members += glist.get(j).getEmployeeName() +"  ";
					}
				}
				plist.get(i).setGroupMembers(members);
			}
			
			model.addAttribute("plist",plist);
			model.addAttribute("page",pvo);
		}
		if(search != null) { //검색 조회 ===============================================================
			int cntPerPage = 10; //10 rows
			int pageBtnCnt = 3; 
			int totalRow = service.getSearchPrjCnt(search);
			PageVo pvo = new PageVo(page, cntPerPage, pageBtnCnt, totalRow, search);
			
			List<ProjectVo> plist = service.getSearchPrjList(pvo);
			List<ProjectGroupVo> glist = service.getGroupList();
			
			for(int i=0;i<plist.size();i++) {
				String members = "";
				for(int j=0; j< glist.size();j++) {
					if(plist.get(i).getProjectNo() == glist.get(j).getProjectNo()) {
						members += glist.get(j).getEmployeeName() +"  ";
					}
				}
				plist.get(i).setGroupMembers(members);
			}
			model.addAttribute("plist",plist);
			model.addAttribute("page",pvo);
		}
		return "pages/project/project_list";
	}
	
	
	
	
	
//====================  popup  =================================
	
	@GetMapping("search_member")
	public String search_member(Model model) {
		
		List<DeptVo> dlist = service.selectDeptList();
		model.addAttribute("dlist",dlist);
		return "pages/project/search_member";
	}	
	
	@PostMapping("search_member.do")
	@ResponseBody
	public List<TeamVo> search_team(String departCode,Model model) {
		
		List<TeamVo> tlist = service.selectTeamList(departCode);
		model.addAttribute("tlist",tlist);
		return tlist;
	}
	
	
	@GetMapping("search_m")
	public String search_m(String deptCode ,String teamCode ,Model model) {
		System.out.println(deptCode+"and"+teamCode);
		
		if(deptCode==null || teamCode==null) {
			return "redirect:search_member";
		}else {
			List<ProjectGroupVo> elist = service.selectEmpList(teamCode);
			model.addAttribute("elist",elist);

			List<DeptVo> dlist = service.selectDeptList();
			model.addAttribute("dlist",dlist);
			return "pages/project/search_member";
		}
	}
	
	@GetMapping("search_members")
	public String search_members(Model model) {
		
		List<DeptVo> dlist = service.selectDeptList();
		model.addAttribute("dlist",dlist);
		return "pages/project/search_members";
	}
	
	@GetMapping("search_ms")
	public String search_ms(String deptCode ,String teamCode ,Model model) {
		System.out.println(deptCode+"and"+teamCode);
		
		if(deptCode==null || teamCode==null) {
			return "redirect:search_members";
		}else {
			List<ProjectGroupVo> elist = service.selectEmpList(teamCode);
			model.addAttribute("elist",elist);

			List<DeptVo> dlist = service.selectDeptList();
			model.addAttribute("dlist",dlist);
			return "pages/project/search_members";
		}
	}
	
	
}
