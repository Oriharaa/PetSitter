// 만드는중

package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProBoardMapper;
import com.spring.petsitter.board.ProBoardVO;

@Service("ProrBoardService")
public class ProBoardServiceImpl implements ProBoardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getProListCount() {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		int res = boardMapper.getProListCount();
		return res;
	}

	@Override
	public List<ProBoardVO> getProBoardList(HashMap<String, Integer> hashmap) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		List<ProBoardVO> boardlist = boardMapper.getProBoardList(hashmap);
		return boardlist;
	}

	@Override
	public int proboardInsert(ProBoardVO board) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		board.setMEMBER_NICKNAME(boardMapper.nicknameFind(board));
		int res = boardMapper.proboardInsert(board);
		
		return res;
	}

	@Override
	public ProBoardVO getProDetail(int num) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		boardMapper.setProReadCountUpdate(num);
		ProBoardVO board = boardMapper.getProDetail(num);
		System.out.println("service board = " + board.getPRO_SUBJECT());
		return board;
	}


}
