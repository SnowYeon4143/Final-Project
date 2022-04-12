package com.kh.oup.sale.dao;

import java.util.List;

import com.kh.oup.common.PageVo;
import com.kh.oup.sale.vo.OrderListVo;
import com.kh.oup.sale.vo.OrderVo;
import com.kh.oup.sale.vo.SaleListVo;
import com.kh.oup.sale.vo.SaleVo;

public interface SaleDao {

	int saleEnter(SaleVo vo) throws Exception;

	long getSaleSeq() throws Exception;

	int saleListEnter(SaleListVo vo2)  throws Exception;

	int clientAddUmony(long cNo, long sUmony) throws Exception;

	int getSaleCnt() throws Exception;

	List<SaleVo> getSaleList(PageVo vo) throws Exception;

	String getCName(long cNo) throws Exception;

	String getEmployeeName(long employeeNo) throws Exception;

	String getProductNo(long saleNo) throws Exception;

	String getProductName(String productNo) throws Exception;

	String getProductCnt(long saleNo) throws Exception;

	String getWareHouseName(long wareHouseNo) throws Exception;

	SaleVo getSale(int saleNo) throws Exception;

	String getProjectName(long projectNo) throws Exception;

	List<SaleListVo> getSaleProductList(int saleNo) throws Exception;

	long getProductUnitPrice(String pNo) throws Exception;

	int saleUpdate(SaleVo saleVo) throws Exception;

	int saleListUpdate(SaleListVo saleListVo) throws Exception;

	int productCount(String pNo, long sQnt) throws Exception;

	OrderVo getOrder(String orderNo) throws Exception;

	long getUmoney(int cNo) throws Exception;

	List<OrderListVo> getOrderProductList(String orderNo) throws Exception;

}
