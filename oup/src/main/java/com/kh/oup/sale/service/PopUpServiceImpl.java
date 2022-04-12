package com.kh.oup.sale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oup.product.vo.ProductVo;
import com.kh.oup.project.vo.ProjectVo;
import com.kh.oup.sale.dao.PopUpDao;
import com.kh.oup.sale.dao.SaleDao;
import com.kh.oup.sale.vo.OrderVo;
import com.kh.oup.sale.vo.WarehouseVo;

@Service
public class PopUpServiceImpl implements PopUpService{

	@Autowired
	private PopUpDao dao;
	@Autowired
	private SaleDao sdao;
	
	@Override
	public List<WarehouseVo> getHouseList() throws Exception {
		return dao.getHouseList();
	}

	@Override
	public List<ProjectVo> getProjectList() throws Exception {
		return dao.getProjectList();
	}

	@Override
	public List<ProductVo> getProductList() throws Exception {
		return dao.getProductList();
	}

	@Override
	public List<OrderVo> getOrderList() throws Exception {
		List<OrderVo> list = dao.getOrderList();
		
		for(int i = 0; i < list.size(); i++) {
			//거래처명
			list.get(i).setCName(sdao.getCName(list.get(i).getCNo()));
			//담당자명
			list.get(i).setEmployeeName(sdao.getEmployeeName(list.get(i).getEmployeeNo()));
		}
		
		return list;
	}

}
