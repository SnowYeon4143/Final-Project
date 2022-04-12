package com.kh.oup.approval.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ApprovalVo {
	private int aNo; //결재번호
	private int arNo; //규정번호
	private String dcCode; //문서종류코드
	private int aDocNo; //문서번호
	private String aTitle; //제목
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date aDate; //작성일
	private String aPicName; //신청자명
	private char aTeamNy; //팀장승인여부
	private char aDecNy; //전결권자승인여부
	private char aAllDecNy; //결정권자승인여부
	private Date aeDate1; //팀장결재일자
	private Date aeDate2; //전결권자결재일자
	private Date aeDate3; //결정권자결재일자
	private Date aeDate4; //최종결재일자
	private char aStateMent; //결재상태
	
	private MultipartFile attachment; //첨부파일
	private String changeName; //서버이름
	private String originName; //원본이름
	
}
