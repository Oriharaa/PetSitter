package com.spring.petsitter;


import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.petsitter.board.ReviewBoardService;
import com.spring.petsitter.pay.PayService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private ReviewBoardService reviewboardService;
	
	@Autowired
	private PayService payService;

	@RequestMapping(value = "memberinfo.me")
	public ModelAndView profile(MemberVO vo, @RequestParam(value = "id") String id, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		if(session.getAttribute("id") != null) {
			ModelAndView mv = new ModelAndView();
			
			MemberVO membervo = memberService.selectMember(id);
			String tel = membervo.getMEMBER_TEL();
			String[] address = membervo.getMEMBER_ADDRESS().split(",");
			int review_count = reviewboardService.getReviewListCount_member(id);
			
			int listcount = memberService.getListCount(id);
			
			mv.addObject("listcount", listcount);
			mv.addObject("review_count", review_count);
			mv.addObject("membervo", membervo);
			mv.addObject("tel", tel);
			mv.addObject("address", address);
			mv.setViewName("memberinfo");
			return mv;
		} else {
			writer.write("<script>");
			writer.write("alert('로그인 시간이 만료되어 자동 로그아웃 됩니다.')");
			writer.write("location.href='loginform.me'");
			writer.write("</script>");
			return null;
		}
	}
	
	@RequestMapping(value = "petRegister.me")
	public String petRegister() {
		return "petRegister";
	}
	
	@RequestMapping(value = "petRegister2.me")
	public String petRegister2(PetVO vo) {
		int res = petService.petInsert(vo);
		if(res != 0) {
			System.out.println("Pet Insert Complete!");
		}
		return "petRegister2";
	}
	
	@RequestMapping(value = "getUsingList.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberUsinglistVO> getUsinglist(String id, int page) {
		int limit = 5;
		
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member(id, page, limit);
		List<MemberUsinglistVO> usinglist_ajax = memberService.getUsingList_Member_ajax(id, page, limit);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = new_Format.format(date);
		ArrayList<Integer> usinglist_num_member = reviewboardService.usinglist_num_List_member(id); // 리뷰를 남겼는지 확인하기 위한 리스트
		
		int count = 0; // 이용 횟수 갱신
		for(int i = 0; i < usinglist_ajax.size(); i++) {
			usinglist_ajax.get(i).setLIST_START_DATE(new_Format.format(usinglist.get(i).getLIST_START_DATE()));
			usinglist_ajax.get(i).setLIST_END_DATE(new_Format.format(usinglist.get(i).getLIST_END_DATE()));
			
			if(usinglist.get(i).getPETSITTER_ADDR() != null) {
				String[] address_arr = usinglist.get(i).getPETSITTER_ADDR().split(" ");
				String address;
				if(address_arr.length == 2) {
					address = address_arr[0] + " " + address_arr[1];
				} else {
					address = address_arr[0];
				}
				usinglist_ajax.get(i).setPETSITTER_ADDRESS1(address);
			}
			String merchant_uid = usinglist_ajax.get(i).getMERCHANT_UID();
			String status = "";
			if(merchant_uid != null) {
				status = payService.selectPay(merchant_uid).getPAY_STATUS();
			}
			
			
			String ing = "";
			int compare1 = usinglist_ajax.get(i).getLIST_START_DATE().compareTo(today);
			int compare2 = today.compareTo(usinglist_ajax.get(i).getLIST_END_DATE());
			if(compare1 < 0 && compare2 < 0) {
  				ing = "현재 이용중";
  				count++;
  			} else if(compare1 > 0) {
  				if(usinglist_ajax.get(i).getLIST_TYPE().equals("위탁")) {
  					ing = "위탁 대기 중";
  				} else if(usinglist_ajax.get(i).getLIST_TYPE().equals("방문")) {
  					ing = "방문 대기 중";
  				}
  				if(status.equals("결제 취소")) {
  	  				ing = "예약 취소";
  	  			}
  			} else {
  				ing = "이용 완료";
  				count++;
  			}
			usinglist_ajax.get(i).setLIST_ING(ing);
			
			if(ing.equals("현재 이용중")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("펫시터와의 소통");
			} else if(usinglist_num_member.contains(usinglist_ajax.get(i).getLIST_NUM())) { // 리뷰 작성 했는지 안했는지 확인
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 완료");
			} else if(ing.equals("위탁 대기 중") || ing.equals("방문 대기 중") || ing.equals("예약 취소")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("예약 취소");
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		
		MemberVO member = memberService.selectMember(id);
		member.setMEMBER_COUNT(count);
		if(count >= 15 && count < 30) {
			member.setMEMBER_RANK("Gold");
		} else if(count >= 30) {
			member.setMEMBER_RANK("VIP");
		} else if(count == 0 && count < 15) {
			member.setMEMBER_RANK("Green");
		}
		memberService.updateMemberRank(member);
		
		return usinglist_ajax;
	}
	
	@RequestMapping(value = "getUsingList_month.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberUsinglistVO> getUsinglist_month(String id, int month, int page) {
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member_month(id, -month);
		List<MemberUsinglistVO> usinglist_ajax = memberService.getUsingList_Member_ajax_month(id, -month);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = new_Format.format(date);
		
		ArrayList<Integer> usinglist_num_member = reviewboardService.usinglist_num_List_member(id); // 리뷰를 남겼는지 확인하기 위한 리스트

		for(int i = 0; i < usinglist_ajax.size(); i++) {
			usinglist_ajax.get(i).setLIST_START_DATE(new_Format.format(usinglist.get(i).getLIST_START_DATE()));
			usinglist_ajax.get(i).setLIST_END_DATE(new_Format.format(usinglist.get(i).getLIST_END_DATE()));
			
			if(usinglist.get(i).getPETSITTER_ADDR() != null) {
				String[] address_arr = usinglist.get(i).getPETSITTER_ADDR().split(" ");
				String address;
				if(address_arr.length == 2) {
					address = address_arr[0] + " " + address_arr[1];
				} else {
					address = address_arr[0];
				}
				usinglist_ajax.get(i).setPETSITTER_ADDRESS1(address);
			}
			String merchant_uid = usinglist_ajax.get(i).getMERCHANT_UID();
			String status = payService.selectPay(merchant_uid).getPAY_STATUS();
			
			String ing = "";
			int compare1 = usinglist_ajax.get(i).getLIST_START_DATE().compareTo(today);
			int compare2 = today.compareTo(usinglist_ajax.get(i).getLIST_END_DATE());
			if(compare1 < 0 && compare2 < 0) {
  				ing = "현재 이용중";
  			} else if(compare1 > 0) {
  				if(usinglist_ajax.get(i).getLIST_TYPE().equals("위탁")) {
  					ing = "위탁 대기 중";
  				} else if(usinglist_ajax.get(i).getLIST_TYPE().equals("방문")) {
  					ing = "방문 대기 중";
  				} if(status.equals("결제 취소")) {
  	  				ing = "예약 취소";
  	  			}
  			} else {
  				ing = "이용 완료";
  			}
			usinglist_ajax.get(i).setLIST_ING(ing);
			
			if(ing.equals("현재 이용중")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("펫시터와의 소통");
			} else if(usinglist_num_member.contains(usinglist_ajax.get(i).getLIST_NUM())) { // 리뷰 작성 했는지 안했는지 확인
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 완료");
			} else if(ing.equals("위탁 대기 중") || ing.equals("방문 대기 중") || ing.equals("예약 취소")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("예약 취소");
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		
		return usinglist_ajax;
	}
	
	@RequestMapping(value = "getUsingList_calendar.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberUsinglistVO> getUsinglist_calendar(String id, String startdate, String enddate, int page, Model model) {
		
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member_calendar(id, startdate, enddate);
		List<MemberUsinglistVO> usinglist_ajax = memberService.getUsingList_Member_ajax_calendar(id, startdate, enddate);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = new_Format.format(date);
		
		ArrayList<Integer> usinglist_num_member = reviewboardService.usinglist_num_List_member(id); // 리뷰를 남겼는지 확인하기 위한 리스트
		
		for(int i = 0; i < usinglist_ajax.size(); i++) {
			usinglist_ajax.get(i).setLIST_START_DATE(new_Format.format(usinglist.get(i).getLIST_START_DATE()));
			usinglist_ajax.get(i).setLIST_END_DATE(new_Format.format(usinglist.get(i).getLIST_END_DATE()));
			
			if(usinglist.get(i).getPETSITTER_ADDR() != null) {
				String[] address_arr = usinglist.get(i).getPETSITTER_ADDR().split(" ");
				String address;
				if(address_arr.length == 2) {
					address = address_arr[0] + " " + address_arr[1];
				} else {
					address = address_arr[0];
				}
				usinglist_ajax.get(i).setPETSITTER_ADDRESS1(address);
			}
			String merchant_uid = usinglist_ajax.get(i).getMERCHANT_UID();
			String status = payService.selectPay(merchant_uid).getPAY_STATUS();
			
			String ing = "";
			int compare1 = usinglist_ajax.get(i).getLIST_START_DATE().compareTo(today);
			int compare2 = today.compareTo(usinglist_ajax.get(i).getLIST_END_DATE());
			if(compare1 < 0 && compare2 < 0) {
  				ing = "현재 이용중";
  			} else if(compare1 > 0) {
  				if(usinglist_ajax.get(i).getLIST_TYPE().equals("위탁")) {
  					ing = "위탁 대기 중";
  				} else if(usinglist_ajax.get(i).getLIST_TYPE().equals("방문")) {
  					ing = "방문 대기 중";
  				} if(status.equals("결제 취소")) {
  	  				ing = "예약 취소";
  	  			}
  			} else {
  				ing = "이용 완료";
  			}
			usinglist_ajax.get(i).setLIST_ING(ing);
			
			if(ing.equals("현재 이용중")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("펫시터와의 소통");
			} else if(usinglist_num_member.contains(usinglist_ajax.get(i).getLIST_NUM())) { // 리뷰 작성 했는지 안했는지 확인
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 완료");
			} else if(ing.equals("위탁 대기 중") || ing.equals("방문 대기 중") || ing.equals("예약 취소")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("예약 취소");
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		
		return usinglist_ajax;
	}
	
	@RequestMapping(value = "home.me")
	public String home(Model model) {

		// 신규 추천 펫시터 3명
		ArrayList<PetsitterVO> petsitter_list_date = petsitterService.petsitterList_date();
		if(petsitter_list_date.size() != 0) {
			for(int i = 0; i < petsitter_list_date.size(); i++) {
				String[] address = petsitter_list_date.get(i).getPETSITTER_ADDRESS().split(",")[1].split(" ");
				petsitter_list_date.get(i).setPETSITTER_ADDRESS(address[0] + " " + address[1]);
			}
		}
		
		// 이달의 펫시터
		PetsitterVO petsitter_this_month = petsitterService.petsitter_thisMonth();
		if(petsitter_this_month != null) {
			petsitter_this_month.setPETSITTER_ADDRESS(petsitter_this_month.getPETSITTER_ADDRESS().split(",")[1].split(" ")[0] + " " + 
					  								  petsitter_this_month.getPETSITTER_ADDRESS().split(",")[1].split(" ")[1]);
		}
		
		// 이달의 평점왕
		PetsitterVO petsitter_this_month_score = petsitterService.petsitter_thisMonth_score();
		if(petsitter_this_month_score != null) {
			petsitter_this_month_score.setPETSITTER_ADDRESS(petsitter_this_month_score.getPETSITTER_ADDRESS().split(",")[1].split(" ")[0] + " " + 
															petsitter_this_month_score.getPETSITTER_ADDRESS().split(",")[1].split(" ")[1]);
		}
		
		// 이달의 실적왕
		PetsitterVO petsitter_this_month_count = petsitterService.petsitter_thisMonth_count();
		if(petsitter_this_month_count != null) {
			petsitter_this_month_count.setPETSITTER_ADDRESS(petsitter_this_month_count.getPETSITTER_ADDRESS().split(",")[1].split(" ")[0] + " " + 
															petsitter_this_month_count.getPETSITTER_ADDRESS().split(",")[1].split(" ")[1]);
		}
		
		model.addAttribute("petsitter_list_date", petsitter_list_date);
		model.addAttribute("petsitter_this_month", petsitter_this_month);
		model.addAttribute("petsitter_this_month_score", petsitter_this_month_score);
		model.addAttribute("petsitter_this_month_count", petsitter_this_month_count);

		ArrayList<PetsitterVO> list = new ArrayList<PetsitterVO>();
		list = petsitterService.petsitterList();
		model.addAttribute("list",list);
		
		return "home";
	}
	
	@RequestMapping(value = "loginform.me")
	public String loginform() {
		return "loginform";
	}
	
	@RequestMapping(value="member_login.me")
	public String memberLogin(MemberVO vo, HttpSession session) {
		int res = memberService.memberCheck(vo);
		MemberVO membervo = memberService.selectMember(vo.getMEMBER_ID());
		
		if(res == 1) {
			session.setAttribute("id", membervo.getMEMBER_ID());
			session.setAttribute("name", membervo.getMEMBER_NAME());
			session.setAttribute("rank", membervo.getMEMBER_RANK());
			return "redirect:/home.me";
		}else {
			return "loginform";
		}
		
	}

	@RequestMapping(value = "memberUpdate.me")
	public String member_update(MemberVO vo, HttpServletRequest request) throws Exception {
		String[] address = request.getParameterValues("MEMBER_ADDRESS");
		if(address[0].equals("")) {
			vo.setMEMBER_ADDRESS("N");
		}else {
			vo.setMEMBER_REAL_ADDRESS(address[0] + " " + address[1] + " " + address[2]);
		}
		MultipartFile mf = vo.getMEMBER_PHOTO();
		String uploadPath = "C:\\Project156\\upload\\";
		
		MemberVO member = memberService.selectMember(vo.getMEMBER_ID());
		if(vo.getMEMBER_GENDER() == null) {
			vo.setMEMBER_GENDER("N");
		}
		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			mf.transferTo(new File(uploadPath+storedFileName));
			vo.setMEMBER_PHOTO_FILE(storedFileName);
		} else {
			vo.setMEMBER_PHOTO_FILE(member.getMEMBER_PHOTO_FILE());
		}
		
		memberService.updateMember(vo);

		return "redirect:/memberinfo.me?id=" + vo.getMEMBER_ID();
	}
	
	@RequestMapping(value = "logout.me")
	public String member_logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("rank");
		return "redirect:/home.me";
	}
	
	@RequestMapping(value = "member_join.me")
	public String member_join(MemberVO vo) {
		memberService.memberInsert(vo);
		
		return "redirect:/home.me";
	}
}
