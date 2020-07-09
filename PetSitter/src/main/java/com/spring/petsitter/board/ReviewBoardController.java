package com.spring.petsitter.board;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService ReviewboardService;	
	
	

	
	@RequestMapping(value="/getReviewBoardJSON.bo", produces="application/json;charset=UTF-8")
	@ResponseBody // jsp와 같은 뷰를 전달 하는게 아닌 데이터를 전달 하기 위해 사용 
	public List<ReviewBoardVO> getPeopleJSONGET() {
		List<ReviewBoardVO> review_list = ReviewboardService.getReviewList();
		//System.out.println(review_list.get(0).getMEMBER_PHOTO());
		//System.out.println(review_list.get(0).getPETSITTER_PHOTO_PROFILE());
		//System.out.println(review_list.get(0).getPETSITTER_ADDRESS());
		//System.out.println(review_list.get(0).getREVIEW_ORG_PHOTO());

        return review_list;
	}
	
	@RequestMapping(value="/updateLike_count.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<ReviewBoardVO>updateLike_count(ReviewBoardVO vo) {
		//System.out.println("vo.getLIST_NUM()=" + vo.getLIST_NUM());
		//System.out.println("vo.getLIKE_ID()=" + vo.getLIKE_ID());
		System.out.println("vo.getLIKE_COUNT()=" + vo.getLIKE_COUNT());
		List<ReviewBoardVO> review_list = ReviewboardService.updateLike_count(vo);
		//System.out.println("LIST getLIKE_COUNT()=" + review_list.get(0).getLIKE_COUNT());
		return review_list;
	}
	
	@RequestMapping(value="/updateLike_count2.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<ReviewBoardVO>updateLike_count2(ReviewBoardVO vo) {
		List<ReviewBoardVO> review_list = ReviewboardService.updateLike_count2(vo);
	    
		return review_list;
	}	
	
	
}
