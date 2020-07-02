package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.*;

public interface MemberMapper {
	public int insertMember(MemberVO member);
	public int memberCheck(MemberVO member);
	public ArrayList<MemberVO> memberList();
	public MemberVO selectMember(String id);
	public void updateMember(MemberVO membervo);
	public void deleteMember(String id);
	public ArrayList<UsinglistVO> getUsingList_Member(String id);
	public List<MemberUsinglistVO> getUsingList_Member_ajax(String id);
	public List<MemberUsinglistVO> getUsingList_Member_ajax_month(@Param("MEMBER_ID") String id, @Param("month") int month);
	public ArrayList<UsinglistVO> getUsingList_Member_month(@Param("MEMBER_ID") String id, @Param("month") int month);
}
