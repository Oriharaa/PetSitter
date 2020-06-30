package com.spring.petsitter;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int memberInsert(MemberVO member) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.insertMember(member);
		
		return res;
	}

	@Override
	public int memberCheck(MemberVO member) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.memberCheck(member);
		return res;
	}
	
	@Override
	public MemberVO selectMember(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO vo = memberMapper.selectMember(id);
		
		return vo;
	}

	@Override
	public void updateMember(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateMember(id);
		
	}

	@Override
	public ArrayList<MemberVO> memberList() {
		
		return null;
	}

	@Override
	public void deleteMember(String id) {
		
		
	}
}
