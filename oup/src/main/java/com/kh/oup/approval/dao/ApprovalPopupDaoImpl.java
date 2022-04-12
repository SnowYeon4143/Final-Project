package com.kh.oup.approval.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.approval.vo.ApprovalODVo;
import com.kh.oup.approval.vo.ApprovalPJVo;
import com.kh.oup.approval.vo.ApprovalSPVo;

@Repository
public class ApprovalPopupDaoImpl implements ApprovalPopupDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<ApprovalODVo> getODList() throws Exception {
		return ss.selectList("approval.getODList");
	}

	@Override
	public String getCName(int cNo) throws Exception {
		return ss.selectOne("sale.getCName", cNo);
	}

	@Override
	public int getPrice(int oNo) {
		return ss.selectOne("approval.getODPrice", oNo);
	}

	@Override
	public List<ApprovalSPVo> getSPList() throws Exception {
		return ss.selectList("approval.getSPList");
	}

	@Override
	public List<ApprovalPJVo> getPJList() throws Exception {
		return ss.selectList("approval.getPJList");
	}
	
}
