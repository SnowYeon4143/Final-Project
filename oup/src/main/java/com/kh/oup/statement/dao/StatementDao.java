package com.kh.oup.statement.dao;

import java.util.List;

import com.kh.oup.common.PageVo;
import com.kh.oup.statement.vo.SearchPageVo;
import com.kh.oup.statement.vo.StProductsVo;
import com.kh.oup.statement.vo.StatementVo;

public interface StatementDao {

	int getStCnt();

	List<StatementVo> getStList(PageVo pvo);

	List<StatementVo> getSearchStList(SearchPageVo spv);

	List<StProductsVo> getStProductsList();

	List<StProductsVo> getStProductsList(int orderNo);

	StatementVo getStatement(int orderNo);

	int insertSt(StatementVo stVo);

	int updateSt(StatementVo stVo);

	int updateOrder(StatementVo stVo);

	int getSearchStCnt(SearchPageVo spv);

	int deleteCk(String[] delArr);

	int deleteSt(int sNo);

}
