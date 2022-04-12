package com.kh.oup.sale.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.common.PageVo;
import com.kh.oup.sale.vo.OrderListVo;
import com.kh.oup.sale.vo.OrderVo;
import com.kh.oup.sale.vo.SaleListVo;
import com.kh.oup.sale.vo.SaleVo;

@Repository
public class SaleDaoImpl implements SaleDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int saleEnter(SaleVo vo) {
		return ss.insert("sale.saleEnter", vo);
	}

	@Override
	public long getSaleSeq() throws Exception {
		return ss.selectOne("sale.getSeq");
	}

	@Override
	public int saleListEnter(SaleListVo saleListVo) throws Exception {
		System.out.println("dao.saleListVo.get.pNo ::: " + saleListVo.getPNo());
		return ss.insert("sale.saleListEnter", saleListVo);
	}

	@Override
	public int clientAddUmony(long cNo, long sUmony) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("cNo", cNo);
		test.put("sUmony", sUmony);
		
		return ss.update("sale.clientAddUmony", test);
	}

	@Override
	public int getSaleCnt() throws Exception {
		return ss.selectOne("sale.getSaleCnt");
	}

	@Override
	public List<SaleVo> getSaleList(PageVo vo) throws Exception {
		return ss.selectList("sale.getSaleList", vo);
	}

	@Override
	public String getCName(long cNo) throws Exception {
		return ss.selectOne("sale.getCName", cNo);
	}

	@Override
	public String getEmployeeName(long employeeNo) throws Exception {
		return ss.selectOne("sale.getEmployeeName", employeeNo);
	}

	@Override
	public String getProductNo(long saleNo) throws Exception {
		return ss.selectOne("sale.getProductNo", saleNo);
	}

	@Override
	public String getProductName(String productNo) throws Exception {
		return ss.selectOne("sale.getProductName", productNo);
	}

	@Override
	public String getProductCnt(long saleNo) throws Exception {
		return ss.selectOne("sale.getProductCnt", saleNo);
	}

	@Override
	public String getWareHouseName(long wareHouseNo) throws Exception {
		return ss.selectOne("sale.getWareHouseName", wareHouseNo);
	}

	@Override
	public SaleVo getSale(int saleNo) throws Exception {
		return ss.selectOne("sale.getSale", saleNo);
	}

	@Override
	public String getProjectName(long projectNo) throws Exception {
		return ss.selectOne("sale.getProjectName", projectNo);
	}

	@Override
	public List<SaleListVo> getSaleProductList(int saleNo) throws Exception {
		return ss.selectList("sale.getSaleProductList", saleNo);
	}
	
	@Override
	public List<OrderListVo> getOrderProductList(String orderNo) throws Exception {
		return ss.selectList("sale.getOrderProductList", orderNo);
	}

	@Override
	public long getProductUnitPrice(String pNo) throws Exception {
		return ss.selectOne("sale.unitPrice", pNo);
	}

	@Override
	public int saleUpdate(SaleVo saleVo) throws Exception {
		return ss.update("sale.saleUpdate", saleVo);
	}

	@Override
	public int saleListUpdate(SaleListVo saleListVo) throws Exception {
		return ss.update("sale.saleListUpdate", saleListVo);
	}

	@Override
	public int productCount(String pNo, long sQnt) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("pNo", pNo);
		test.put("sQnt", sQnt);
		
		return ss.update("sale.productCount", test);
	}

	@Override
	public OrderVo getOrder(String orderNo) throws Exception {
		return ss.selectOne("sale.getOrder", orderNo);
	}

	@Override
	public long getUmoney(int cNo) throws Exception {
		return ss.selectOne("sale.getUmoney", cNo);
	}

}
