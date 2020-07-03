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
	public int getListCount(String member, String petsitter) {
		CommunicationBoardMapper boardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int cnt = boardMapper.getListCount(member, petsitter);
		return cnt;
	}
	
	@Override
	public ArrayList<CommunicationBoardVO> getBoardList(String member, String petsitter, int page, int limit) {
		CommunicationBoardMapper boardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		ArrayList<CommunicationBoardVO> boardList = boardMapper.getBoardList(member, petsitter, startrow, endrow);
		return boardList;
	}
	
	@Override
	public int boardInsert(CommunicationBoardVO boardvo) {
		CommunicationBoardMapper communicationboardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int res = communicationboardMapper.boardInsert(boardvo);
		
		return res;
	}

}
