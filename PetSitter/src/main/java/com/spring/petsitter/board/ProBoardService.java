package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.ProBoardVO;

public interface ProBoardService {
	public int getProListCount();
	public List<ProBoardVO> getProBoardList(HashMap<String, Integer> hashmap);
	public void proboardInsert(ProBoardVO board);
	public List<ProBoardVO> getProDetail(int num);
	public ProBoardVO getProModifyForm(int num);
	public List<ProBoardVO> getProReportForm(int num);
	public void proModifyUpdate(ProBoardVO board);
	public void proboardDelete(HashMap<String, String> hashmap);
	public void proReportInsert(ProBoardVO board);
	public List<ProReplyVO> getProReportReplyForm(ProReplyVO vo);
	public void proReportReplyInsert(ProReplyVO vo);
	
	//하단부터 댓글 Service 부분 
	public List<ProReplyVO> readProReply(int bno) throws Exception;
	public int writeProReply(ProReplyVO vo) throws Exception;	
	public int updateProReply(ProReplyVO vo) throws Exception;
	public int deleteProReply(ProReplyVO vo) throws Exception;	
	public List<ProReplyVO> proReplyCount(int bno) throws Exception;	
}
