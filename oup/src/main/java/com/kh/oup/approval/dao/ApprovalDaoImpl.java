package com.kh.oup.approval.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.approval.vo.ApprovalVo;
import com.kh.oup.common.PageVo;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int appSend(ApprovalVo vo) throws Exception {
		return ss.insert("approval.appSend", vo);
	}

	@Override
	public int getSendAppCnt(String loginName) throws Exception {
		return ss.selectOne("approval.getSendAppCnt", loginName);
	}

	@Override
	public List<ApprovalVo> getSendApprovalList(PageVo vo, String loginName) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("page", vo);
		test.put("loginName", loginName);
		
		return ss.selectList("approval.getSendApprovalList", test);
	}

	@Override
	public List<ApprovalVo> getReceiveApprovalList(PageVo vo, String loginjobTitleCode) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("page", vo);
		test.put("loginjobTitleCode", loginjobTitleCode);
				
		return ss.selectList("approval.getReceiveApprovalList", test);
	}

	@Override
	public int getCompleteAppCnt(String loginName) throws Exception {
		return ss.selectOne("approval.getCompleteAppCnt", loginName);
	}

	@Override
	public int getReceiveAppCnt(String loginjobTitleCode) throws Exception {
		return ss.selectOne("approval.getReceiveAppCnt", loginjobTitleCode);
	}

	@Override
	public List<ApprovalVo> getCompleteAppList(PageVo vo, String loginName) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("page", vo);
		test.put("loginName", loginName);
				
		return ss.selectList("approval.getCompleteAppList", test);
	}

	@Override
	public ApprovalVo getApproval(int ano) throws Exception {
		return ss.selectOne("approval.getApproval", ano);
	}

	@Override
	public int getOrderNo(int ano) throws Exception {
		return ss.selectOne("approval.getOrderNo", ano);
	}

	@Override
	public int getProjectNo(int aDocNo) throws Exception {
		return ss.selectOne("approval.getProjectNo", aDocNo);
	}

	@Override
	public String getTeamCode(String aPicName) throws Exception {
		return ss.selectOne("approval.getTeamCode", aPicName);
	}

	@Override
	public String getTeamLeaderNo(String teamCode) throws Exception {
		return ss.selectOne("approval.getTeamLeaderNo", teamCode);
	}

	@Override
	public int appTeamY(ApprovalVo approval) throws Exception {
		//결재 테이블의 팀장 결재 체크
		int result = ss.update("approval.appTeamY", approval.getANo());
		
		
		return result;
	}

	@Override
	public String getallCode(String dcCode) throws Exception {
		return ss.selectOne("approval.getAllCode", dcCode);
	}

	@Override
	public int appAllY(ApprovalVo approval) throws Exception {
		//결재 테이블의 결정권자 결재 체크
		int result = ss.update("approval.appAllY", approval.getANo());
		return result;
	}

	@Override
	public String getDecCode(String dcCode) throws Exception {
		return ss.selectOne("approval.getDecCode", dcCode);
	}

	@Override
	public int appDecY(ApprovalVo approval) throws Exception {
		//결재 테이블의 전결권자 결재 체크
		int result = ss.update("approval.appDecY", approval.getANo());
		return result;
	}

	@Override
	public int statementY(ApprovalVo newApp) throws Exception {
		int result1 = ss.update("approval.statementY", newApp.getANo());
		//문서타입에 따라 거래명세서, 프로젝트, 주문서의 결재상태 변경
		int result2 = ss.update("approval.docFinalY", newApp);
		return result1;
	}


}
