package com.spring.petsitter.board;

import java.util.Date;

/*
CREATE TABLE petsitter_qna_board (
    petsitter_id           VARCHAR2(30),
    petsitter_nickname      VARCHAR2(30),
    member_id              VARCHAR2(30),
    member_nickname        VARCHAR2(30),
    petsitter_qna_subject  VARCHAR2(100),
    petsitter_qna_content  VARCHAR2(4000),
    petsitter_qna_date     DATE,
    petsitter_qna_bno      NUMBER
);
 * 
 */

public class PetsitterQnaBoardVO {
	private String PETSITTER_ID;
	private String PETSITTER_NICKNAME;
	private String MEMBER_ID;
	private String MEMBER_NICKNAME;
	private String PETSITTER_QNA_SUBJECT;
	private String PETSITTER_QNA_CONTENT;
	private Date PETSITTER_QNA_DATE;
	private int PETSITTER_QNA_BNO;
	
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getPETSITTER_NICKNAME() {
		return PETSITTER_NICKNAME;
	}
	public void setPETSITTER_NICKNAME(String pETSITTER_NICKNAME) {
		PETSITTER_NICKNAME = pETSITTER_NICKNAME;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}
	public void setMEMBER_NICKNAME(String mEMBER_NICKNAME) {
		MEMBER_NICKNAME = mEMBER_NICKNAME;
	}
	public String getPETSITTER_QNA_SUBJECT() {
		return PETSITTER_QNA_SUBJECT;
	}
	public void setPETSITTER_QNA_SUBJECT(String pETSITTER_QNA_SUBJECT) {
		PETSITTER_QNA_SUBJECT = pETSITTER_QNA_SUBJECT;
	}
	public String getPETSITTER_QNA_CONTENT() {
		return PETSITTER_QNA_CONTENT;
	}
	public void setPETSITTER_QNA_CONTENT(String pETSITTER_QNA_CONTENT) {
		PETSITTER_QNA_CONTENT = pETSITTER_QNA_CONTENT;
	}
	public Date getPETSITTER_QNA_DATE() {
		return PETSITTER_QNA_DATE;
	}
	public void setPETSITTER_QNA_DATE(Date pETSITTER_QNA_DATE) {
		PETSITTER_QNA_DATE = pETSITTER_QNA_DATE;
	}
	public int getPETSITTER_QNA_BNO() {
		return PETSITTER_QNA_BNO;
	}
	public void setPETSITTER_QNA_BNO(int pETSITTER_QNA_BNO) {
		PETSITTER_QNA_BNO = pETSITTER_QNA_BNO;
	}
}
