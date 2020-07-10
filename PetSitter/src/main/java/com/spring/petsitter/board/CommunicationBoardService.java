package com.spring.petsitter.board;

import java.util.ArrayList;

public interface CommunicationBoardService {
	public int boardInsert(CommunicationBoardVO boardvo);
	public int getListCount(String member, int petsitter);
	public ArrayList<CommunicationBoardVO> getQuesionList(String member, int usinglist_num, int page, int limit);

}
