package com.kh.oup.approval.controller;

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

import com.kh.oup.approval.service.ApprovalPopupService;
import com.kh.oup.approval.service.ApprovalService;
import com.kh.oup.approval.vo.ApprovalODVo;
import com.kh.oup.approval.vo.ApprovalPJVo;
import com.kh.oup.approval.vo.ApprovalSPVo;
import com.kh.oup.approval.vo.ApprovalVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.employee.vo.EmployeeVo;
import com.kh.oup.project.service.ProjectService;
import com.kh.oup.project.vo.ProjectGroupVo;
import com.kh.oup.project.vo.ProjectVo;
import com.kh.oup.statement.service.StatementService;
import com.kh.oup.statement.vo.StProductsVo;
import com.kh.oup.statement.vo.StatementVo;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@Autowired
	private ApprovalPopupService popupservice;
	@Autowired
	private ApprovalService service;
	@Autowired 
	private StatementService sservice;
	@Autowired
	private ProjectService pservice;
	
	@GetMapping("/send")
	public String appSend() {
		return "pages/approval/approvalSend";
	}
	
	@PostMapping("/send")
	public String appSend(ApprovalVo vo, HttpServletRequest request, HttpServletRequest req) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo)session.getAttribute("loginEmployee");
		String loginName = loginEmployee.getEmployeeName();
		vo.setAPicName(loginName); //신청자
		
		if(vo.getDcCode().equals("DF")) {
			vo.setArNo(1);
		}else if (vo.getDcCode().equals("ES")) {
			vo.setArNo(2);
		}else if (vo.getDcCode().equals("SP")) {
			vo.setArNo(3);
		}else if (vo.getDcCode().equals("PJ")) {
			vo.setArNo(4);
		}else if (vo.getDcCode().equals("OD")) {
			vo.setArNo(5);
		}
		
		System.out.println(vo);
		service.appSend(vo, req);
		
		return "redirect:/approval/sendbox/1";
	}
	
	
	//거래명세서
	@GetMapping("/SP")
	public String getSPList(Model model) throws Exception {
		List<ApprovalSPVo> list = popupservice.getSPList();
		
		model.addAttribute("list", list);
		
		return "pages/approval/SPList";
	}
	
	//주문서
	@GetMapping("/OD")
	public String getODList(Model model) throws Exception {
		List<ApprovalODVo> list = popupservice.getODList();
		
		model.addAttribute("list", list);
		
		return "pages/approval/ODList";
	}
	
	//프로젝트
	@GetMapping("/PJ")
	public String getPJList(Model model) throws Exception {
		List<ApprovalPJVo> list = popupservice.getPJList();
		
		model.addAttribute("list", list);
		
		return "pages/approval/PJList";
	}
	
	@GetMapping(value = {"/sendbox/{page}", "/sendbox"})
	public String appBoxSend(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo)session.getAttribute("loginEmployee");
		String loginName = loginEmployee.getEmployeeName();
		
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		int totalRow = service.getSendAppCnt(loginName);
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(10);
		
		List<ApprovalVo> list = service.getSendApprovalList(vo, loginName);
		model.addAttribute("list", list);
		model.addAttribute("page", vo);

		return "pages/approval/approvalBoxSend";
	}
	
	@GetMapping(value = {"/receivebox/{page}", "/receivebox"})
	public String appReceiveBox(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo)session.getAttribute("loginEmployee");
		String loginjobTitleCode = loginEmployee.getJobTitleCode();
		
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		int totalRow = service.getReceiveAppCnt(loginjobTitleCode);
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(15);
		
		List<ApprovalVo> list = service.getReceiveApprovalList(vo, loginjobTitleCode);
		model.addAttribute("list", list);
		model.addAttribute("page", vo);
		
		return "pages/approval/approvalBoxReceive";
	}
	
	@GetMapping(value = {"/complete/{page}", "/complete"})
	public String completeBox(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo)session.getAttribute("loginEmployee");
		String loginName = loginEmployee.getEmployeeName();
		
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		int totalRow = service.getCompleteAppCnt(loginName);
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(15);
		
		List<ApprovalVo> list = service.getCompleteApprovalList(vo, loginName);
		model.addAttribute("list", list);
		model.addAttribute("page", vo);
		
		return "pages/approval/approvalComplete";
	}
	
	@GetMapping(value = {"/detail/{ano}", "/detail"})
	public String appDetail(Model model, @PathVariable(required = false)int ano, HttpServletRequest request) throws Exception {
		ApprovalVo approval = service.getApproval(ano);
		model.addAttribute("approval", approval);
		//거래명세서
		if(approval.getDcCode().equals("SP")) {
			//주문서번호 가져오기
			int orderNo = service.getorderNo(approval.getADocNo());
			StatementVo stVo = sservice.getStatement(orderNo);
			List<StProductsVo> plist = sservice.getStProductsList(orderNo);
			
			int total=0;
			for(int i=0;i<plist.size();i++) {
				total += ((plist.get(i).getONum())*(plist.get(i).getPUnitPrice()));
			}
			stVo.setSTotal(total);
			
			model.addAttribute("stVo",stVo);
			model.addAttribute("plist",plist);
		}
		
		//프로젝트
		if(approval.getDcCode().equals("PJ")) {
			int projectNo = service.getProjectNo(approval.getADocNo());
			ProjectVo prjVo = pservice.selectPrj(projectNo);
			List<ProjectGroupVo> glist = pservice.selectPrjgroup(projectNo);
			model.addAttribute("prjVo",prjVo);
			model.addAttribute("glist",glist);
		}
		
		return "pages/approval/approvalDetail";
	}
	
	@PostMapping(value = {"/detail/{ano}", "/detail"})
	public String appCheck(Model model, @PathVariable(required = false)int ano, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		EmployeeVo loginEmployee = (EmployeeVo)session.getAttribute("loginEmployee");
		
		ApprovalVo approval = service.getApproval(ano);
	
		//결재 버튼을 누른 사원의 직위를 확인하여 체크
		service.appCheck(approval, loginEmployee);
		
		//결재를 눌렀을때 팀장, 전결권자, 결정권자가 모두 체크하였는지 확인하고 최종결재 승인
		ApprovalVo newApp = service.getApproval(ano);
		if(newApp.getATeamNy() == 'Y' && newApp.getADecNy() == 'Y' && newApp.getAAllDecNy() == 'Y') {
			service.StatementY(newApp);
		}
		
		return "redirect:/approval/receivebox/1";
	}

}
