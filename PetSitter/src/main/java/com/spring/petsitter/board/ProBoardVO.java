package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
// 전문가 상담 게시판 VO
/*
create table PRO_BOARD(
    PRO_NUM number(6) primary key, -- 글 번호
    MEMBER_ID varchar2(30), -- 아이디
    PRO_SUBJECT varchar2(100), -- 제목
    PRO_CONTENT varchar2(4000), -- 내용
    PRO_ORG_FILE varchar2(100), -- 파일이름
    PRO_UP_FILE varchar2(100), -- 업로드된 파일이름
    PRO_READCOUNT number, -- 조회수
    PRO_DATE date default sysdate, -- 작성일
    PRO_LIKECOUNT number -- 좋아요 수
);
*/
public class ProBoardVO {
	private int PRO_NUM;
	private String MEMBER_ID;
	private String PRO_SUBJECT;
	private String PRO_CONTENT;
	private MultipartFile PRO_ORG_FILE;
	private MultipartFile PRO_UP_FILE;
	private int PRO_READCOUNT;
	private Date PRO_DATE;
	private int PRO_LIKECOUNT;
	
	public int getPRO_NUM() {
		return PRO_NUM;
	}
	public void setPRO_NUM(int PRO_NUM) {
		this.PRO_NUM = PRO_NUM;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPRO_SUBJECT() {
		return PRO_SUBJECT;
	}
	public void setPRO_SUBJECT(String PRO_SUBJECT) {
		this.PRO_SUBJECT = PRO_SUBJECT;
	}
	public String getPRO_CONTENT() {
		return PRO_CONTENT;
	}
	public void setPRO_CONTENT(String PRO_CONTENT) {
		this.PRO_CONTENT = PRO_CONTENT;
	}
	public MultipartFile getPRO_ORG_FILE() {
		return PRO_ORG_FILE;
	}
	public void setPRO_ORG_FILE(MultipartFile PRO_ORG_FILE) {
		this.PRO_ORG_FILE = PRO_ORG_FILE;
	}
	public MultipartFile getPRO_UP_FILE() {
		return PRO_UP_FILE;
	}
	public void setPRO_UP_FILE(MultipartFile pRO_UP_FILE) {
		PRO_UP_FILE = pRO_UP_FILE;
	}
	public int getPRO_READCOUNT() {
		return PRO_READCOUNT;
	}
	public void setPRO_READCOUNT(int PRO_READCOUNT) {
		this.PRO_READCOUNT = PRO_READCOUNT;
	}
	public Date getPRO_DATE() {
		return PRO_DATE;
	}
	public void setPRO_DATE(Date PRO_DATE) {
		this.PRO_DATE = PRO_DATE;
	}
	public int getPRO_LIKECOUNT() {
		return PRO_LIKECOUNT;
	}
	public void setPRO_LIKECOUNT(int pRO_LIKECOUNT) {
		PRO_LIKECOUNT = pRO_LIKECOUNT;
	}
	
}
