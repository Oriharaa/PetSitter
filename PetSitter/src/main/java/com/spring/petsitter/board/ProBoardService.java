package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.ProBoardVO;

public interface ProBoardService {
	public int getProListCount();
	public List<ProBoardVO> getProBoardList(HashMap<String, Integer> hashmap);
	public int proboardInsert(ProBoardVO board);
	public ProBoardVO getProDetail(int num);
}
