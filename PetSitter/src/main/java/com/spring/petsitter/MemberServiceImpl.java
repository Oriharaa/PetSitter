package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

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
	public void updateMember(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateMember(membervo);
	}
	
	@Override
	public void updateMemberRank(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.updateMemberRank(membervo);
	}

	@Override
	public ArrayList<MemberVO> memberList() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberVO> memberList = memberMapper.memberList();
		
		return memberList;
	}

	@Override
	public void deleteMember(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.deleteMember(id);
	}
	
	@Override
	public int getListCount(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int listcount = memberMapper.getListCount(id);
		return listcount;
	}
	
	@Override
	public ArrayList<UsinglistVO> getUsingList_Member(String id, int page, int limit) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		ArrayList<UsinglistVO> usinglist = memberMapper.getUsingList_Member(id, startrow, endrow);
		return usinglist;
	}
	
	@Override
	public List<MemberUsinglistVO> getUsingList_Member_ajax(String id, int page, int limit) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		List<MemberUsinglistVO> usinglist_ajax = memberMapper.getUsingList_Member_ajax(id, startrow, endrow);
		
		return usinglist_ajax;
	}
	
	@Override
	public List<MemberUsinglistVO> getUsingList_Member_ajax_month(String id, int month) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		List<MemberUsinglistVO> usinglist_ajax = memberMapper.getUsingList_Member_ajax_month(id, month);
		
		return usinglist_ajax;
	}

	@Override
	public ArrayList<UsinglistVO> getUsingList_Member_month(String id, int month) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<UsinglistVO> usinglist = memberMapper.getUsingList_Member_month(id, month);
		return usinglist;
	}

	@Override
	public ArrayList<UsinglistVO> getUsingList_Member_calendar(String id, String startdate, String enddate) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<UsinglistVO> usinglist = memberMapper.getUsingList_Member_calendar(id, startdate, enddate);
		return usinglist;
	}

	@Override
	public List<MemberUsinglistVO> getUsingList_Member_ajax_calendar(String id, String startdate, String enddate) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		List<MemberUsinglistVO> usinglist_ajax = memberMapper.getUsingList_Member_ajax_calendar(id, startdate, enddate);
		return usinglist_ajax;
	}

	@Override
	public void suspendedMember(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.suspendedMember(id);		
	}

	@Override
	public void rollbackMember(String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.rollbackMember(id);				
	}

	@Override
	public List<MemberVO> changeMember(String rank, String id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		List<MemberVO> change_member = memberMapper.changeMember(rank, id);
		return change_member;
	}
}