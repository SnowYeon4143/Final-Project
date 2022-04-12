package com.kh.oup.order.dao;

import java.util.List;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.order.vo.OrderProductVo;
import com.kh.oup.order.vo.OrderVo;

public interface OrderDao {

	int insertOrder(OrderVo vo) throws Exception;
	
	int insertOrderProduct(OrderProductVo pVo) throws Exception;

	int selectOrderSeq()throws Exception;

	int selectOrderCnt(OrderVo vo)throws Exception;

	List<OrderVo> selectOrderList(OrderVo vo)throws Exception;

	OrderVo selectOrderOne(String orderNo) throws Exception;

	List<OrderProductVo> selectProductOrderList(String orderNo) throws Exception;

	int updateOrder(OrderVo vo)  throws Exception;

	int updateOrderProduct(OrderProductVo pVo) throws Exception;
 
}
