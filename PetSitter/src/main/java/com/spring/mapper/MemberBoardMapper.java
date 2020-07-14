package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.mboard.MemberBoardVO;

public interface MemberBoardMapper {
	public List<MemberBoardVO> getBoardList(HashMap<String, Integer> hashmap);
	public int getListCount();
	public MemberBoardVO getDetail(int num);
	public int boardInsert(MemberBoardVO board);
	public int boardModify(MemberBoardVO modifyboard);
	public int boardDelete(int num);
	public void setReadCountUpdate(int num);
	public int isBoardWriter(HashMap<String, String> hashmap);
	public String getMemberName(String member_id);
}
