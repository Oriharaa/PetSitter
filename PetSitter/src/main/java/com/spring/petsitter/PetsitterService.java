package com.spring.petsitter;

import java.util.ArrayList;

import com.spring.petsitter.board.ReviewBoardVO;

public interface PetsitterService {
	public int petsitterSchedule(PetsitterScheduleVO petsitterSchedule);
	public int petsitterInsert(PetsitterVO petsitter);
	public int petsitterCheck(PetsitterVO petsitter);
	public ArrayList<PetsitterVO> petsitterList();
	public PetsitterVO selectPetsitter(PetsitterVO petsitter);
	public int petsitterApproval(PetsitterVO petsitter);
	public int petsitterRefusal(PetsitterVO petsitter);
	public int petsitterUpdate(PetsitterVO petsitter);
	public int reflyUpdate(ReviewBoardVO vo);
	public int petsitterNicknameCheck(PetsitterVO petsitter);
}
