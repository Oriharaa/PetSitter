// 만드는중

package com.spring.petsitter.board;

import java.util.ArrayList;
import java.util.List;

public interface ReviewBoardService {
	public void insertReview(ReviewBoardVO vo);
	public List<ReviewBoardVO> getReviewList();
	public List<ReviewBoardVO> updateLike_count(ReviewBoardVO vo);
	public List<ReviewBoardVO> updateLike_count2(ReviewBoardVO vo);
	public ArrayList<Integer> usinglist_num_List_member(String id);
}
