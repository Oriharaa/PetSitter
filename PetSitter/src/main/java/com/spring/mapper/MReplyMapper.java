package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.board.mboard.MReplyVO;

public interface MReplyMapper {
	public int replyCount() throws Exception;
	public List<MReplyVO> readReply(int bno) throws Exception; // ¥Ò±€ ¿–±‚
	public int writeReply(MReplyVO vo) throws Exception;  // ¥Ò±€ ¿€º∫
	public int updateReply(MReplyVO vo) throws Exception; // ¥Ò±€ ºˆ¡§
	public int deleteReply(int rno) throws Exception; // ¥Ò±€ ªË¡¶
	public void checkArticle(String id);
	public void checkArticle2(String id);
	public void checkReply(@Param("bno")String bno, @Param("rno")String rno);
	public void checkReply2(@Param("bno")String bno, @Param("rno")String rno);
}
