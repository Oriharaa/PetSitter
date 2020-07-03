package com.spring.petsitter.board;

import java.util.List;

public interface MReplyService {
	public List<MReplyVO> readReply(int bno) throws Exception;
	public void writeReply(MReplyVO vo) throws Exception;
}
