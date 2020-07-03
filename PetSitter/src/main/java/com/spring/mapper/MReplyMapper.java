package com.spring.mapper;

import java.util.List;

import com.spring.petsitter.board.MReplyVO;

public interface MReplyMapper {
	public List<MReplyVO> readReply(int bno);
	public void writeReply(MReplyVO vo);
}
