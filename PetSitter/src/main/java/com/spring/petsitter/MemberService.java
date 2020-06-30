package com.spring.petsitter;

import java.util.ArrayList;

public interface MemberService {
	public int memberInsert(MemberVO member);
	public int memberCheck(MemberVO member);
	public ArrayList<MemberVO> memberList(); // memberList 추가
	public MemberVO selectMember(String id); // 파라미터 String or MemberVO
	public void updateMember(String id);
	public void deleteMember(String id); // deleteMember 추가s
}
