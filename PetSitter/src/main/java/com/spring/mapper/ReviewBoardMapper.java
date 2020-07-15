package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.ReviewBoardVO;

public interface ReviewBoardMapper {
	public int getReviewListCount();
<<<<<<< HEAD
	public void insertReview(ReviewBoardVO vo);
	public List<ReviewBoardVO> getReviewList();
	public String before_id(ReviewBoardVO vo);
	void updateLike_count(HashMap<String, Object> map);
	void updateLike_count2(HashMap<String, Object> map);
	void updateLike_count3(HashMap<String, Object> map);
	public List<ReviewBoardVO> getLikeSelect(HashMap<String, Object> map);
	public ArrayList<Integer> usinglist_num_List_member(String id);
=======
	public Integer maxReviewBoardNumber();
	public ArrayList<ReviewBoardVO> getReviewBoardList(@Param("startrow") int startrow, @Param("endrow") int endrow);
	public ReviewBoardVO getReviewDetail(int num);
	public int ReviewboardInsert(ReviewBoardVO board);
	public boolean ReviewboardDelete(int num);
	public void setReadCountUpdate(int num);
	public String isReviewBoardWriter(int num);
	
>>>>>>> origin/MH
}
