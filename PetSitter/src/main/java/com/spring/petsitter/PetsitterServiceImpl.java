package com.spring.petsitter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PetsitterMapper;

@Service("petsitterService")
public class PetsitterServiceImpl implements PetsitterService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int petsitterInsert(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.insertPetsitter(petsitter);
		return res;
	}

	@Override
	public int petsitterCheck(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterCheck(petsitter);
		return res;
	}

	@Override
	public ArrayList<PetsitterVO> petsitterList() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		ArrayList<PetsitterVO> petsitter_list = petsitterMapper.petsitterList();
		return petsitter_list;
	}

	@Override
	public PetsitterVO selectPetsitter(String id) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		PetsitterVO vo = new PetsitterVO();
		vo = petsitterMapper.selectPetsitter(id);
		return vo;
	}

	@Override
	public int petsitterApproval(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		int res = petsitterMapper.petsitterApproval(petsitter);
		return res;
	}

	@Override
	public int petsitterRefusal(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		int res = petsitterMapper.petsitterRefusal(petsitter);
		return res;
	}

	// 방문 펫시터 목록
	@Override
	public List<PetsitterVO> petsitterList_Bang() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_Bang();
		return petsitter_list;
	}

	// 위탁 펫시터 목록
	@Override
	public List<PetsitterVO> petsitterList_We() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We();
		return petsitter_list;
	}
	
	// 리뷰 등록 후 펫시터 평점 수정
	@Override
	public void petsitterscoreupdate(String id, double score) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		petsitterMapper.petsitterscoreupdate(id, score);
	}
	
	//언택 추가
	//원하는 조건별
	@Override
	public List<PetsitterVO> petsitterList_We_Pick() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Pick();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Big() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Big();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Yard() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Yard();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Old() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Old();
		return petsitter_list;
	}
	
	
	//평점순
	@Override
	public List<PetsitterVO> petsitterList_We_Grade() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Grade();
		return petsitter_list;
	}
	
	
	//지역별
	@Override
	public List<PetsitterVO> petsitterList_We_Area1() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area1();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area2() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area2();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area3() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area3();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area4() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area4();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area5() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area5();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area6() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area6();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area7() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area7();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area8() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area8();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area9() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area9();
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> petsitterList_We_Area10() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_We_Area10();
		return petsitter_list;
	}
	
	
	
	
	
	
	
	
	
}
