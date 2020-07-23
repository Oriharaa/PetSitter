package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.PetsitterQnaBoardVO;
import com.spring.petsitter.board.ProBoardVO;

public interface PetsitterQnaBoardMapper {
	public int pqboardInsert(PetsitterQnaBoardVO board);
	public PetsitterQnaBoardVO getDetail(int num);
	public int getListCount();
	public List<PetsitterQnaBoardVO> getpqBoardList(HashMap<String, Integer> hashmap);
}
