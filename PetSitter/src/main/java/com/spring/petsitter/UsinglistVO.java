package com.spring.petsitter;

import java.util.Date;

/*
create table USINGLIST(
    LIST_NUM number(10) primary key,
    PETSITTER_ID varchar2(30),
    MEMBER_ID varchar2(30),
    LIST_PRICE number(8),
    LIST_START_DATE date,
    LIST_END_DATE date,
    LIST_TYPE varchar2(10)
);
*/
public class UsinglistVO {
	private int LIST_NUM;
	private String PETSITTER_ID;
	private String PETSITTER_ADDR;
	private String MEMBER_ID;
	private int LIST_PRICE;
	private Date LIST_START_DATE;
	private Date LIST_END_DATE;
	private int LIST_SCORE;
	private String LIST_TYPE;
	
	public int getLIST_NUM() {
		return LIST_NUM;
	}
	public void setLIST_NUM(int lIST_NUM) {
		LIST_NUM = lIST_NUM;
	}
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public String getPETSITTER_ADDR() {
		return PETSITTER_ADDR;
	}
	public void setPETSITTER_ADDR(String pETSITTER_ADDR) {
		PETSITTER_ADDR = pETSITTER_ADDR;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getLIST_PRICE() {
		return LIST_PRICE;
	}
	public void setLIST_PRICE(int lIST_PRICE) {
		LIST_PRICE = lIST_PRICE;
	}
	public Date getLIST_START_DATE() {
		return LIST_START_DATE;
	}
	public void setLIST_START_DATE(Date lIST_START_DATE) {
		LIST_START_DATE = lIST_START_DATE;
	}
	public Date getLIST_END_DATE() {
		return LIST_END_DATE;
	}
	public void setLIST_END_DATE(Date lIST_END_DATE) {
		LIST_END_DATE = lIST_END_DATE;
	}
	public int getLIST_SCORE() {
		return LIST_SCORE;
	}
	public void setLIST_SCORE(int lIST_SCORE) {
		LIST_SCORE = lIST_SCORE;
	}
	public String getLIST_TYPE() {
		return LIST_TYPE;
	}
	public void setLIST_TYPE(String lIST_TYPE) {
		LIST_TYPE = lIST_TYPE;
	}
}
