package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.board.CommunicationBoardVO;

public interface CommunicationBoardMapper {
	public int boardInsert(CommunicationBoardVO boardvo);
	public ArrayList<CommunicationBoardVO> getBoardList(@Param(value = "MEMBER_ID") String member, 
														@Param(value = "PETSITTER_ID") String petsitter,
														@Param(value = "startrow")int startrow, 
														@Param(value = "endrow") int endrow);
	public int getListCount(@Param(value = "MEMBER_ID") String member, @Param(value = "PETSITTER_ID") String petsitter);
}
