package com.kh.oup.mail.service;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oup.common.PageVo;
import com.kh.oup.mail.dao.MailDao;
import com.kh.oup.mail.vo.MailVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailServiceImpl implements MailService{

	@Autowired
	private MailDao dao;
	
	@Override
	public int send(MailVo vo, HttpServletRequest req, String rId, String sId) throws Exception {
		
		Random random = new Random();
		int result = 0;
		
		//테스트
//		for(int i = 0; i < 20; i++) {
			//硫붿씪踰덊샇 nextval
			int no = dao.getMailSeq();
			
			int recipientNo = dao.getrecipientNo(rId);
			int senderNo = dao.getsenderNo(sId);
			
			vo.setRecipient(recipientNo);
			vo.setSender(senderNo);
			
			//insert 泥섎━
			vo.setMailNo(no);
			
			result = dao.insertMail(vo);
			
			List<MultipartFile> fArr = vo.getAttachment();
			
			if(fArr.get(0).getOriginalFilename() != "") {
				String path = req.getServletContext().getRealPath("/resources/dist/img/mail/");
				
				int index = 0;
				for(MultipartFile mf : fArr) {
					String changeName = System.currentTimeMillis() + "_" + random.nextInt() + "_" + mf.getOriginalFilename();
					index++;
					
					if(index == 1) {
						vo.setChangeName1(changeName);
						vo.setOriginName1(fArr.get(0).getOriginalFilename());
					} else if(index == 2) {
						vo.setChangeName2(changeName);
						vo.setOriginName2(fArr.get(1).getOriginalFilename());
					} else if(index == 3) {
						vo.setChangeName3(changeName);
						vo.setOriginName3(fArr.get(2).getOriginalFilename());
					}
					
					File file = new File(path + changeName);
					mf.transferTo(file);
				}
				
				int result2 = dao.insertMailFile(vo);
			}
//		}
		
		
		return result;
	}

	@Override
	public int getReMailCnt(long loginNo) throws Exception {
		return dao.selectReMailCnt(loginNo);
	}

	@Override
	public List<MailVo> getReMailList(PageVo vo, long loginNo) throws Exception {
		List<MailVo> receiveMailList = dao.selectReceiveMailList(vo, loginNo);
		
		for(int i = 0; i < receiveMailList.size(); i++) {
			receiveMailList.get(i).setSenderStr(dao.getSenderStr(receiveMailList.get(i).getSender()));
			receiveMailList.get(i).setSenderId(dao.getSenderId(receiveMailList.get(i).getSender()));
		}
		
		return receiveMailList;
	}
	
	@Override
	public List<MailVo> getSeMailList(PageVo vo, long loginNo) throws Exception {
		List<MailVo> sendMailList = dao.selectSendMailList(vo, loginNo);
		
		for(int i = 0; i < sendMailList.size(); i++) {
			sendMailList.get(i).setSenderStr(dao.getSenderStr(sendMailList.get(i).getSender()));
			sendMailList.get(i).setSenderId(dao.getSenderId(sendMailList.get(i).getSender()));
		}
		
		return sendMailList;
	}

	@Override
	public int getSeMailCnt(long loginNo) throws Exception {
		return dao.selectSeMailCnt(loginNo);
	}

	@Override
	public int deleteSendMail(String str) throws Exception {
		String[] delArr = str.split(",");
		return dao.deleteSendMail(delArr);
	}

	@Override
	public int deleteReceiveMail(String str) throws Exception {
		String[] delArr = str.split(",");
		return dao.deleteReceiveMail(delArr);
	}

	@Override
	public int getTrashMailCnt(long loginNo) throws Exception {
		return dao.selectTrashMailCnt(loginNo);
	}

	@Override
	public List<MailVo> getTrashMailList(PageVo vo, long loginNo) throws Exception {
		List<MailVo> trashMailList = dao.selectTrashMailList(vo, loginNo);
		for(int i = 0; i < trashMailList.size(); i++) {
			trashMailList.get(i).setSenderStr(dao.getSenderStr(trashMailList.get(i).getSender()));
			trashMailList.get(i).setSenderId(dao.getSenderId(trashMailList.get(i).getSender()));
		}
		
		return trashMailList;
	}

	@Override
	public MailVo getMail(String mailno) throws Exception {
		//1 = 첨부파일 있음, 0 = 첨부파일 없음
		String fileYN = dao.checkFile(mailno);
		MailVo mail = dao.selectMail(mailno, fileYN);
		log.info("mail 하나만 가지고 왓을 때 " + mail);
		mail.setSenderStr(dao.getSenderStr(mail.getSender()));
		mail.setSenderId(dao.getSenderId(mail.getSender()));
		return mail;
	}

	@Override
	public int deleteMail(String mailno) throws Exception {
		return dao.deleteMail(mailno);
	}

	@Override
	public int mailRead(String mailno) throws Exception {
		return dao.mailRead(mailno);
	}

}
