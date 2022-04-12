package com.kh.oup.order.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.order.dao.OrderDao;
import com.kh.oup.order.vo.OrderProductVo;
import com.kh.oup.order.vo.OrderVo;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao dao;

	@Override
	@Transactional(rollbackFor = Exception.class) 
	public int insertOrder(OrderVo vo, OrderProductVo pVo) throws Exception {	
		int orderNoSeq = dao.selectOrderSeq();
		vo.setONo(orderNoSeq);
		pVo.setOrderNo(orderNoSeq);
		
		vo.setODate(stringFormatToDate(vo.getODateStr()));
		vo.setCreditDate(stringFormatToDate(vo.getCreditDateStr()));
		
		int orderResult = dao.insertOrder(vo);
		orderResult += orderProductInsert(pVo);

		return orderResult;
	}
	
	private Date stringFormatToDate(String date) throws ParseException {		// string 으로 받아온 날짜포맷을 date형으로 변경
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		if(date != "")
			return transFormat.parse(date);
		return null;
	}
	
	private int orderProductInsert(OrderProductVo pVo) throws Exception {		// 배열에 들어가 있는 수만큼 insert 실행
		int pVoNo = pVo.getPNo().length;
		Date[] delDate = new Date[pVoNo];
		pVo.setODeliberyDate(delDate);
		int Insertresult = 0;
		
		for(int i=0; i< pVoNo; i++) {
			pVo.setPNoStr(pVo.getPNo()[i]);
			pVo.setPNameStr(pVo.getPName()[i]);
			pVo.setONumStr(pVo.getONum()[i]);
			pVo.setOPriceStr(pVo.getOPrice()[i]);
			pVo.setODeliberyDateStrr(stringFormatToDate(pVo.getODeliberyDateStr()[i]));
			pVo.setPIndex(i+1);
			Insertresult += dao.insertOrderProduct(pVo);
		}
		return Insertresult;
	}

	@Override
	public int getSearchOrderCnt(OrderVo vo) throws Exception {
		vo.setODate(stringFormatToDate(vo.getODateStr()));
		return dao.selectOrderCnt(vo);
	}

	@Override
	public List<OrderVo> getSearchOrderList(PageVo paVo, OrderVo vo) throws Exception {
		vo.setStartRow(paVo.getStartRow());
		vo.setEndRow(paVo.getEndRow());

		vo.setODate(stringFormatToDate(vo.getODateStr()));
		return dao.selectOrderList(vo);
	}

	@Override
	public OrderVo selectOrder(String orderNo) throws Exception {
		return dao.selectOrderOne(orderNo);
	}

	@Override
	public List<OrderProductVo> selectProductOrder(String orderNo) throws Exception {
		return dao.selectProductOrderList(orderNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class) 
	public int changeOrder(OrderVo vo, OrderProductVo pVo) throws Exception {		
		vo.setODate(stringFormatToDate(vo.getODateStr()));
		vo.setCreditDate(stringFormatToDate(vo.getCreditDateStr()));
		pVo.setOrderNo(vo.getONo());
		
		int pVoNo = pVo.getPNo().length;
		Date[] delDate = new Date[pVoNo];
		pVo.setODeliberyDate(delDate);
		int updateResult = 0;
		updateResult += dao.updateOrder(vo);
		
		for(int i=0; i< pVoNo; i++) {
			pVo.setOrderListNo(pVo.getOrderList()[i]);
			pVo.setPNoStr(pVo.getPNo()[i]);
			pVo.setONumStr(pVo.getONum()[i]);
			pVo.setOPriceStr(pVo.getOPrice()[i]);
			pVo.setODeliberyDateStrr(stringFormatToDate(pVo.getODeliberyDateStr()[i]));
			updateResult += dao.updateOrderProduct(pVo);
		}
		return updateResult;
		
	}


}
