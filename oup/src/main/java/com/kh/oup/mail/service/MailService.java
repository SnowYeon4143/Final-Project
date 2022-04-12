package com.kh.oup.mail.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.oup.client.vo.ClientVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.mail.vo.MailVo;

public interface MailService {

	int send(MailVo vo, HttpServletRequest req, String recipientId, String senderId) throws Exception;

	int getReMailCnt(long receiverNo) throws Exception;

	List<MailVo> getReMailList(PageVo vo, long loginNo) throws Exception;

	int getSeMailCnt(long loginNo)  throws Exception;

	List<MailVo> getSeMailList(PageVo vo, long loginNo) throws Exception;

	int deleteSendMail(String str) throws Exception;

	int deleteReceiveMail(String str) throws Exception;

	int getTrashMailCnt(long loginNo) throws Exception;

	List<MailVo> getTrashMailList(PageVo vo, long loginNo) throws Exception;

	MailVo getMail(String mailno) throws Exception;

	int deleteMail(String mailno) throws Exception;

	int mailRead(String mailno) throws Exception;

}
