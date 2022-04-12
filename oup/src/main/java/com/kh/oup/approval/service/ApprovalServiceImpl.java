package com.kh.oup.approval.service;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oup.approval.dao.ApprovalDao;
import com.kh.oup.approval.vo.ApprovalVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.employee.vo.EmployeeVo;
import com.kh.oup.mail.vo.MailVo;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private ApprovalDao dao;
	
	@Override
	public int appSend(ApprovalVo vo, HttpServletRequest req) throws Exception {
		Random random = new Random();
		
		MultipartFile file = vo.getAttachment();
		
		if(file.getOriginalFilename() != "") {
			String path = req.getServletContext().getRealPath("/resources/dist/img/approval/");
			String chargeName = System.currentTimeMillis() + "_" + random.nextInt() + "_" + file.getOriginalFilename();
			vo.setChangeName(chargeName);
			vo.setOriginName(file.getOriginalFilename());
			
			File newfile = new File(path + chargeName);
			file.transferTo(newfile);
		}
		
		int result = dao.appSend(vo);
		
		return result;
	}

	@Override
	public int getSendAppCnt(String loginName) throws Exception {
		return dao.getSendAppCnt(loginName);
	}

	@Override
	public List<ApprovalVo> getSendApprovalList(PageVo vo, String loginName) throws Exception {
		List<ApprovalVo> list = dao.getSendApprovalList(vo, loginName);
		
		return list;
	}

	@Override
	public List<ApprovalVo> getReceiveApprovalList(PageVo vo, String loginjobTitleCode) throws Exception {
		List<ApprovalVo> list = dao.getReceiveApprovalList(vo, loginjobTitleCode);
		
		return list;
	}

	@Override
	public int getCompleteAppCnt(String loginName) throws Exception {
		return dao.getCompleteAppCnt(loginName);
	}

	@Override
	public int getReceiveAppCnt(String loginjobTitleCode) throws Exception {
		return dao.getReceiveAppCnt(loginjobTitleCode);
	}

	@Override
	public List<ApprovalVo> getCompleteApprovalList(PageVo vo, String loginName) throws Exception {
		List<ApprovalVo> list = dao.getCompleteAppList(vo, loginName);
		
		return list;
	}

	@Override
	public ApprovalVo getApproval(int ano) throws Exception {
		ApprovalVo app = dao.getApproval(ano);
		
		return app;
	}

	@Override
	public int getorderNo(int ano) throws Exception {
		return dao.getOrderNo(ano);
	}

	@Override
	public int getProjectNo(int aDocNo) throws Exception {
		return dao.getProjectNo(aDocNo);
	}

	@Override
	public int appCheck(ApprovalVo approval, EmployeeVo loginEmployee) throws Exception {
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		//신청자 팀 확인
		String teamCode = dao.getTeamCode(approval.getAPicName());
		
		//팀리더 번호 가져옴
		String leaderNo = dao.getTeamLeaderNo(teamCode);
		
		//결재 버튼을 누른 사람이 신청자 팀의 팀장인지 확인
		if(leaderNo.equals(String.valueOf(loginEmployee.getEmployeeNo()))) {
			//팀장결재 체크 
			result1 = dao.appTeamY(approval);
		}
		
		//전결규정 전결권자 직급코드 가져옴
		String decCode = dao.getDecCode(approval.getDcCode());
		//전결권자인지 확인
		if(decCode.equals(loginEmployee.getJobTitleCode())) {
			//전결권자 체크
			result2 = dao.appDecY(approval);
		}
		
		//전결규정 결정권자 직급코드 가져옴
		String allCode = dao.getallCode(approval.getDcCode());
		//결정권자인지 확인
		if(allCode.equals(loginEmployee.getJobTitleCode())) {
			//결정권자 체크
			result3 = dao.appAllY(approval);
		}
		
		int result = result1 + result2 + result3;
		System.out.println(result);
		return result;
	}

	@Override
	public int StatementY(ApprovalVo newApp) throws Exception {
		return dao.statementY(newApp);
	}


}
