package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

public interface MemberService {
	public int memberInsert(MemberVO member);
	public int memberCheck(MemberVO member);
	public ArrayList<MemberVO> memberList();
	public MemberVO selectMember(String id);
	public void updateMember(MemberVO membervo);
	public void deleteMember(String id);
	public ArrayList<UsinglistVO> getUsingList_Member(String id);
	public List<MemberUsinglistVO> getUsingList_Member_ajax(String id);
	public List<MemberUsinglistVO> getUsingList_Member_ajax_month(String id, int month);
	public ArrayList<UsinglistVO> getUsingList_Member_month(String id, int month);
}
