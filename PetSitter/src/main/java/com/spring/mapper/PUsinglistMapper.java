package com.spring.mapper;

import java.util.ArrayList;

import com.spring.petsitter.PetsitterUsinglistVO;
import com.spring.petsitter.PUsinglistVO;
import com.spring.petsitter.board.ReviewBoardVO;

public interface PUsinglistMapper {
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList(PUsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_7d(PUsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_1m(PUsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_3m(PUsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_select(PUsinglistVO Usinglist);
	public ReviewBoardVO review_refly_select(PUsinglistVO Usinglist);
	public int review_refly_N(PUsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount(PUsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_7d(PUsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_1m(PUsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_3m(PUsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_select(PUsinglistVO Usinglist);

	
}
