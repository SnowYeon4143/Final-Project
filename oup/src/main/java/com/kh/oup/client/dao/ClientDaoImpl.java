package com.kh.oup.client.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;

@Repository
public class ClientDaoImpl implements ClientDao{

	@Autowired
	private SqlSession session;

	@Override
	public int insertClient(ClientVo vo) throws Exception {
		return session.insert("client.insertClient", vo);
	}

	@Override
	public int selectClientCnt() throws Exception {
		return session.selectOne("client.selectClientCnt");
	}

	@Override
	public List<ClientVo> selectClientList(PageVo vo) throws Exception {
		return session.selectList("client.selectClientList", vo);
	}

	@Override
	public int selectSearchClientCnt(String search) throws Exception {
		return session.selectOne("client.selectSearchClientCnt", search);
	}

	@Override
	public List<ClientVo> selectSearchClientList(PageVo vo) throws Exception {
		return session.selectList("client.selectSearchClientList", vo);
	}

	@Override
	public int deleteClient(String[] delArr) throws Exception {
		return session.update("client.deleteClient", delArr);
	}

	@Override
	public ClientVo selectClientOne(int cNo) throws Exception {
		return session.selectOne("client.selectClientOne", cNo);
	}

	@Override
	public int updateClient(ClientVo vo) throws Exception {
		return session.update("client.updateClient", vo);
	}

	@Override
	public List<ClientVo> selectSearchClientList(String search) throws Exception {
		return session.selectList("client.searchClientList", search);
	}
	
	
}
