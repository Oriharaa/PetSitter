package com.spring.petsitter.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MReplyMapper;

@Service("MReplyService")
public class MReplyServiceImpl implements MReplyService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MReplyVO> readReply(int bno) throws Exception {
			MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
			List<MReplyVO> mReplyMapperList = mReplyMapper.readReply(bno);

		return mReplyMapperList;
	}

	@Override
	public void writeReply(MReplyVO vo) throws Exception {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);		
	}	
}
