package com.kh.oup.chart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.chart.vo.MonthChartVo;
import com.kh.oup.chart.vo.ProjectChartVo;

@Repository
public class ChartDaoImpl implements ChartDao {

	@Autowired
	private SqlSession ss;

	@Override
	public List<MonthChartVo> getSalesList(String year) {
		return ss.selectList("chart.getSalesList",year);
	}

	@Override
	public List<ProjectChartVo> getPrjSalesList(String year) {
		return ss.selectList("chart.getPrjSalesList",year);
	}
	
	

}
