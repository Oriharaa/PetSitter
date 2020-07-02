package com.spring.petsitter;

import org.springframework.web.multipart.MultipartFile;

/*
create table member(
    MEMBER_ID varchar2(30) primary key, --ID
    MEMBER_NICKNAME varchar2(30) DEFAULT 'N', --닉네임
    MEMBER_PW varchar2(30), --PW
    MEMBER_NAME varchar2(20), --이름
    MEMBER_TEL varchar2(20), --전화번호
    MEMBER_RANK varchar2(30) DEFAULT 'NOMAL', --등급
    MEMBER_COUNT number DEFAULT 0, --활동횟수
    MEMBER_AMOUNT number DEFAULT 0, --총 금액
    MEMBER_DATE date default sysdate, --가입날짜
    MEMBER_PHOTO varchar2(100) DEFAULT 'N', --프로필사진
    MEMBER_REPORT number DEFAULT 0, --신고누적횟수
    MEMBER_ADDRESS varchar2(100), -- 주소
    MEMBER_GENDER varchar2(4) -- 성별
);
*/

public class MemberVO {
	private String MEMBER_ID;
	private String MEMBER_NICKNAME;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	private String MEMBER_TEL;
	private String MEMBER_RANK;
	private int MEMBER_COUNT;
	private int MEMBER_AMOUNT;
	private String MEMBER_DATE;
	private MultipartFile MEMBER_PHOTO_FILE;
	private String MEMBER_PHOTO;
	private int MEMBER_REPORT;
	private String MEMBER_ADDRESS;
	private String MEMBER_GENDER;
	
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
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getMEMBER_TEL() {
		return MEMBER_TEL;
	}
	public void setMEMBER_TEL(String mEMBER_TEL) {
		MEMBER_TEL = mEMBER_TEL;
	}
	public String getMEMBER_RANK() {
		return MEMBER_RANK;
	}
	public void setMEMBER_RANK(String mEMBER_RANK) {
		MEMBER_RANK = mEMBER_RANK;
	}
	public int getMEMBER_COUNT() {
		return MEMBER_COUNT;
	}
	public void setMEMBER_COUNT(int mEMBER_COUNT) {
		MEMBER_COUNT = mEMBER_COUNT;
	}
	public int getMEMBER_AMOUNT() {
		return MEMBER_AMOUNT;
	}
	public void setMEMBER_AMOUNT(int mEMBER_AMOUNT) {
		MEMBER_AMOUNT = mEMBER_AMOUNT;
	}
	public String getMEMBER_DATE() {
		return MEMBER_DATE;
	}
	public void setMEMBER_DATE(String mEMBER_DATE) {
		MEMBER_DATE = mEMBER_DATE;
	}
	public MultipartFile getMEMBER_PHOTO_FILE() {
		return MEMBER_PHOTO_FILE;
	}
	public void setMEMBER_PHOTO_FILE(MultipartFile mEMBER_PHOTO_FILE) {
		MEMBER_PHOTO_FILE = mEMBER_PHOTO_FILE;
	}
	public String getMEMBER_PHOTO() {
		return MEMBER_PHOTO;
	}
	public void setMEMBER_PHOTO(String mEMBER_PHOTO) {
		MEMBER_PHOTO = mEMBER_PHOTO;
	}
	public int getMEMBER_REPORT() {
		return MEMBER_REPORT;
	}
	public void setMEMBER_REPORT(int mEMBER_REPORT) {
		MEMBER_REPORT = mEMBER_REPORT;
	}
	public String getMEMBER_ADDRESS() {
		return MEMBER_ADDRESS;
	}
	public void setMEMBER_ADDRESS(String mEMBER_ADDRESS) {
		MEMBER_ADDRESS = mEMBER_ADDRESS;
	}
	public String getMEMBER_GENDER() {
		return MEMBER_GENDER;
	}
	public void setMEMBER_GENDER(String mEMBER_GENDER) {
		MEMBER_GENDER = mEMBER_GENDER;
	}
	
}
