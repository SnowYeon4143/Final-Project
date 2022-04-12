package com.kh.oup.client.dao;

import java.util.List;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;

public interface ClientDao {

	int insertClient(ClientVo vo) throws Exception;

	int selectClientCnt() throws Exception;

	List<ClientVo> selectClientList(PageVo vo) throws Exception;

	int selectSearchClientCnt(String search) throws Exception;

	List<ClientVo> selectSearchClientList(PageVo vo) throws Exception;

	int deleteClient(String[] delArr) throws Exception;

	ClientVo selectClientOne(int cNo) throws Exception;

	int updateClient(ClientVo vo) throws Exception;

	List<ClientVo> selectSearchClientList(String search) throws Exception;

}
