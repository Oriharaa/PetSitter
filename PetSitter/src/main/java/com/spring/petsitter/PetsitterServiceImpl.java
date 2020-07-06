package com.spring.petsitter;

import java.util.ArrayList;
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
	
	
	
}
