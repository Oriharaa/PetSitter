package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

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
	
	
	
	//언택 추가
	//원하는 조건 버튼
	public List<PetsitterVO> petsitterList_We_Pick();  //픽업 가능여부 조회
	public List<PetsitterVO> petsitterList_We_Big();   //대형견 가능여부 조회 
	public List<PetsitterVO> petsitterList_We_Yard();  //마당 존재여부 조회
	public List<PetsitterVO> petsitterList_We_Old();   //노견 가능여부 조회
	
	//평점순
	public List<PetsitterVO> petsitterList_We_Grade(); //평점순 조회
	
	//지역별
	public List<PetsitterVO> petsitterList_We_Area1(); //(서울/경기) 조회
	public List<PetsitterVO> petsitterList_We_Area2(); //(인천/부천) 조회
	public List<PetsitterVO> petsitterList_We_Area3(); //(춘천/강원) 조회
	public List<PetsitterVO> petsitterList_We_Area4(); //(부산/울산/경남) 조회
	public List<PetsitterVO> petsitterList_We_Area5(); //(대구/경북) 조회
	public List<PetsitterVO> petsitterList_We_Area6(); //(전주/전북) 조회
	public List<PetsitterVO> petsitterList_We_Area7(); //(광주/전남) 조회
	public List<PetsitterVO> petsitterList_We_Area8(); //(청주/충북) 조회
	public List<PetsitterVO> petsitterList_We_Area9(); //(대전/충남) 조회
	public List<PetsitterVO> petsitterList_We_Area10(); //(제주) 조회
	
	
	
	
	
	
}
