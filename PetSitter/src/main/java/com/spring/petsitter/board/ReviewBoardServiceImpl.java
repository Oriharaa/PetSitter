// 만드는중

package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ReviewBoardMapper;

@Service("ReviewBoardService")
public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Autowired
	private SqlSession sqlSession;
	


	@Override
	public List<ReviewBoardVO> getReviewList() {
		List<ReviewBoardVO> review_list = null;
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		review_list = reviewMapper.getReviewList();
		return review_list;
	}

	@Override
	public List<ReviewBoardVO> updateLike_count(ReviewBoardVO vo) {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		String before_id = reviewMapper.before_id(vo);
		//System.out.println(before_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("before_id",before_id);
		map.put("LIKE_ID",vo.getLIKE_ID());
		map.put("LIST_NUM",vo.getLIST_NUM());
		map.put("LIKE_COUNT",vo.getLIKE_COUNT());
		System.out.println("before_id map = " + map.get("before_id"));
		System.out.println("LIKE_ID = " + map.get("LIKE_ID"));
		System.out.println("LIST_NUM = " + map.get("LIST_NUM"));
		reviewMapper.updateLike_count(map);
		reviewMapper.updateLike_count2(map);
		List<ReviewBoardVO> review_list = null;
		review_list = reviewMapper.getLikeSelect(map);
		return review_list;
	}
	
	@Override
	public List<ReviewBoardVO> updateLike_count2(ReviewBoardVO vo) {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		String before_id = reviewMapper.before_id(vo);
		//System.out.println(before_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("before_id",before_id);
		map.put("LIKE_ID",vo.getLIKE_ID());
		map.put("LIST_NUM",vo.getLIST_NUM());
		map.put("LIKE_COUNT",vo.getLIKE_COUNT());
		System.out.println("before_id map = " + map.get("before_id"));
		System.out.println("LIKE_ID = " + map.get("LIKE_ID"));
		System.out.println("LIST_NUM = " + map.get("LIST_NUM"));
		reviewMapper.updateLike_count(map);
		reviewMapper.updateLike_count3(map);
		List<ReviewBoardVO> review_list = null;
		review_list = reviewMapper.getLikeSelect(map);
		return review_list;
	}	


}
