package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.board.ReviewBoardVO;

public interface ReviewBoardMapper {
	public int getReviewListCount();
	public Integer maxReviewBoardNumber();
	public ArrayList<ReviewBoardVO> getReviewBoardList(@Param("startrow") int startrow, @Param("endrow") int endrow);
	public ReviewBoardVO getReviewDetail(int num);
	public int ReviewboardInsert(ReviewBoardVO board);
	public boolean ReviewboardDelete(int num);
	public void setReadCountUpdate(int num);
	public String isReviewBoardWriter(int num);
	
}
