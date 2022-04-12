package com.kh.oup.statement.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.common.PageVo;
import com.kh.oup.statement.vo.SearchPageVo;
import com.kh.oup.statement.vo.StProductsVo;
import com.kh.oup.statement.vo.StatementVo;

@Repository
public class StatementDaoImpl implements StatementDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int getStCnt() {
		
		return ss.selectOne("statement.getStCnt");
	}

	@Override
	public List<StatementVo> getStList(PageVo pvo) {
		return ss.selectList("statement.getStList",pvo);
	}

	@Override
	public List<StatementVo> getSearchStList(SearchPageVo spv) {
		return ss.selectList("statement.getSearchStList",spv);
	}

	@Override
	public List<StProductsVo> getStProductsList() {
		return ss.selectList("statement.getStProductsList");
	}
	//상세보기 _ 명세서
	@Override
	public StatementVo getStatement(int orderNo) {
		return ss.selectOne("statement.getStatement",orderNo);
	}

	//상세보기 _ 명세서 product list
	@Override
	public List<StProductsVo> getStProductsList(int orderNo) {
		return ss.selectList("statement.getStProductsListNo",orderNo);
	}

	@Override
	public int insertSt(StatementVo stVo) {
		return ss.insert("statement.insertSt",stVo);
	}
	//명세서 수정
	@Override
	public int updateSt(StatementVo stVo) {
		return ss.update("statement.updateSt",stVo);
	}
	//명세서 수정 - 주문정보 수정
	@Override
	public int updateOrder(StatementVo stVo) {
		return ss.update("statement.updateOrder",stVo);
	}

	@Override
	public int getSearchStCnt(SearchPageVo spv) {
		return ss.selectOne("statement.getSearchStCnt",spv);
	}

	@Override
	public int deleteCk(String[] delArr) {
		return ss.delete("statement.deleteCk",delArr);
	}

	@Override
	public int deleteSt(int sNo) {
		return ss.delete("statement.deleteSt",sNo);
	}

}
