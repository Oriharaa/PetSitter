package com.spring.petsitter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
		
		MemberVO membervo = memberService.selectMember(id);
		mv.addObject("membervo", membervo);
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
	
	@RequestMapping(value = "call_view.me")
	public String call_view() {
		return "call_view";
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
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
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
			System.out.println("아이디: " + membervo.getMEMBER_ID());
			System.out.println("이름: " + membervo.getMEMBER_NAME());
			System.out.println("로그인 성공");
			return "home";
		}else {
			System.out.println("로그인 실패");
			return "loginform";
		}
		
	}

	@RequestMapping(value = "memberUpdate.me")
	public String member_update(MemberVO vo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String[] tel = request.getParameterValues("MEMBER_TEL");
		String[] address = request.getParameterValues("MEMBER_ADDRESS");
		vo.setMEMBER_TEL(tel[0] + tel[1] + tel[2]);
		vo.setMEMBER_ADDRESS(address[0] + " " + address[1]);
		memberService.updateMember(vo);

		return "redirect:/home.me";
	}
	
	@RequestMapping(value = "logout.me")
	public String member_logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.me";
	}
	
	@RequestMapping(value = "member_join.me")
	public String member_join(MemberVO vo) {
		int res = memberService.memberInsert(vo);
		if(res == 1) {
			System.out.println("회원가입 성공");
		}
		return "home";
	}
	
	
	
	
	//언택 추가
	//원하는 조건별
	@RequestMapping(value = "getPetsitterList_We_Pick.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Pick() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Pick();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value = "getPetsitterList_We_Big.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Big() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Big();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}	
	@RequestMapping(value = "getPetsitterList_We_Yard.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Yard() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Yard();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}	
	@RequestMapping(value = "getPetsitterList_We_Old.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Old() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Old();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}	
	
	//평점순
	@RequestMapping(value ="getPetsitterList_We_Grade.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Grade() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Grade();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	
	//지역별
	@RequestMapping(value ="getPetsitterList_We_Area1.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area1() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area1();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area2.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area2() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area2();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area3.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area3() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area3();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area4.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area4() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area4();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area5.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area5() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area5();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area6.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area6() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area6();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area7.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area7() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area7();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area8.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area8() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area8();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area9.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area9() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area9();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	@RequestMapping(value ="getPetsitterList_We_Area10.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We_Area10() {
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We_Area10();
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			
			if(petsitter.getPETSITTER_ADDRESS() != null) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(petsitter.getPETSITTER_SERVICE_LIST() != null) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
