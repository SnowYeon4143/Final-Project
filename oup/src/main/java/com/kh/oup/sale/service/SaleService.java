package com.kh.oup.sale.service;

import java.util.List;

import com.kh.oup.common.PageVo;
import com.kh.oup.sale.vo.OrderListVo;
import com.kh.oup.sale.vo.OrderVo;
import com.kh.oup.sale.vo.SaleListVo;
import com.kh.oup.sale.vo.SaleVo;

public interface SaleService {

	int saleEnter(SaleVo vo, SaleListVo vo2) throws Exception;

	long getSeq() throws Exception;

	int clientAddUmony(long cNo, long sUmony) throws Exception;

	int getSaleCnt() throws Exception;

	List<SaleVo> getSaleList(PageVo vo) throws Exception;

	SaleVo getSale(int saleNo) throws Exception;

	SaleListVo getSaleProductList(int saleNo) throws Exception;

	int saleUpdate(SaleVo saleVo) throws Exception;

	int saleListUpdate(SaleListVo saleListVo) throws Exception;

	OrderVo getOrder(String orderNo) throws Exception;

	OrderListVo getOrderProductList(String orderNo) throws Exception;

}
