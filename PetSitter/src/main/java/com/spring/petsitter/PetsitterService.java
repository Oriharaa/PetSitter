package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

import com.spring.petsitter.board.ReviewBoardVO;

public interface PetsitterService {
	public int petsitterSchedule(PetsitterScheduleVO petsitterSchedule);
	public int petsitterInsert(PetsitterVO petsitter);
	public int petsitterCheck(PetsitterVO petsitter);
	public ArrayList<PetsitterVO> petsitterList();
	public PetsitterVO selectPetsitter(String id);
	public int petsitterApproval(PetsitterVO petsitter);
	public int petsitterRefusal(PetsitterVO petsitter);
	public void petsitterscoreupdate(String id, double score);
	public int petsitterUpdate(PetsitterVO petsitter);
	public int reflyUpdate(ReviewBoardVO vo);
	public int petsitterNicknameCheck(PetsitterVO petsitter);
	
	//언택 추가
	//위탁 펫시터 목록
	public List<PetsitterVO> petsitterList_We(String btn1, String btn2, String btn3, String btn4, 
			String btn_a, String btn_b, String btn_c, String btn_g, String btn_type); 

	public List<PetsitterVO> timeDate(String btn1, String btn2);
}
