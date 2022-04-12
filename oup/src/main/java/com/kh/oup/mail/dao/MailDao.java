package com.kh.oup.mail.dao;

import java.util.List;

import com.kh.oup.common.PageVo;
import com.kh.oup.mail.vo.MailVo;

public interface MailDao {

	int getMailSeq() throws Exception;

	int insertMail(MailVo vo) throws Exception;

	int getrecipientNo(String rId) throws Exception;

	int getsenderNo(String sId) throws Exception;

	int insertMailFile(MailVo vo) throws Exception;

	int selectReMailCnt(long receiverNo) throws Exception;

	List<MailVo> selectReceiveMailList(PageVo vo, long receiverNo) throws Exception;

	String getSenderStr(long sender) throws Exception;

	String getSenderId(long sender) throws Exception;

	int selectSeMailCnt(long loginNo) throws Exception;

	List<MailVo> selectSendMailList(PageVo vo, long loginNo) throws Exception;

	int deleteSendMail(String[] delArr) throws Exception;

	int deleteReceiveMail(String[] delArr) throws Exception;

	int selectTrashMailCnt(long loginNo) throws Exception;

	List<MailVo> selectTrashMailList(PageVo vo, long loginNo) throws Exception;

	MailVo selectMail(String mailno, String fileYN) throws Exception;

	int deleteMail(String mailno) throws Exception;

	String checkFile(String mailno) throws Exception;

	int mailRead(String mailno) throws Exception;

}
