package com.spring.petsitter;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PUsinglistMapper;
import com.spring.petsitter.board.ReviewBoardVO;

@Service("usinglistService")
public class PUsinglistServiceImpl implements PUsinglistService{

	@Autowired
	private SqlSession sqlSession;


	
	@Override
	public int review_refly_N(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.review_refly_N(Usinglist);
	}


	@Override
	public ReviewBoardVO review_refly_select(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.review_refly_select(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_7d(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_7d(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_1m(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_1m(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_3m(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_3m(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_select(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_select(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_select(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_select(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		
		return usinglistMapper.petsitterSelectUsingList(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_7d(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_7d(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_1m(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_1m(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_3m(PUsinglistVO Usinglist) {
		PUsinglistMapper usinglistMapper = sqlSession.getMapper(PUsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_3m(Usinglist);
	}


	
}
