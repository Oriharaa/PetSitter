package com.spring.petsitter;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private ReviewBoardService reviewboardService;
	
	@RequestMapping(value = "notice.me")
	public String notice(Model model) {
		return "notice";
	}
	
	@RequestMapping(value = "memberinfo.me")
	public ModelAndView profile(MemberVO vo, @RequestParam(value = "id") String id, Model model) {
		ModelAndView mv = new ModelAndView();
		
		MemberVO membervo = memberService.selectMember(id);
		String[] tel = membervo.getMEMBER_TEL().split("-");
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
	
	@RequestMapping(value = "call_view.me")
	public String call_view() {
		return "call_view";
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
			
			String ing = "";
			int compare1 = usinglist_ajax.get(i).getLIST_START_DATE().compareTo(today);
			int compare2 = today.compareTo(usinglist_ajax.get(i).getLIST_END_DATE());
			if(compare1 < 0 && compare2 < 0) {
  				ing = "현재 이용중";
  			} else {
  				ing = "이용 완료";
  			}
			usinglist_ajax.get(i).setLIST_ING(ing);
			
			if(ing.equals("현재 이용중")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("펫시터와의 소통");
			} else if(usinglist_num_member.contains(usinglist_ajax.get(i).getLIST_NUM())) { // 리뷰 작성 했는지 안했는지 확인
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 완료");
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		
		
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
			
			String ing = "";
			int compare1 = usinglist_ajax.get(i).getLIST_START_DATE().compareTo(today);
			int compare2 = today.compareTo(usinglist_ajax.get(i).getLIST_END_DATE());
			if(compare1 < 0 && compare2 < 0) {
  				ing = "현재 이용중";
  			} else {
  				ing = "이용 완료";
  			}
			usinglist_ajax.get(i).setLIST_ING(ing);
			
			if(ing.equals("현재 이용중")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("펫시터와의 소통");
			} else if(usinglist_num_member.contains(usinglist_ajax.get(i).getLIST_NUM())) { // 리뷰 작성 했는지 안했는지 확인
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 완료");
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
			
			String ing = "";
			int compare1 = usinglist_ajax.get(i).getLIST_START_DATE().compareTo(today);
			int compare2 = today.compareTo(usinglist_ajax.get(i).getLIST_END_DATE());
			if(compare1 < 0 && compare2 < 0) {
  				ing = "현재 이용중";
  			} else {
  				ing = "이용 완료";
  			}
			usinglist_ajax.get(i).setLIST_ING(ing);
			
			
			if(ing.equals("현재 이용중")) {
				usinglist_ajax.get(i).setLIST_COMPLETE("펫시터와의 소통");
			} else if(usinglist_num_member.contains(usinglist_ajax.get(i).getLIST_NUM())) { // 리뷰 작성 했는지 안했는지 확인
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 완료");
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		return usinglist_ajax;
	}
	
	
	
	@RequestMapping(value = "reportlist.me")
	public String reportlist(Model model) {
		return "reportlist";
	}
	
	@RequestMapping(value = "write.me")
	public String write(Model model) {
		return "write";
	}
	
	
	@RequestMapping(value = "basicform.me")
	public String basicform(Model model) {

	
		return "basicform";
	}
	
	@RequestMapping(value = "home.me")
	public String home() {
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
			return "home";
		}else {
			return "loginform";
		}
		
	}

	@RequestMapping(value = "memberUpdate.me")
	public String member_update(MemberVO vo, HttpServletRequest request) throws Exception {
		String[] tel = request.getParameterValues("MEMBER_TEL");
		String[] address = request.getParameterValues("MEMBER_ADDRESS");
		vo.setMEMBER_TEL(tel[0] + "-"  + tel[1] + "-" + tel[2]);
		vo.setMEMBER_REAL_ADDRESS(address[0] + " " + address[1] + " " + address[2]);
		
		MultipartFile mf = vo.getMEMBER_PHOTO();
		String uploadPath = "C:\\Project156\\upload\\";

		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			mf.transferTo(new File(uploadPath+storedFileName));
			vo.setMEMBER_PHOTO_FILE(storedFileName);
		} else {
			vo.setMEMBER_PHOTO_FILE("N");
		}
		
		memberService.updateMember(vo);

		return "redirect:/memberinfo.me?id=" + vo.getMEMBER_ID();
	}
	
	@RequestMapping(value = "logout.me")
	public String member_logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.me";
	}
	
	@RequestMapping(value = "member_join.me")
	public String member_join(MemberVO vo) {
		memberService.memberInsert(vo);
		
		return "home";
	}
	

	
}
