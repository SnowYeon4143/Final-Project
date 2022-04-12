package com.kh.oup.approval.dao;

import java.util.List;

import com.kh.oup.approval.vo.ApprovalODVo;
import com.kh.oup.approval.vo.ApprovalPJVo;
import com.kh.oup.approval.vo.ApprovalSPVo;

public interface ApprovalPopupDao {

	List<ApprovalODVo> getODList() throws Exception;

	String getCName(int cNo) throws Exception;

	int getPrice(int oNo) throws Exception;

	List<ApprovalSPVo> getSPList() throws Exception;

	List<ApprovalPJVo> getPJList() throws Exception;

}
