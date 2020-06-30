package com.spring.petsitter.board;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberBoardController {
	
	@Autowired
	private MemberBoardService memberboardService;	
	
	
	@RequestMapping(value = "/mboardlist.me")
	public String memberboard(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		int limit = 10;

		int listcount = memberboardService.getListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<MemberBoardVO> mboard_list = memberboardService.getBoardList(hashmap); // 다른 타입 2개를 전달해야하므로

		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("mboard_list", mboard_list);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "board/memberboard";
	}	
	
	@RequestMapping("/mboardwriteform.me")
	public String boardInsertForm() {

		return "board/memberboard_write";
	}
	
	@RequestMapping("/mboardwrite.me")
	public String boardInsert(MemberBoardVO vo) throws Exception {
		System.out.println("vo.getMEMBER_ID() =" + vo.getMEMBER_ID());
		System.out.println("vo.getMEMBER_FILE() =" + vo.getMEMBER_FILE());
		MultipartFile mf = vo.getMEMBER_FILE();
		String uploadPath = "C:\\Project156\\upload\\";

		if (mf.getSize() != 0) {
			System.out.println("mf=" + mf);
			String originalFileExtension = mf.getOriginalFilename()
					.substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

			// mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
			mf.transferTo(new File(uploadPath + storedFileName));

			vo.setMEMBER_ORG_FILE(mf.getOriginalFilename());
			vo.setMEMBER_UP_FILE(storedFileName);
		} else {
			vo.setMEMBER_ORG_FILE("");
			vo.setMEMBER_UP_FILE("");

		}
		memberboardService.boardInsert(vo);

		return "redirect:/mboardlist.me";
	}
	
	@RequestMapping("/mboarddetail.me")
	public String getDetail(@RequestParam(value = "num", required = true) int num, Model model) {
		MemberBoardVO vo = memberboardService.getDetail(num);

		model.addAttribute("vo", vo);

		return "board/memberboard_view";
	}
	
	@RequestMapping("/mboardmodifyform.me")
	public String getModifyForm(@RequestParam(value = "num", required = true) int num, Model model) {
		MemberBoardVO vo = memberboardService.getDetail(num);
		
		model.addAttribute("vo", vo);
		
		return "board/memberboard_modify";
	}
	
	@RequestMapping("/mboardmodify.me")
	public String boardModify(MemberBoardVO vo) {
		memberboardService.boardModify(vo);
		
		return "redirect:/mboarddetail.me?num=" + vo.getMEMBER_NUM();
	}
	
	@RequestMapping("/mboarddelete.me")
	public String boardDelete(@RequestParam(value="num", required=true) int num, HttpSession session, HttpServletResponse response) throws Exception {
		String id = (String)session.getAttribute("id");
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("num", Integer.toString(num));
		hashmap.put("id", id);
		int res = memberboardService.boardDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1)
		{
			writer.write("<script>alert('삭제 성공!!');"
					+ "location.href='./mboardlist.bo';</script>");
		}
		else
		{
			writer.write("<script>alert('삭제 실패!!');"
					+ "location.href='./mboardlist.bo';</script>");
		}
		return null;
	}
	
	
}
