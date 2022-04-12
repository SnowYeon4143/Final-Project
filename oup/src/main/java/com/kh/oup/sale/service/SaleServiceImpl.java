package com.kh.oup.sale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.oup.common.PageVo;
import com.kh.oup.sale.dao.SaleDao;
import com.kh.oup.sale.vo.OrderListVo;
import com.kh.oup.sale.vo.OrderVo;
import com.kh.oup.sale.vo.SaleListVo;
import com.kh.oup.sale.vo.SaleVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class SaleServiceImpl implements SaleService{

	@Autowired
	private SaleDao dao;
	
	@Override
	public int saleEnter(SaleVo saleVo, SaleListVo saleListVo) throws Exception {
		int result = dao.saleEnter(saleVo);
		
		for(int i = 0; i < saleListVo.getVoList().size(); i++) {
			dao.saleListEnter(saleListVo.getVoList().get(i));
			dao.productCount(saleListVo.getVoList().get(i).getPNo(), saleListVo.getVoList().get(i).getSQnt());
		}

		return result;
	}

	@Override
	public long getSeq() throws Exception {
		return dao.getSaleSeq();
	}

	@Override
	public int clientAddUmony(long cNo, long sUmony) throws Exception {
		return dao.clientAddUmony(cNo, sUmony);
	}

	@Override
	public int getSaleCnt() throws Exception {
		return dao.getSaleCnt();
	}

	@Override
	public List<SaleVo> getSaleList(PageVo vo) throws Exception {
		List<SaleVo> saleVo = dao.getSaleList(vo);
		
		for(int i = 0; i < saleVo.size(); i++) {
			//거래처명
			saleVo.get(i).setCName(dao.getCName(saleVo.get(i).getCNo()));
			//담당자명
			saleVo.get(i).setEmployeeName(dao.getEmployeeName(saleVo.get(i).getEmployeeNo()));
			//품목번호
			saleVo.get(i).setProductNo(dao.getProductNo(saleVo.get(i).getSaleNo()));
			//품목명
			saleVo.get(i).setProductName(dao.getProductName(saleVo.get(i).getProductNo()));
			//품목갯수
			saleVo.get(i).setProductCnt(Integer.parseInt(dao.getProductCnt(saleVo.get(i).getSaleNo()))-1);
			//출하창고명
			saleVo.get(i).setWareHouseName(dao.getWareHouseName(saleVo.get(i).getWareHouseNo()));
		}
		
		return saleVo;
	}

	@Override
	public SaleVo getSale(int saleNo) throws Exception {
		SaleVo saleVo = dao.getSale(saleNo);
		//거래처명
		saleVo.setCName(dao.getCName(saleVo.getCNo()));
		//담당자명
		saleVo.setEmployeeName(dao.getEmployeeName(saleVo.getEmployeeNo()));
		//품목번호
		saleVo.setProductNo(dao.getProductNo(saleVo.getSaleNo()));
		//품목명
		saleVo.setProductName(dao.getProductName(saleVo.getProductNo()));
		//품목갯수
		saleVo.setProductCnt(Integer.parseInt(dao.getProductCnt(saleVo.getSaleNo()))-1);
		//출하창고명
		saleVo.setWareHouseName(dao.getWareHouseName(saleVo.getWareHouseNo()));
		//프로젝트명
		saleVo.setProjectName(dao.getProjectName(saleVo.getProjectNo()));
		return saleVo;
	}

	@Override
	public SaleListVo getSaleProductList(int saleNo) throws Exception {
		SaleListVo vo = new SaleListVo();
		vo.setSaleNo(saleNo);
		vo.setVoList(dao.getSaleProductList(saleNo));
		
		for(int i = 0; i < vo.getVoList().size(); i++) {
			//품목명
			vo.getVoList().get(i).setPName(dao.getProductName(vo.getVoList().get(i).getPNo()));
			//단가
			vo.getVoList().get(i).setPUnitPrice(dao.getProductUnitPrice(vo.getVoList().get(i).getPNo()));
			//부가세
			vo.getVoList().get(i).setBuga((long) (vo.getVoList().get(i).getSPrice() * 0.1));
			//금액 = 공급가액 + 부가세
			vo.getVoList().get(i).setResult((long) (vo.getVoList().get(i).getSPrice() + vo.getVoList().get(i).getBuga()));
		}
		
		return vo;
	}

	@Override
	public int saleUpdate(SaleVo saleVo) throws Exception {
		return dao.saleUpdate(saleVo);
	}

	@Override
	public int saleListUpdate(SaleListVo saleListVo) throws Exception {
		
		int result = 0;
		for(int i = 0; i < saleListVo.getVoList().size(); i++) {
			if(saleListVo.getVoList().get(i).getSaleListNo() != 0) {
				//saleListNo가 있다면 기존에 있던 품목
				result = dao.saleListUpdate(saleListVo.getVoList().get(i));
			}else {
				//saleListNo가 없다면 새로 추가된 품목
				dao.saleListEnter(saleListVo.getVoList().get(i));
			}
		}
		
		return result;
	}

	@Override
	public OrderVo getOrder(String orderNo) throws Exception {
		OrderVo orderVo = dao.getOrder(orderNo);
		//거래처명
		orderVo.setCName(dao.getCName(orderVo.getCNo()));
		//담당자명
		orderVo.setEmployeeName(dao.getEmployeeName(orderVo.getEmployeeNo()));
		//출하창고명
		orderVo.setWareHouseName(dao.getWareHouseName(orderVo.getWarehouseNo()));
		//프로젝트명
		orderVo.setProjectName(dao.getProjectName(orderVo.getProjectNo()));
		orderVo.setSUmoney(dao.getUmoney(orderVo.getCNo()));
		return orderVo;
	}

	@Override
	public OrderListVo getOrderProductList(String orderNo) throws Exception {
		OrderListVo vo = new OrderListVo();
		vo.setONo(orderNo);
		vo.setVoList(dao.getOrderProductList(orderNo));
		
		for(int i = 0; i < vo.getVoList().size(); i++) {
			//품목명
			vo.getVoList().get(i).setPName(dao.getProductName(vo.getVoList().get(i).getPNo()));
			//단가
			vo.getVoList().get(i).setPUnitPrice(dao.getProductUnitPrice(vo.getVoList().get(i).getPNo()));
			//부가세
			vo.getVoList().get(i).setBuga((long) (vo.getVoList().get(i).getOPrice() * 0.1));
			//금액 = 공급가액 + 부가세
			vo.getVoList().get(i).setResult((long) (vo.getVoList().get(i).getOPrice() + vo.getVoList().get(i).getBuga()));
		}
		
		return vo;
	}

}
