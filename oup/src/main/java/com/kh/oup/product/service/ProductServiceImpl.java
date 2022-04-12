package com.kh.oup.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oup.product.dao.ProductDao;
import com.kh.oup.product.vo.ProductVo;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao dao;
	
	@Override
	public int addProduct(ProductVo vo) throws Exception {
		return dao.addProduct(vo);
	}

}
