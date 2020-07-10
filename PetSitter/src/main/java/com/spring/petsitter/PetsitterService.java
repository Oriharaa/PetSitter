package com.spring.petsitter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface PetsitterService {
	public int petsitterInsert(PetsitterVO petsitter);
	public int petsitterCheck(PetsitterVO petsitter);
	public ArrayList<PetsitterVO> petsitterList();
	public List<PetsitterVO> petsitterList_Bang(); //방문 펫시터 목록
	public List<PetsitterVO> petsitterList_We(); //위탁 펫시터 목록
	public PetsitterVO selectPetsitter(String id);
	public int petsitterApproval(PetsitterVO petsitter);
	public int petsitterRefusal(PetsitterVO petsitter);
<<<<<<< HEAD
	
	
	
	
	//언택 추가
	//원하는 조건별
	public List<PetsitterVO> petsitterList_We_Pick();
	public List<PetsitterVO> petsitterList_We_Big();
	public List<PetsitterVO> petsitterList_We_Yard();
	public List<PetsitterVO> petsitterList_We_Old();

	//평점순
	public List<PetsitterVO> petsitterList_We_Grade();
	
	//지역별
	public List<PetsitterVO> petsitterList_We_Area1();
	public List<PetsitterVO> petsitterList_We_Area2();
	public List<PetsitterVO> petsitterList_We_Area3();
	public List<PetsitterVO> petsitterList_We_Area4();
	public List<PetsitterVO> petsitterList_We_Area5();
	public List<PetsitterVO> petsitterList_We_Area6();
	public List<PetsitterVO> petsitterList_We_Area7();
	public List<PetsitterVO> petsitterList_We_Area8();
	public List<PetsitterVO> petsitterList_We_Area9();
	public List<PetsitterVO> petsitterList_We_Area10();
	
=======
	public void petsitterscoreupdate(String id, double score);
>>>>>>> origin/moon
}
