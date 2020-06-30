package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
// 공지사항 게시판 VO
/*
create table NOTICE_BOARD(
    NOTICE_NUM number(10) primary key, -- 글 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    NOTICE_SUBJECT varchar2(100), -- 제목
    NOTICE_CONTENT varchar2(4000), -- 내용
    NOTICE_PHOTO varchar2(50), -- 사진
    NOTICE_READCOUNT number(6), -- 조회수
    NOTICE_DATE date default sysdate -- 작성일
);
*/
public class NoticeBoardVO {
	private int NOTICE_NUM;
	private String MEMBER_ID;
	private String NOTICE_SUBJECT;
	private String NOTICE_CONTENT;
	private MultipartFile NOTICE_PHOTO;
	private int NOTICE_READCOUNT;
	private Date NOTICE_DATE;
	
	public int getNOTICE_NUM() {
		return NOTICE_NUM;
	}
	public void setNOTICE_NUM(int nOTICE_NUM) {
		NOTICE_NUM = nOTICE_NUM;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getNOTICE_SUBJECT() {
		return NOTICE_SUBJECT;
	}
	public void setNOTICE_SUBJECT(String nOTICE_SUBJECT) {
		NOTICE_SUBJECT = nOTICE_SUBJECT;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public MultipartFile getNOTICE_PHOTO() {
		return NOTICE_PHOTO;
	}
	public void setNOTICE_PHOTO(MultipartFile nOTICE_PHOTO) {
		NOTICE_PHOTO = nOTICE_PHOTO;
	}
	public int getNOTICE_READCOUNT() {
		return NOTICE_READCOUNT;
	}
	public void setNOTICE_READCOUNT(int nOTICE_READCOUNT) {
		NOTICE_READCOUNT = nOTICE_READCOUNT;
	}
	public Date getNOTICE_DATE() {
		return NOTICE_DATE;
	}
	public void setNOTICE_DATE(Date nOTICE_DATE) {
		NOTICE_DATE = nOTICE_DATE;
	}
}
