package com.kh.oup.product.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.product.vo.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int addProduct(ProductVo vo) throws Exception {
		return ss.insert("product.addProduct", vo);
	}
}
