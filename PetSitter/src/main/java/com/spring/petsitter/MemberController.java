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
	
	@RequestMapping(value = "notice.me")
	public String notice(Model model) {
		return "notice";
	}
	
	@RequestMapping(value = "memberinfo.me")
	public ModelAndView profile(MemberVO vo, @RequestParam(value = "id") String id) {
		ModelAndView mv = new ModelAndView();
		ArrayList<UsinglistVO> usinglist = memberService.getUsingList_Member(id);
		ArrayList<PetsitterVO> petsitterlist = new ArrayList<PetsitterVO>();
		PetsitterVO petsitter = new PetsitterVO();
		
		for(int i = 0; i < usinglist.size(); i++) {
			petsitter = petsitterService.selectPetsitter(usinglist.get(i).getPETSITTER_ID());
			petsitterlist.add(petsitter);
		}
		MemberVO membervo = memberService.selectMember(id);
		mv.addObject("membervo", membervo);
		mv.addObject("petsitterlist", petsitterlist);
		mv.addObject("usinglist", usinglist);
		mv.setViewName("memberinfo");
		return mv;
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
			System.out.println("dd: " + usinglist.get(i).getLIST_START_DATE());
			usinglist_ajax.get(i).setLIST_START_DATE(new_Format.format(usinglist.get(i).getLIST_START_DATE()));
			System.out.println(usinglist_ajax.get(i).getLIST_START_DATE());
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
}
