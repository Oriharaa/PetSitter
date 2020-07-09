// 만드는중

package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface ReviewBoardService {
	public List<ReviewBoardVO> getReviewList();
	public List<ReviewBoardVO> updateLike_count(ReviewBoardVO vo);
	public List<ReviewBoardVO> updateLike_count2(ReviewBoardVO vo);
}
