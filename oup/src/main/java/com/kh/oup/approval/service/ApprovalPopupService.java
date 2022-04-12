package com.kh.oup.approval.service;

import java.util.List;

import com.kh.oup.approval.vo.ApprovalODVo;
import com.kh.oup.approval.vo.ApprovalPJVo;
import com.kh.oup.approval.vo.ApprovalSPVo;
import com.kh.oup.order.vo.OrderVo;

public interface ApprovalPopupService {

	List<ApprovalODVo> getODList() throws Exception;

	List<ApprovalSPVo> getSPList() throws Exception;

	List<ApprovalPJVo> getPJList() throws Exception;

}
