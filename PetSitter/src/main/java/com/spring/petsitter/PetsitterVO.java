package com.spring.petsitter;

import org.springframework.web.multipart.MultipartFile;

/*
create table PETSITTER(
    PETSITTER_ID varchar2(30) primary key, --ID
    PETSITTER_NICKNAME varchar2(30) DEFAULT 'N', --닉네임
    PETSITTER_NAME varchar2(20), --이름
    PETSITTER_PW varchar2(30), --PW
    PETSITTER_TEL varchar2(20), --전화번호
    PETSITTER_EMAIL varchar2(30), --이메일
    PETSITTER_SCORE number(2,2) DEFAULT 0, --평점
    PETSITTER_COUNT number(5) DEFAULT 0, --활동횟수
    PETSITTER_RANK varchar2(20) DEFAULT 'N', --등급
    PETSITTER_ADDRESS varchar2(100), --주소
    PETSITTER_INTRODUCE varchar2(2000), --자기소개
    PETSITTER_PRICE_12H varchar2(10), --12시간가격
    PETSITTER_PRICE_24H varchar2(10), --24시간가격
    PETSITTER_PRICE_30M varchar2(10), --30분가격
    PETSITTER_PRICE_60M varchar2(10), --60분가격
    PETSITTER_SERVICE_LIST varchar2(30), --가능한 서비스
    PETSITTER_PHOTO_UPFILE varchar2(100), --증명 사진
    PETSITTER_PHOTO_PROFILE_FILE varchar2(100), --프로필 사진
    PETSITTER_CERT_LIST varchar2(100), --자격증이름
    PETSITTER_PHOTO_CERT_FILE varchar2(300), --자격증 사진
    PETSITTER_PHOTO_HOME_FILE varchar2(300), --집 사진
    PETSITTER_DATE date DEFAULT sysdate, --가입 날짜
    PETSITTER_TYPE varchar2(20), -- 케어종류
    PETSITTER_REPORT number(2) default 0, --신고누적횟수
    PETSITTER_GENDER varchar2(4) -- 성별
    PETSITTER_REVIEWCOUNT number(5) DEFAULT 0, --리뷰 개수
);
*/

public class PetsitterVO {
	private String PETSITTER_ID;
	private String PETSITTER_NICKNAME;
	private String PETSITTER_NAME;
	private String PETSITTER_PW;
	private String PETSITTER_TEL;
	private String PETSITTER_EMAIL;
	private double PETSITTER_SCORE;
	private int PETSITTER_COUNT;
	private String PETSITTER_RANK;
	private String PETSITTER_ADDRESS;
	private String PETSITTER_INTRODUCE;
	private String PETSITTER_PRICE_12H;
	private String PETSITTER_PRICE_24H;
	private String PETSITTER_PRICE_30M;
	private String PETSITTER_PRICE_60M;
	private String[] PETSITTER_SERVICE;
	private String PETSITTER_SERVICE_LIST;
	private MultipartFile PETSITTER_PHOTO;
	private String PETSITTER_PHOTO_UPFILE;
	private MultipartFile PETSITTER_PHOTO_PROFILE;
	private String PETSITTER_PHOTO_PROFILE_FILE;
	private MultipartFile[] PETSITTER_PHOTO_HOME;
	private String PETSITTER_PHOTO_HOME_FILE;
	private String[] PETSITTER_CERT;
	private String PETSITTER_CERT_LIST;
	private MultipartFile[] PETSITTER_PHOTO_CERT;	
	private String PETSITTER_PHOTO_CERT_FILE;
	private String PETSITTER_DATE;
	private String[] PETSITTER_TYPE_LIST;
	private String PETSITTER_TYPE;
	private int PETSITTER_REPORT;
	private String PETSITTER_GENDER;
	private int PETSITTER_REVIEWCOUNT;
	

	public String getPETSITTER_NAME() {
		return PETSITTER_NAME;
	}
	public void setPETSITTER_NAME(String pETSITTER_NAME) {
		PETSITTER_NAME = pETSITTER_NAME;
	}
	public String[] getPETSITTER_TYPE_LIST() {
		return PETSITTER_TYPE_LIST;
	}
	public void setPETSITTER_TYPE_LIST(String[] pETSITTER_TYPE_LIST) {
		PETSITTER_TYPE_LIST = pETSITTER_TYPE_LIST;
	}
	public String getPETSITTER_CERT_LIST() {
		return PETSITTER_CERT_LIST;
	}
	public void setPETSITTER_CERT_LIST(String pETSITTER_CERT_LIST) {
		PETSITTER_CERT_LIST = pETSITTER_CERT_LIST;
	}
	public String getPETSITTER_SERVICE_LIST() {
		return PETSITTER_SERVICE_LIST;
	}
	public void setPETSITTER_SERVICE_LIST(String pETSITTER_SERVICE_LIST) {
		PETSITTER_SERVICE_LIST = pETSITTER_SERVICE_LIST;
	}
	public String getPETSITTER_PHOTO_HOME_FILE() {
		return PETSITTER_PHOTO_HOME_FILE;
	}
	public void setPETSITTER_PHOTO_HOME_FILE(String pETSITTER_PHOTO_HOME_FILE) {
		PETSITTER_PHOTO_HOME_FILE = pETSITTER_PHOTO_HOME_FILE;
	}
	public String getPETSITTER_PHOTO_CERT_FILE() {
		return PETSITTER_PHOTO_CERT_FILE;
	}
	public void setPETSITTER_PHOTO_CERT_FILE(String pETSITTER_PHOTO_CERT_FILE) {
		PETSITTER_PHOTO_CERT_FILE = pETSITTER_PHOTO_CERT_FILE;
	}
	public String[] getPETSITTER_SERVICE() {
		return PETSITTER_SERVICE;
	}
	public void setPETSITTER_SERVICE(String[] pETSITTER_SERVICE) {
		PETSITTER_SERVICE = pETSITTER_SERVICE;
	}
	public String getPETSITTER_PHOTO_UPFILE() {
		return PETSITTER_PHOTO_UPFILE;
	}
	public void setPETSITTER_PHOTO_UPFILE(String pETSITTER_PHOTO_UPFILE) {
		PETSITTER_PHOTO_UPFILE = pETSITTER_PHOTO_UPFILE;
	}
	public String getPETSITTER_PHOTO_PROFILE_FILE() {
		return PETSITTER_PHOTO_PROFILE_FILE;
	}
	public void setPETSITTER_PHOTO_PROFILE_FILE(String pETSITTER_PHOTO_PROFILE_UPFILE) {
		PETSITTER_PHOTO_PROFILE_FILE = pETSITTER_PHOTO_PROFILE_UPFILE;
	}
	public MultipartFile getPETSITTER_PHOTO() {
		return PETSITTER_PHOTO;
	}
	public void setPETSITTER_PHOTO(MultipartFile pETSITTER_PHOTO) {
		PETSITTER_PHOTO = pETSITTER_PHOTO;
	}
	public MultipartFile getPETSITTER_PHOTO_PROFILE() {
		return PETSITTER_PHOTO_PROFILE;
	}
	public void setPETSITTER_PHOTO_PROFILE(MultipartFile pETSITTER_PHOTO_PROFILE) {
		PETSITTER_PHOTO_PROFILE = pETSITTER_PHOTO_PROFILE;
	}
	public MultipartFile[] getPETSITTER_PHOTO_HOME() {
		return PETSITTER_PHOTO_HOME;
	}
	public void setPETSITTER_PHOTO_HOME(MultipartFile[] pETSITTER_PHOTO_HOME) {
		PETSITTER_PHOTO_HOME = pETSITTER_PHOTO_HOME;
	}
	public String[] getPETSITTER_CERT() {
		return PETSITTER_CERT;
	}
	public void setPETSITTER_CERT(String[] pETSITTER_CERT) {
		PETSITTER_CERT = pETSITTER_CERT;
	}
	public MultipartFile[] getPETSITTER_PHOTO_CERT() {
		return PETSITTER_PHOTO_CERT;
	}
	public void setPETSITTER_PHOTO_CERT(MultipartFile[] pETSITTER_PHOTO_CERT) {
		PETSITTER_PHOTO_CERT = pETSITTER_PHOTO_CERT;
	}
	public String getPETSITTER_PRICE_12H() {
		return PETSITTER_PRICE_12H;
	}
	public void setPETSITTER_PRICE_12H(String pETSITTER_PRICE_12H) {
		PETSITTER_PRICE_12H = pETSITTER_PRICE_12H;
	}
	public String getPETSITTER_PRICE_24H() {
		return PETSITTER_PRICE_24H;
	}
	public void setPETSITTER_PRICE_24H(String pETSITTER_PRICE_24H) {
		PETSITTER_PRICE_24H = pETSITTER_PRICE_24H;
	}
	public String getPETSITTER_PRICE_30M() {
		return PETSITTER_PRICE_30M;
	}
	public void setPETSITTER_PRICE_30M(String pETSITTER_PRICE_30M) {
		PETSITTER_PRICE_30M = pETSITTER_PRICE_30M;
	}
	public String getPETSITTER_PRICE_60M() {
		return PETSITTER_PRICE_60M;
	}
	public void setPETSITTER_PRICE_60M(String pETSITTER_PRICE_60M) {
		PETSITTER_PRICE_60M = pETSITTER_PRICE_60M;
	}
	public String getPETSITTER_NICKNAME() {
		return PETSITTER_NICKNAME;
	}
	public void setPETSITTER_NICKNAME(String pETSITTER_NICKNAME) {
		PETSITTER_NICKNAME = pETSITTER_NICKNAME;
	}
	public double getPETSITTER_SCORE() {
		return PETSITTER_SCORE;
	}
	public void setPETSITTER_SCORE(double pETSITTER_SCORE) {
		PETSITTER_SCORE = pETSITTER_SCORE;
	}
	public int getPETSITTER_COUNT() {
		return PETSITTER_COUNT;
	}
	public void setPETSITTER_COUNT(int pETSITTER_COUNT) {
		PETSITTER_COUNT = pETSITTER_COUNT;
	}
	public String getPETSITTER_RANK() {
		return PETSITTER_RANK;
	}
	public void setPETSITTER_RANK(String pETSITTER_RANK) {
		PETSITTER_RANK = pETSITTER_RANK;
	}
	public String getPETSITTER_DATE() {
		return PETSITTER_DATE;
	}
	public void setPETSITTER_DATE(String pETSITTER_DATE) {
		PETSITTER_DATE = pETSITTER_DATE;
	}
	public String getPETSITTER_TYPE() {
		return PETSITTER_TYPE;
	}
	public void setPETSITTER_TYPE(String pETSITTER_TYPE) {
		PETSITTER_TYPE = pETSITTER_TYPE;
	}
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getPETSITTER_PW() {
		return PETSITTER_PW;
	}
	public void setPETSITTER_PW(String pETSITTER_PW) {
		PETSITTER_PW = pETSITTER_PW;
	}
	public String getPETSITTER_TEL() {
		return PETSITTER_TEL;
	}
	public void setPETSITTER_TEL(String pETSITTER_TEL) {
		PETSITTER_TEL = pETSITTER_TEL;
	}
	public String getPETSITTER_EMAIL() {
		return PETSITTER_EMAIL;
	}
	public void setPETSITTER_EMAIL(String pETSITTER_EMAIL) {
		PETSITTER_EMAIL = pETSITTER_EMAIL;
	}
	public String getPETSITTER_ADDRESS() {
		return PETSITTER_ADDRESS;
	}
	public void setPETSITTER_ADDRESS(String pETSITTER_ADDRESS) {
		PETSITTER_ADDRESS = pETSITTER_ADDRESS;
	}
	public String getPETSITTER_INTRODUCE() {
		return PETSITTER_INTRODUCE;
	}
	public void setPETSITTER_INTRODUCE(String pETSITTER_INTRODUCE) {
		PETSITTER_INTRODUCE = pETSITTER_INTRODUCE;
	}
	public int getPETSITTER_REPORT() {
		return PETSITTER_REPORT;
	}
	public void setPETSITTER_REPORT(int pETSITTER_REPORT) {
		PETSITTER_REPORT = pETSITTER_REPORT;
	}
	public String getPETSITTER_GENDER() {
		return PETSITTER_GENDER;
	}
	public void setPETSITTER_GENDER(String pETSITTER_GENDER) {
		PETSITTER_GENDER = pETSITTER_GENDER;
	}
	
	public int getPETSITTER_REVIEWCOUNT() {
		return PETSITTER_REVIEWCOUNT;
	}
	public void setPETSITTER_REVIEWCOUNT(int pETSITTER_REVIEWCOUNT) {
		PETSITTER_REVIEWCOUNT = pETSITTER_REVIEWCOUNT;
	}
	
	
	
	
	
	
}
