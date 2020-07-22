package com.spring.petsitter.board.mboard;

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
	public int replyCount() throws Exception {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
		return mReplyMapper.replyCount();
	}
	
	@Override
	public List<MReplyVO> readReply(int bno) throws Exception {
			MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
			return mReplyMapper.readReply(bno);
	}

	@Override
	public int writeReply(MReplyVO vo) throws Exception {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
		return mReplyMapper.writeReply(vo);
	}

	@Override
	public int updateReply(MReplyVO vo) throws Exception {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
		return mReplyMapper.updateReply(vo);
	}

	@Override
	public int deleteReply(int rno) throws Exception {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
		return mReplyMapper.deleteReply(rno);
	}

	@Override
	public void checkArticle(String id) {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
		mReplyMapper.checkArticle(id);
	}

	@Override
	public void checkArticle2(String id) {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
		mReplyMapper.checkArticle2(id);
	}

}
