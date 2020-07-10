package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.PetsitterVO;

public interface PetsitterMapper {
	public int insertPetsitter(PetsitterVO petsitter); //펫시터 회원가입 insert
	public int petsitterCheck(PetsitterVO petsitter); //펫시터 회원 확인
	public ArrayList<PetsitterVO> petsitterList(); //펫시터 목록
	public List<PetsitterVO> petsitterList_Bang(); //방문 펫시터 목록
	public List<PetsitterVO> petsitterList_We(); //위탁 펫시터 목록
	public PetsitterVO selectPetsitter(String id); //ID로 펫시터 정보 select
	public int petsitterApproval(PetsitterVO petsitter); //펫시터 신청허가시 업데이트
	public int petsitterRefusal(PetsitterVO petsitter); //펫시터 신청거절시 업데이트
	public void petsitterscoreupdate(@Param(value="PETSITTER_ID") String id, @Param(value="PETSITTER_SCORE") double score); // 리뷰 작성 후 펫시터 평점 수정
}
