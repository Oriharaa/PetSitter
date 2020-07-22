package com.spring.petsitter.board.mboard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MReplyService {
	public int replyCount() throws Exception;
	public List<MReplyVO> readReply(int bno) throws Exception;
	public int writeReply(MReplyVO vo) throws Exception;	
  public int updateReply(MReplyVO vo) throws Exception;
  public int deleteReply(int rno) throws Exception;
	public void checkArticle(String id);
	public void checkArticle2(String id);
	public void checkReply(String bno, String rno);
	public void checkReply2(String bno, String rno);
	public int searchIdReportReply(String id, int bno, int rno);
	public int searchIdReportArticle(String id, int num);
}
