package com.kh.oup.client.service;

import java.util.List;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;

public interface ClientService {

	int addclient(ClientVo vo) throws Exception ;

	int getClientCnt() throws Exception;

	List<ClientVo> getClientList(PageVo vo) throws Exception;

	int getSearchClientCnt(String search) throws Exception;

	List<ClientVo> getSearchClientList(PageVo vo) throws Exception;

	int deleteClient(String client) throws Exception;

	ClientVo selectClientOne(String cNo) throws Exception;

	int changeClient(ClientVo vo) throws Exception;

	List<ClientVo> getSearchClientList(String search) throws Exception;
	
}
