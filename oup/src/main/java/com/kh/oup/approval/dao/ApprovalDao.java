package com.kh.oup.approval.dao;

import java.util.List;

import com.kh.oup.approval.vo.ApprovalVo;
import com.kh.oup.common.PageVo;

public interface ApprovalDao {

	int appSend(ApprovalVo vo) throws Exception;

	int getSendAppCnt(String loginName) throws Exception;

	List<ApprovalVo> getSendApprovalList(PageVo vo, String loginName) throws Exception;

	List<ApprovalVo> getReceiveApprovalList(PageVo vo, String loginjobTitleCode) throws Exception;

	int getCompleteAppCnt(String loginName) throws Exception;

	int getReceiveAppCnt(String loginjobTitleCode) throws Exception;

	List<ApprovalVo> getCompleteAppList(PageVo vo, String loginName) throws Exception;

	ApprovalVo getApproval(int ano) throws Exception;

	int getOrderNo(int ano) throws Exception;

	int getProjectNo(int aDocNo) throws Exception;

	String getTeamCode(String aPicName) throws Exception;

	String getTeamLeaderNo(String teamCode) throws Exception;

	int appTeamY(ApprovalVo approval) throws Exception;

	String getallCode(String dcCodeNo) throws Exception;

	int appAllY(ApprovalVo approval) throws Exception;

	String getDecCode(String dcCode) throws Exception;

	int appDecY(ApprovalVo approval) throws Exception;

	int statementY(ApprovalVo newApp) throws Exception;

}
