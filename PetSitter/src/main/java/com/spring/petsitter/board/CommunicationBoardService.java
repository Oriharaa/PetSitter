package com.spring.petsitter.board;

import java.util.ArrayList;

public interface CommunicationBoardService {
	public int boardInsert(CommunicationBoardVO boardvo);
	public int getListCount(String member, String petsitter);
	public ArrayList<CommunicationBoardVO> getBoardList(String member, String petsitter, int page, int limit);
	
}
