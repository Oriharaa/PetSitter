package com.spring.petsitter.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.petsitter.MemberService;
import com.spring.petsitter.MemberVO;

@Controller
public class CommunicationBoardController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CommunicationBoardService communicationboardService;
	
	@RequestMapping(value = "communication_member.bo")
	public String communication(@RequestParam(value = "petsitterid") String petsitter_id, Model model, CommunicationBoardVO boardvo,
								HttpSession session,
								@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		String member = (String)session.getAttribute("id");
		int limit = 10;
		
		ArrayList<CommunicationBoardVO> board_list = communicationboardService.getQuesionList(member, petsitter_id, page, limit);
		
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(int i = 0; i < board_list.size(); i++) {
			board_list.get(i).setBOARD_REALDATE(new_Format.format(board_list.get(i).getBOARD_DATE()));
		}
		
		int listcount = communicationboardService.getListCount(member, petsitter_id);

		int maxpage = (int) ((double)listcount / limit + 0.95);

		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		int endpage = maxpage;
		
		if(endpage > startpage + 10 - 1) 
			endpage = startpage + 10 - 1;
		
		model.addAttribute("page", page); // 현재 페이지 수
		model.addAttribute("maxpage", maxpage); // 최대 페이지 수
		model.addAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수
		model.addAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지 수
		model.addAttribute("listcount", listcount); // 글 수
		model.addAttribute("board_list", board_list);
		model.addAttribute("petsitter_id", petsitter_id);
		
		return "communication";
	}
	
	@RequestMapping(value = "communicationWrite_member.bo")
	public String communicationWrite(@RequestParam(value = "petsitterid") String petsitter_id, Model model, HttpSession session) {
		MemberVO membervo = memberService.selectMember((String)session.getAttribute("id"));
		String writer = membervo.getMEMBER_NICKNAME();
		model.addAttribute("writer", writer);
		model.addAttribute("petsitter_id", petsitter_id);
		return "communication_board";
	}
	
	@RequestMapping(value = "communicationWriteProcess_member.bo")
	public String communicationWriteProcess(CommunicationBoardVO boardvo, HttpServletResponse response) throws IOException {
		int res = communicationboardService.boardInsert(boardvo);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if(res != 0) {
			writer.write("<script>location.href='./communication_member.bo?petsitterid=" +
						boardvo.getPETSITTER_ID() + "';</script>");
		}
		else {
			writer.write("<script>alert('등록 실패');" +
							"location.href='./communication_member.bo?petsitterid=" + boardvo.getPETSITTER_ID() + "';</script>");
		}
		return null;
	}
	
}
