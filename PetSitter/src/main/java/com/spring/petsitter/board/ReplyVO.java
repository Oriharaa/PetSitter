package com.spring.petsitter.board;

import java.util.Date;

/*
create table reply (
	reply_num number not null,
    reply_board_type varchar2(20),
    reply_board_num number,
    reply_content varchar2(500),
    reply_date DATE,
    reply_writer varchar2(20)
);
*/
public class ReplyVO {
	private int REPLY_NUM;
	private String REPLY_BOARD_TYPE;
	private int REPLY_BOARD_NUM;
	private String REPLY_CONTENT;
	private Date REPLY_DATE;
	private String REPLY_WRITER;
	
	public int getREPLY_NUM() {
		return REPLY_NUM;
	}
	public void setREPLY_NUM(int rEPLY_NUM) {
		REPLY_NUM = rEPLY_NUM;
	}
	public String getREPLY_BOARD_TYPE() {
		return REPLY_BOARD_TYPE;
	}
	public void setREPLY_BOARD_TYPE(String rEPLY_BOARD_TYPE) {
		REPLY_BOARD_TYPE = rEPLY_BOARD_TYPE;
	}
	public int getREPLY_BOARD_NUM() {
		return REPLY_BOARD_NUM;
	}
	public void setREPLY_BOARD_NUM(int rEPLY_BOARD_NUM) {
		REPLY_BOARD_NUM = rEPLY_BOARD_NUM;
	}
	public String getREPLY_CONTENT() {
		return REPLY_CONTENT;
	}
	public void setREPLY_CONTENT(String rEPLY_CONTENT) {
		REPLY_CONTENT = rEPLY_CONTENT;
	}
	public Date getREPLY_DATE() {
		return REPLY_DATE;
	}
	public void setREPLY_DATE(Date rEPLY_DATE) {
		REPLY_DATE = rEPLY_DATE;
	}
	public String getREPLY_WRITER() {
		return REPLY_WRITER;
	}
	public void setREPLY_WRITER(String rEPLY_WRITER) {
		REPLY_WRITER = rEPLY_WRITER;
	}

	
}
