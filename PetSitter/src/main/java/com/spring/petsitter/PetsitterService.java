package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

import com.spring.petsitter.board.ReviewBoardVO;

public interface PetsitterService {
	public int petsitterSchedule(PetsitterScheduleVO petsitterSchedule);
	public int petsitterInsert(PetsitterVO petsitter);
	public int petsitterCheck(PetsitterVO petsitter);
	public ArrayList<PetsitterVO> petsitterList();
	public List<PetsitterVO> petsitterList_Bang(); //방문 펫시터 목록
	public List<PetsitterVO> petsitterList_We(); //위탁 펫시터 목록
	public PetsitterVO selectPetsitter(String id);
	public int petsitterApproval(PetsitterVO petsitter);
	public int petsitterRefusal(PetsitterVO petsitter);
	public void petsitterscoreupdate(String id, double score);
	public int petsitterUpdate(PetsitterVO petsitter);
	public int reflyUpdate(ReviewBoardVO vo);
	public int petsitterNicknameCheck(PetsitterVO petsitter);
}
