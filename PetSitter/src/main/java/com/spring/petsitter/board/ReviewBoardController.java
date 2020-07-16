package com.spring.petsitter.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		String uploadPath = "C:\\Project156\\upload\\";
		
		ArrayList<String> review_org_photolist = new ArrayList<String>();
		ArrayList<String> review_up_photolist = new ArrayList<String>();
		for(int i = 0; i < vo.getREVIEW_PHOTO().length; i++) {
		MultipartFile mf = vo.getREVIEW_PHOTO()[i];
			if(!(mf.getOriginalFilename().equals(""))) {
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
				
				if(mf.getSize() != 0) {
					mf.transferTo(new File(uploadPath + storedFileName));
				}
				
				review_org_photolist.add(mf.getOriginalFilename());
				review_up_photolist.add(storedFileName);
			}
		}
		vo.setREVIEW_UP_PHOTO(String.join(",", review_up_photolist));
		
		double petsitter_score = vo.getREVIEW_SCORE();
		PetsitterVO petsitter = petsitterService.selectPetsitter(vo.getPETSITTER_ID());
		if(petsitter.getPETSITTER_SCORE() == 0) {
			petsitter.setPETSITTER_SCORE(petsitter_score);
		} else {
			double org_petsitter_score = petsitter.getPETSITTER_SCORE();
			double result_score = (petsitter_score + org_petsitter_score) / 2.0;
			petsitter.setPETSITTER_SCORE(Math.round(result_score * 10.0) / 10.0);
			
			petsitterService.petsitterscoreupdate(petsitter.getPETSITTER_ID(), Math.round(result_score * 10.0) / 10.0);
		}
		ReviewboardService.insertReview(vo);
		
		return "redirect:/memberinfo.me?id=" + vo.getMEMBER_ID();
	}
	
	@RequestMapping(value = "foster_view.me", method = RequestMethod.GET)
	public String foster_view() {
	
		return "foster_view";
	}
	
	@RequestMapping(value = "call_view.me", method = RequestMethod.GET)
	public String call_view() {
				
		return "call_view";
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
		//System.out.println(review_list.get(0).getMEMBER_PHOTO_FILE());
		//System.out.println(review_list.get(0).getREVIEW_REFLY());

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
	
	
}
