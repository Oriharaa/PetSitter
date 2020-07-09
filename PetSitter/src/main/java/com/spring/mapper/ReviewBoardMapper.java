package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.board.ReviewBoardVO;

public interface ReviewBoardMapper {
	public int getReviewListCount();
	public List<ReviewBoardVO> getReviewList();
	public String before_id(ReviewBoardVO vo);
	void updateLike_count(HashMap<String, Object> map);
	void updateLike_count2(HashMap<String, Object> map);
	void updateLike_count3(HashMap<String, Object> map);
	public List<ReviewBoardVO> getLikeSelect(HashMap<String, Object> map);
	
}
