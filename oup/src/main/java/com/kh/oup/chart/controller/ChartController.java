package com.kh.oup.chart.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.oup.chart.service.ChartService;
import com.kh.oup.chart.vo.MonthChartVo;
import com.kh.oup.chart.vo.ProjectChartVo;

@Controller
@RequestMapping("charts")
public class ChartController {
	
	@Autowired
	private ChartService service;

	@GetMapping("monthly_charts")
	public String mchart(Model model,String year) {
		String year1 = null;
		if(year == null) {
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			year1 = format.format(date);			
		}else {
			year1 = year;
		}
		
	     int lastYear1 = Integer.parseInt(year1)-1;
	     String lastYear = Integer.toString(lastYear1);

	     List<MonthChartVo> thisList = service.getSalesList(year1);
	     List<MonthChartVo> lastList = service.getSalesList(lastYear);

	     model.addAttribute("thisList", thisList);	 
	     model.addAttribute("lastList", lastList);
	     model.addAttribute("selectYear", year1);
	     
	     int thisTotal = 0;
	     int sumuTotal = 0;
	     int lastTotal = 0;
	     
	     for(int i=0; i < thisList.size(); i++) {
	    	 thisTotal += thisList.get(i).getSums();
	    	 sumuTotal += thisList.get(i).getSumu();
	    	 lastTotal += lastList.get(i).getSums();
	     }
	     
	     model.addAttribute("thisTotal", thisTotal);
	     model.addAttribute("sumuTotal", sumuTotal);
	     model.addAttribute("lastTotal", lastTotal);
	     
	     
	     
	     Gson gson = new Gson();
	     
	     // 올해 판매 통계 -----------------------------------
	     JsonArray jArray1 = new JsonArray();
	     Iterator<MonthChartVo> it = thisList.iterator();
	     while(it.hasNext()) {
	    	 MonthChartVo mVo = it.next();
	     	JsonObject object1 = new JsonObject();

	     	String month = mVo.getMonth();
	     	int sums = mVo.getSums();
	     	int sumu = mVo.getSumu();
	     	int paid = mVo.getPaid();
	     	
	     	object1.addProperty("month", month);
	     	object1.addProperty("sums", sums);
	     	object1.addProperty("sumu", sumu);
	     	object1.addProperty("paid", paid);
	     	
	     	jArray1.add(object1);
	     }
	     String json1 = gson.toJson(jArray1);
	     
	     model.addAttribute("json1", json1);	     
	     
	    
	     // 작년 판매 통계 -----------------------------------
	     JsonArray jArray2 = new JsonArray();
	     Iterator<MonthChartVo> it2 = lastList.iterator();
	     while(it2.hasNext()) {
	    	 MonthChartVo mVo = it2.next();
	     	JsonObject object1 = new JsonObject();

	     	String month = mVo.getMonth();
	     	int sums = mVo.getSums();

	     	object1.addProperty("month", month);
	     	object1.addProperty("sums", sums);

	     	jArray2.add(object1);
	     }
	     String json2 = gson.toJson(jArray2);
	     
	     model.addAttribute("json2", json2);	 
	     
	     
	     
		return "pages/charts/monthly_charts";
	}
	
	
	
	
	@GetMapping("project_charts")
	public String pchart(Model model,String year) {
		String year1 = null;
		if(year == null) {
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			year1 = format.format(date);			
		}else {
			year1 = year;
		}
	     
	     List<ProjectChartVo> plist = service.getPrjSalesList(year1);
	     model.addAttribute("plist", plist);	
	     model.addAttribute("selectYear", year1);
	     
	     Gson gson = new Gson();
	     
	     // 올해 판매 통계 -----------------------------------
	     JsonArray jArray = new JsonArray();
	     Iterator<ProjectChartVo> it = plist.iterator();
	     
	     int cnt = 0;
	     while(it.hasNext()) {
	    	 ProjectChartVo pVo = it.next();
	     	JsonObject object = new JsonObject();

	     	int projectNo = pVo.getProjectNo();
	     	int saleSum = pVo.getSaleSum();
	     	
	     	object.addProperty("projectNo", projectNo);
	     	object.addProperty("saleSum", saleSum);
	     	
	     	jArray.add(object);
	     	
	     	cnt++;
	     	if(cnt>=10) {
	     		break;
	     	}
	     }
	     String json = gson.toJson(jArray);
	     
	     model.addAttribute("json", json);	
	   
		
		return "pages/charts/project_charts";
	}
	
	
}
