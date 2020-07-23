package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.ProBoardVO;
import com.spring.petsitter.board.ProReplyVO;

public interface ProBoardMapper {
	public int getProListCount();
	public List<ProBoardVO> getProBoardList(HashMap<String, Integer> hashmap);
	public String nicknameFind(ProBoardVO board);
	public void proboardInsert(ProBoardVO board);
	public List<ProBoardVO> getProDetail(int num);
	public void setProReadCountUpdate(int num);
	public ProBoardVO getProModifyForm(int num);	
	public void proModifyUpdate(ProBoardVO board);	
	public int isProBoardWriter(HashMap<String, String> hashmap);	
	public void proBoardDelete(int num);	
	public void proReportInsert(ProBoardVO board);
	public List<ProReplyVO> getProReportReplyForm(ProReplyVO vo);
	public void proReportReplyInsert(ProReplyVO vo);
	
	
	//하단부터 댓글 Mapper.java 부분 
	public String nicknameFind02(String gid);
	public String nicknameFind03(String gid);
	public List<ProReplyVO> readProReply(int bno) throws Exception;
	public int writeProReply(ProReplyVO vo) throws Exception;
	public int updateProReply(ProReplyVO vo) throws Exception;
	public int deleteProReply(ProReplyVO vo) throws Exception;
	public List<ProReplyVO> proReplyCount(int bno) throws Exception;
}
