package com.spring.petsitter;

import java.util.ArrayList;

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
		return petsitterMapper.petsitterList();
	}

	@Override
	public PetsitterVO selectPetsitter(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		PetsitterVO vo = new PetsitterVO();
		vo = petsitterMapper.selectPetsitter(petsitter);
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
	
	
	
}
