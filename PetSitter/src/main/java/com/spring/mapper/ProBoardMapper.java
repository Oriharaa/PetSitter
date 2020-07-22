package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.ProBoardVO;

public interface ProBoardMapper {
	public int getProListCount();
	public List<ProBoardVO> getProBoardList(HashMap<String, Integer> hashmap);
	public String nicknameFind(ProBoardVO board);
	public int proboardInsert(ProBoardVO board);
	public ProBoardVO getProDetail(int num);
	public void setProReadCountUpdate(int num);
	
	
}
