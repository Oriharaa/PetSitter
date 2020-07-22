package com.spring.mapper;

import java.util.List;

import com.spring.petsitter.board.mboard.MReplyVO;

public interface MReplyMapper {
	public int replyCount() throws Exception;
	public List<MReplyVO> readReply(int bno) throws Exception; // ´ñ±Û ÀÐ±â
	public int writeReply(MReplyVO vo) throws Exception;  // ´ñ±Û ÀÛ¼º
	public int updateReply(MReplyVO vo) throws Exception; // ´ñ±Û ¼öÁ¤
	public int deleteReply(int rno) throws Exception; // ´ñ±Û »èÁ¦
	public void checkArticle(String id);
	public void checkArticle2(String id);
}
