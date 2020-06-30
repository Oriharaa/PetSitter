package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

// 후기 게시판 VO
/*create table REVIEW_BOARD(
    LIST_NUM number(10), -- 리뷰 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    PETSITTER_ID varchar2(30), -- 펫시터 아이디
    REVIEW_CONTENT varchar2(500), -- 리뷰 내용
    REVIEW_SCORE number(2), -- 리뷰 평점
    REVIEW_ORG_PHOTO varchar2(50), -- 리뷰 사진
    REVIEW_UP_PHOTO varchar2(50), -- 업로드된 리뷰 사진
    REVIEW_READCOUNT number(6), -- 리뷰 조회수
    REVIEW_DATE date default sysdate, -- 리뷰 작성일
    REVIEW_CHOICE varchar2(2), -- 리뷰 선택
    LIKE_COUNT number(6) -- 좋아요 수
);*/

public class ReviewBoardVO {
	private int LIST_NUM;
	private String MEMBER_ID;
	private String PETSITTER_ID;
	private String REVIEW_CONTENT;
	private int REVIEW_SCORE;
	private MultipartFile REVIEW_PHOTO;
	private String REVIEW_ORG_PHOTO;
	private String REVIEW_UP_PHOTO;
	private int REVIEW_READCOUNT;
	private Date REVIEW_DATE;
	private String REVIEW_CHOICE;
	private int LIKE_COUNT;
	
	public int getLIST_NUM() {
		return LIST_NUM;
	}
	public void setLIST_NUM(int LIST_NUM) {
		this.LIST_NUM = LIST_NUM;
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
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String REVIEW_CONTENT) {
		this.REVIEW_CONTENT = REVIEW_CONTENT;
	}
	public int getREVIEW_SCORE() {
		return REVIEW_SCORE;
	}
	public void setREVIEW_SCORE(int rEVIEW_SCORE) {
		REVIEW_SCORE = rEVIEW_SCORE;
	}
	public String getREVIEW_ORG_PHOTO() {
		return REVIEW_ORG_PHOTO;
	}
	public void setREVIEW_ORG_PHOTO(String rEVIEW_ORG_PHOTO) {
		REVIEW_ORG_PHOTO = rEVIEW_ORG_PHOTO;
	}
	public String getREVIEW_UP_PHOTO() {
		return REVIEW_UP_PHOTO;
	}
	public void setREVIEW_UP_PHOTO(String rEVIEW_UP_PHOTO) {
		REVIEW_UP_PHOTO = rEVIEW_UP_PHOTO;
	}
	public MultipartFile getREVIEW_PHOTO() {
		return REVIEW_PHOTO;
	}
	public int getREVIEW_READCOUNT() {
		return REVIEW_READCOUNT;
	}
	public void setREVIEW_READCOUNT(int REVIEW_READCOUNT) {
		this.REVIEW_READCOUNT = REVIEW_READCOUNT;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date REVIEW_DATE) {
		this.REVIEW_DATE = REVIEW_DATE;
	}
	public String getREVIEW_CHOICE() {
		return REVIEW_CHOICE;
	}
	public void setREVIEW_CHOICE(String rEVIEW_CHOICE) {
		REVIEW_CHOICE = rEVIEW_CHOICE;
	}
	public int getLIKE_COUNT() {
		return LIKE_COUNT;
	}
	public void setLIKE_COUNT(int LIKE_COUNT) {
		this.LIKE_COUNT = LIKE_COUNT;
	}
	
}
