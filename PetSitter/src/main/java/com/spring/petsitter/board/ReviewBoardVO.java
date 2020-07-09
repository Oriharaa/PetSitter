package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

// 후기 게시판 VO
/*riviewBoard
create table REVIEW_BOARD(
    LIST_NUM number(10), -- 리뷰 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    PETSITTER_ID varchar2(30), -- 펫시터 아이디
    MEMBER_NICKNAME varchar2(30), -- 회원 닉네임
    PETSITTER_NICKNAME varchar2(30), -- 펫시터 닉네임
    REVIEW_CONTENT varchar2(500), -- 리뷰 내용
    REVIEW_SCORE number(2), -- 리뷰 평점
    REVIEW_ORG_PHOTO varchar2(50), -- 리뷰 사진
    REVIEW_UP_PHOTO varchar2(50), -- 업로드된 리뷰 사진
    REVIEW_DATE date default sysdate, -- 리뷰 작성일
    LIKE_COUNT number(6) -- 좋아요 수
);
*/

public class ReviewBoardVO {
	private int LIST_NUM;
	private String MEMBER_ID;
	private String PETSITTER_ID;
	private String REVIEW_CONTENT;
	private int REVIEW_SCORE;
	private MultipartFile REVIEW_PHOTO;
	private String REVIEW_ORG_PHOTO;
	private String REVIEW_UP_PHOTO;
	private Date REVIEW_DATE;
	private int LIKE_COUNT;
	private String BOARD_TYPE;
	private String MEMBER_NICKNAME;
	private String MEMBER_PHOTO;
	private String PETSITTER_NICKNAME;
	private String PETSITTER_ADDRESS;
	private String PETSITTER_PHOTO_PROFILE_FILE;
	private String LIKE_ID;
	private int LIKE_NUM;
	private String LIKE_TYPE;
	public int getLIST_NUM() {
		return LIST_NUM;
	}
	public void setLIST_NUM(int lIST_NUM) {
		LIST_NUM = lIST_NUM;
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
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
	public int getREVIEW_SCORE() {
		return REVIEW_SCORE;
	}
	public void setREVIEW_SCORE(int rEVIEW_SCORE) {
		REVIEW_SCORE = rEVIEW_SCORE;
	}
	public MultipartFile getREVIEW_PHOTO() {
		return REVIEW_PHOTO;
	}
	public void setREVIEW_PHOTO(MultipartFile rEVIEW_PHOTO) {
		REVIEW_PHOTO = rEVIEW_PHOTO;
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
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	public int getLIKE_COUNT() {
		return LIKE_COUNT;
	}
	public void setLIKE_COUNT(int lIKE_COUNT) {
		LIKE_COUNT = lIKE_COUNT;
	}
	public String getBOARD_TYPE() {
		return BOARD_TYPE;
	}
	public void setBOARD_TYPE(String bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}
	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}
	public void setMEMBER_NICKNAME(String mEMBER_NICKNAME) {
		MEMBER_NICKNAME = mEMBER_NICKNAME;
	}
	public String getMEMBER_PHOTO() {
		return MEMBER_PHOTO;
	}
	public void setMEMBER_PHOTO(String mEMBER_PHOTO) {
		MEMBER_PHOTO = mEMBER_PHOTO;
	}
	public String getPETSITTER_NICKNAME() {
		return PETSITTER_NICKNAME;
	}
	public void setPETSITTER_NICKNAME(String pETSITTER_NICKNAME) {
		PETSITTER_NICKNAME = pETSITTER_NICKNAME;
	}
	public String getPETSITTER_ADDRESS() {
		return PETSITTER_ADDRESS;
	}
	public void setPETSITTER_ADDRESS(String pETSITTER_ADDRESS) {
		PETSITTER_ADDRESS = pETSITTER_ADDRESS;
	}
	public String getPETSITTER_PHOTO_PROFILE_FILE() {
		return PETSITTER_PHOTO_PROFILE_FILE;
	}
	public void setPETSITTER_PHOTO_PROFILE_FILE(String pETSITTER_PHOTO_PROFILE_FILE) {
		PETSITTER_PHOTO_PROFILE_FILE = pETSITTER_PHOTO_PROFILE_FILE;
	}
	public String getLIKE_ID() {
		return LIKE_ID;
	}
	public void setLIKE_ID(String lIKE_ID) {
		LIKE_ID = lIKE_ID;
	}
	public int getLIKE_NUM() {
		return LIKE_NUM;
	}
	public void setLIKE_NUM(int lIKE_NUM) {
		LIKE_NUM = lIKE_NUM;
	}
	public String getLIKE_TYPE() {
		return LIKE_TYPE;
	}
	public void setLIKE_TYPE(String lIKE_TYPE) {
		LIKE_TYPE = lIKE_TYPE;
	}
	
	
	
}