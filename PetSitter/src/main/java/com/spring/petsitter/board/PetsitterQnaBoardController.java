package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PetsitterQnaBoardController {

	@Autowired
	private PetsitterQnaBoardService petsitterQnaBoardService;
	
	@RequestMapping(value = "/pqboardlist.me")
	public String pqboard(Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		int limit = 10;
		
		int listcount = petsitterQnaBoardService.getListCount();
		
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<PetsitterQnaBoardVO> pqboard_list = petsitterQnaBoardService.getpqBoardList(hashmap);
		
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("pqboard_list", pqboard_list);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		return "board/pqboard";
	}
	
	@RequestMapping("/pqboardwriteform.me")
	public String pqboardInsertForm() {
		
		return "board/pqboard_write";
	}
	
	@RequestMapping("/pqboardwrite.me")
	public String pqboardInsert(PetsitterQnaBoardVO vo) throws Exception {
		
		System.out.println("vo.getMEMBER_ID() : " + vo.getMEMBER_ID());
		System.out.println("vo.getMEMBER_NICKNAME() : " + vo.getMEMBER_NICKNAME());
		
		System.out.println("vo.getPETSITTER_ID() : " + vo.getPETSITTER_ID());
		System.out.println("vo.getPETSITTER_NICKNAME() : " + vo.getPETSITTER_NICKNAME());
		
		petsitterQnaBoardService.pqboardInsert(vo);
		
		return "redirect:/pqboardlist.me";
	}
	
	@RequestMapping("/pqboarddetail.me")
	public String getpqDetail(@RequestParam(value = "bno", required = true) int bno, Model model) throws Exception {
		PetsitterQnaBoardVO vo = petsitterQnaBoardService.getDetail(bno);
		model.addAttribute("vo", vo);
		
		return "board/pqboard_view";
	}
}
