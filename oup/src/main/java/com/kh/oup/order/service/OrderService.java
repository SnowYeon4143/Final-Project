package com.kh.oup.order.service;

import java.util.List;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.order.vo.OrderProductVo;
import com.kh.oup.order.vo.OrderVo;

public interface OrderService {
	
	int insertOrder(OrderVo vo, OrderProductVo pVo) throws Exception;

	int getSearchOrderCnt(OrderVo vo) throws Exception;

	List<OrderVo> getSearchOrderList(PageVo paVo, OrderVo vo) throws Exception;

	OrderVo selectOrder(String orderNo) throws Exception;

	List<OrderProductVo> selectProductOrder(String orderNo) throws Exception;

	int changeOrder(OrderVo vo, OrderProductVo pVo) throws Exception;
	
}
