package com.kh.oup.chart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oup.chart.dao.ChartDao;
import com.kh.oup.chart.vo.MonthChartVo;
import com.kh.oup.chart.vo.ProjectChartVo;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartDao dao;

	@Override
	public List<MonthChartVo> getSalesList(String year) {
		return dao.getSalesList(year);
	}

	@Override
	public List<ProjectChartVo> getPrjSalesList(String year1) {
		List<ProjectChartVo> result = dao.getPrjSalesList(year1);
		return result;
	}
	


}
