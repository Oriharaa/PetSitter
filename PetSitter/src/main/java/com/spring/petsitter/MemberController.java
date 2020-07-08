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

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private PetService petService;
	
	@RequestMapping(value = "notice.me")
	public String notice(Model model) {
		return "notice";
	}
	
	@RequestMapping(value = "memberinfo.me")
	public ModelAndView profile(MemberVO vo, @RequestParam(value = "id") String id) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member(id);
		
		MemberVO membervo = memberService.selectMember(id);
		String[] tel = membervo.getMEMBER_TEL().split("-");
		String[] address = membervo.getMEMBER_ADDRESS().split(",");
		mv.addObject("membervo", membervo);
		mv.addObject("tel", tel);
		mv.addObject("address", address);
		mv.addObject("usinglist", usinglist);
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
		if(res ==1) {
			System.out.println("complete!");
		}
		return "petRegister2";
	}
	
	@RequestMapping(value = "getUsingList.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberUsinglistVO> getUsinglist(String id) {
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member(id);
		List<MemberUsinglistVO> usinglist_ajax = memberService.getUsingList_Member_ajax(id);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = new_Format.format(date);
		
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
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		
		return usinglist_ajax;
	}
	
	@RequestMapping(value = "getUsingList_month.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberUsinglistVO> getUsinglist_month(String id, int month) {
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member_month(id, -month);
		List<MemberUsinglistVO> usinglist_ajax = memberService.getUsingList_Member_ajax_month(id, -month);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = new_Format.format(date);
		
		for(int i = 0; i < usinglist_ajax.size(); i++) {
			usinglist_ajax.get(i).setLIST_START_DATE(new_Format.format(usinglist.get(i).getLIST_START_DATE()));
			usinglist_ajax.get(i).setLIST_END_DATE(new_Format.format(usinglist.get(i).getLIST_END_DATE()));
			
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
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		
		return usinglist_ajax;
	}
	
	@RequestMapping(value = "getUsingList_calendar.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<MemberUsinglistVO> getUsinglist_calendar(String id, String startdate, String enddate) {
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member_calendar(id, startdate, enddate);
		List<MemberUsinglistVO> usinglist_ajax = memberService.getUsingList_Member_ajax_calendar(id, startdate, enddate);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String today = new_Format.format(date);
		
		for(int i = 0; i < usinglist_ajax.size(); i++) {
			usinglist_ajax.get(i).setLIST_START_DATE(new_Format.format(usinglist.get(i).getLIST_START_DATE()));
			usinglist_ajax.get(i).setLIST_END_DATE(new_Format.format(usinglist.get(i).getLIST_END_DATE()));
			
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
			} else {
				usinglist_ajax.get(i).setLIST_COMPLETE("리뷰 남기기");
			}
		}
		
		return usinglist_ajax;
	}
	
	// 위탁 돌봄 예약 페이지 이동
	@RequestMapping(value = "reservation1.br")
	public String reservation1() {
		
		return "reservation";
	}
	
	@RequestMapping(value = "getPetsitterList_We.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(!petsitter.getPETSITTER_ADDRESS().equals("N")) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(!petsitter.getPETSITTER_SERVICE_LIST().equals("N")) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	
	// 방문 돌봄 예약 페이지 이동
	@RequestMapping(value = "reservation2.br")
	public String reservation2() {
		
		return "reservation2";
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
			return "home";
		}else {
			System.out.println("로그인 실패");
			return "loginform";
		}
		
	}

	@RequestMapping(value = "memberUpdate.me")
	public String member_update(MemberVO vo, HttpServletRequest request) throws Exception {
		String[] tel = request.getParameterValues("MEMBER_TEL");
		String[] address = request.getParameterValues("MEMBER_ADDRESS");
		vo.setMEMBER_TEL(tel[0] + "-"  + tel[1] + "-" + tel[2]);
		vo.setMEMBER_REAL_ADDRESS(address[0] + " " + address[1] + "(" + address[2] + ")" + " " + address[3]);
		
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
