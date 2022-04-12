package com.kh.oup.chart.dao;

import java.util.List;

import com.kh.oup.chart.vo.MonthChartVo;
import com.kh.oup.chart.vo.ProjectChartVo;

public interface ChartDao {

	List<MonthChartVo> getSalesList(String year);

	List<ProjectChartVo> getPrjSalesList(String year1);



}
