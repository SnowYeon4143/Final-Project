package com.kh.oup.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oup.approval.dao.ApprovalPopupDao;
import com.kh.oup.approval.vo.ApprovalODVo;
import com.kh.oup.approval.vo.ApprovalPJVo;
import com.kh.oup.approval.vo.ApprovalSPVo;
import com.kh.oup.order.vo.OrderVo;

@Service
public class ApprovalPopupServiceImpl implements ApprovalPopupService{

	@Autowired
	private ApprovalPopupDao dao;
	
	@Override
	public List<ApprovalODVo> getODList() throws Exception {
		List<ApprovalODVo> list = dao.getODList();
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setCName(dao.getCName(list.get(i).getCNo()));
			list.get(i).setPrice(dao.getPrice(list.get(i).getONo()));
		}
		
		return list;
	}

	@Override
	public List<ApprovalSPVo> getSPList() throws Exception {
		List<ApprovalSPVo> list = dao.getSPList();
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setCName(dao.getCName(list.get(i).getCNo()));
		}
		
		return list;
	}

	@Override
	public List<ApprovalPJVo> getPJList() throws Exception {
		List<ApprovalPJVo> list = dao.getPJList();
		
		return list;
	}

}
