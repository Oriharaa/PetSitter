package com.spring.petsitter.board;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CommunicationBoardMapper;

@Service("CommunicationBoardService")
public class CommunicationBoardServiceImpl implements CommunicationBoardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getListCount(String member, int usinglist_num) {
		CommunicationBoardMapper boardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int cnt = boardMapper.getListCount(member, usinglist_num);
		return cnt;
	}
	
	@Override
	public ArrayList<CommunicationBoardVO> getQuesionList(String member, int usinglist_num, int page, int limit) {
		CommunicationBoardMapper boardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		ArrayList<CommunicationBoardVO> boardList = boardMapper.getQuesionList(member, usinglist_num, startrow, endrow);
		return boardList;
	}
	
	@Override
	public int boardInsert(CommunicationBoardVO boardvo) {
		CommunicationBoardMapper communicationboardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int res = communicationboardMapper.boardInsert(boardvo);
		
		return res;
	}

}
