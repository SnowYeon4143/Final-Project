package com.kh.oup.mail.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oup.common.PageVo;
import com.kh.oup.mail.vo.MailVo;

@Repository
public class MailDaoImpl implements MailDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int getMailSeq() throws Exception {
		return ss.selectOne("mail.getSeq");
	}

	@Override
	public int insertMail(MailVo vo) throws Exception {
		return ss.insert("mail.insertMail", vo);
	}

	@Override
	public int getrecipientNo(String rId) throws Exception {
		return ss.selectOne("mail.getRecipientNo",rId);
	}

	@Override
	public int getsenderNo(String sId) throws Exception {
		return ss.selectOne("mail.getSenderNo",sId);
	}

	@Override
	public int insertMailFile(MailVo vo) throws Exception {
		return ss.insert("mail.insertMailFile", vo);
	}

	@Override
	public int selectReMailCnt(long receiverNo) throws Exception {
		return ss.selectOne("mail.selectReMailCnt", receiverNo);
	}

	@Override
	public List<MailVo> selectReceiveMailList(PageVo vo, long receiverNo) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("page", vo);
		test.put("receiverNo", receiverNo);
		
		return ss.selectList("mail.selectReceiveMailList", test);
	}

	@Override
	public String getSenderStr(long sender) throws Exception {
		return ss.selectOne("mail.getSenderStr", sender);
	}

	@Override
	public String getSenderId(long sender) throws Exception {
		return ss.selectOne("mail.getSenderId", sender);
	}

	@Override
	public int selectSeMailCnt(long senderNo) throws Exception {
		return ss.selectOne("mail.selectSeMailCnt", senderNo);
	}

	@Override
	public List<MailVo> selectSendMailList(PageVo vo, long senderNo) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("page", vo);
		test.put("senderNo", senderNo);
		
		return ss.selectList("mail.selectSendMailList", test);
	}

	@Override
	public int deleteSendMail(String[] delArr) throws Exception {
		return ss.update("mail.deletSendMail", delArr);
	}

	@Override
	public int deleteReceiveMail(String[] delArr) throws Exception {
		return ss.update("mail.deletReceiveMail", delArr);
	}

	@Override
	public int selectTrashMailCnt(long loginNo) throws Exception {
		return ss.selectOne("mail.selectTrashMailCnt", loginNo);
	}

	@Override
	public List<MailVo> selectTrashMailList(PageVo vo, long loginNo) throws Exception {
		//맵 만들기
		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("page", vo);
		test.put("loginNo", loginNo);
		
		return ss.selectList("mail.selectTrashMailList", test);
	}

	@Override
	public MailVo selectMail(String mailno, String fileYN) throws Exception {
		HashMap<String, String> emp = new HashMap<String, String>();
		emp.put("mailNo", mailno);
		emp.put("fileYN", fileYN);
		return ss.selectOne("mail.selectMail", emp);
	}

	@Override
	public int deleteMail(String mailno) throws Exception {
		return ss.update("mail.deleteMail", mailno);
	}

	@Override
	public String checkFile(String mailno) throws Exception {
		return ss.selectOne("mail.checkFile", mailno);
	}

	@Override
	public int mailRead(String mailno) throws Exception {
		return ss.update("mail.mailRead", mailno);
	}

}
