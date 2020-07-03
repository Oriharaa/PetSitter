package com.spring.petsitter.board;

import java.util.Date;

/*
create table COMMUNICATION_BOARD(
	BOARD_NUM number(10) PRIMARY KEY, -- 회원 게시판 글 번호
	BOARD_WRITER varchar2(30), -- 작성자(일반 회원 닉네임 or 펫시터 닉네임)
	MEMBER_ID varchar2(30), -- 일반 회원 아이디
	PETSITTER_ID varchar2(30), -- 펫시터 회원 아이디
	BOARD_SUBJECT varchar2(100), -- 제목
	BOARD_CONTENT varchar2(4000), -- 내용
	BOARD_READCOUNT number, -- 조회수
	BOARD_DATE date default sysdate -- 작성일
);
*/
public class CommunicationBoardVO {
	private int BOARD_NUM;
	private String BOARD_WRITER;
	private String MEMBER_ID;
	private String PETSITTER_ID;
	private String BOARD_SUBJECT;
	private String BOARD_CONTENT;
	private String BOARD_READCOUNT;
	private Date BOARD_DATE;
	private String BOARD_REALDATE;
	
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public String getBOARD_WRITER() {
		return BOARD_WRITER;
	}
	public void setBOARD_WRITER(String bOARD_WRITER) {
		BOARD_WRITER = bOARD_WRITER;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getBOARD_SUBJECT() {
		return BOARD_SUBJECT;
	}
	public void setBOARD_SUBJECT(String bOARD_SUBJECT) {
		BOARD_SUBJECT = bOARD_SUBJECT;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public String getBOARD_READCOUNT() {
		return BOARD_READCOUNT;
	}
	public void setBOARD_READCOUNT(String bOARD_READCOUNT) {
		BOARD_READCOUNT = bOARD_READCOUNT;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	public String getBOARD_REALDATE() {
		return BOARD_REALDATE;
	}
	public void setBOARD_REALDATE(String bOARD_REALDATE) {
		BOARD_REALDATE = bOARD_REALDATE;
	}
}
