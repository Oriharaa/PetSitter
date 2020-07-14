package com.spring.petsitter.board.mboard;

import java.util.Date;

public class MReplyVO {
	/*

  CREATE TABLE "MREPLY" 
   (	"BNO" NUMBER, 
	"RNO" NUMBER, 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"WRITER_ID" VARCHAR2(30 BYTE), 
	"REGDATE" DATE DEFAULT sysdate, 
	"WRITER_NAME" VARCHAR2(30 BYTE)
   ) 
	 */
	
	private int bno;
	private int rno;
	private String content;
	private String writer_id;
	private String writer_name;
	private Date regDate;

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

}
