package com.spring.petsitter.board;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.petsitter.PetsitterService;
import com.spring.petsitter.PetsitterVO;

@Controller
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService ReviewboardService;	
	
	@Autowired
	private PetsitterService petsitterService;
	
	@RequestMapping(value = "insertReview.me")
	public String insertReview(ReviewBoardVO vo) throws Exception {
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";
		
		ArrayList<String> review_up_photolist = new ArrayList<String>();
		for(int i = 0; i < vo.getREVIEW_PHOTO().length; i++) {
		MultipartFile mf = vo.getREVIEW_PHOTO()[i];
			if(!(mf.getOriginalFilename().equals(""))) {
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
				
				if(mf.getSize() != 0) {
					mf.transferTo(new File(uploadPath + storedFileName));
				}
				
				review_up_photolist.add(storedFileName);
			}
		}
		vo.setREVIEW_UP_PHOTO(String.join(",", review_up_photolist));
		
		double petsitter_score = vo.getREVIEW_SCORE();
		PetsitterVO petsitter = petsitterService.selectPetsitter(vo.getPETSITTER_ID());
		if(petsitter.getPETSITTER_SCORE() == 0) {
			petsitter.setPETSITTER_SCORE(petsitter_score);
			petsitterService.petsitterscoreupdate(petsitter.getPETSITTER_ID(), petsitter_score);
		} else {
			double org_petsitter_score = petsitter.getPETSITTER_SCORE();
			double result_score = (petsitter_score + org_petsitter_score) / 2.0;
			petsitter.setPETSITTER_SCORE(Math.round(result_score * 10.0) / 10.0);
			
			petsitterService.petsitterscoreupdate(petsitter.getPETSITTER_ID(), Math.round(result_score * 10.0) / 10.0);
		}
		ReviewboardService.insertReview(vo);
		
		return "redirect:/memberinfo.me";
	}
	
	@RequestMapping(value = "review_board.bo", method = RequestMethod.GET)
	public String postscript_board() {
				
		return "board/review_board";
	}

	@RequestMapping(value="/getReviewBoardJSON.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	// jsp와 같은 뷰를 전달 하는게 아닌 데이터를 전달 하기 위해 사용 
	public List<ReviewBoardVO> getReviewBoardJSONGET() {
		List<ReviewBoardVO> review_list = ReviewboardService.getReviewList();

        return review_list;
	}
	
	@RequestMapping(value="/updateLike_count.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<ReviewBoardVO>updateLike_count(ReviewBoardVO vo) {
		
		List<ReviewBoardVO> review_list = ReviewboardService.updateLike_count(vo);
		return review_list;
	}
	
	@RequestMapping(value="/updateLike_count2.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<ReviewBoardVO>updateLike_count2(ReviewBoardVO vo) {
		List<ReviewBoardVO> review_list = ReviewboardService.updateLike_count2(vo);
	    
		return review_list;
	}
	
	/*신고 controller 시작*/
	@RequestMapping("/reviewreportform.bo") 
	@ResponseBody	
	public List<ReviewBoardVO> getReviewReportForm(
			@RequestParam(value="num", required=true) int num,
			@RequestParam(value="sessionid", required=true) String sessionid,
			@RequestParam(value="boardType", required=true) String boardType) throws Exception {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("num", num);
		hashmap.put("sessionid", sessionid);
		hashmap.put("boardType", boardType);
		int count = ReviewboardService.getReviewReportCountCheck(hashmap);
		
		List<ReviewBoardVO> boardlist = ReviewboardService.getReviewReportForm(num);
		if(count != 0) {
			boardlist.get(0).setREVIEW_CONTENT("NN");
		}
		return boardlist;
	}	

	@RequestMapping("/reviewreportinsert.bo") 
	public String reviwReportInsert(ReviewBoardVO vo) throws Exception {
		ReviewboardService.reviwReportInsert(vo);
		return "redirect:/review_board.bo";
	}	

	@RequestMapping("/reviewreportinsert2.bo") 
	public String reviwReportInsert2(ReviewBoardVO vo) throws Exception {
		ReviewboardService.reviwReportInsert(vo);
		return "redirect:/reservation1.br";
	}	
}
