package com.spring.petsitter.board.mboard;

import java.util.List;

public interface MReplyService {
	public int replyCount() throws Exception;
	public List<MReplyVO> readReply(int bno) throws Exception;
	public int writeReply(MReplyVO vo) throws Exception;	
  public int updateReply(MReplyVO vo) throws Exception;
  public int deleteReply(int rno) throws Exception;
	public void checkArticle(String id);
	public void checkArticle2(String id);
}
